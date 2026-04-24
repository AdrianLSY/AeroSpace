import AppKit
import AutoRaiseCore
import Common

// Owns the AutoRaiseCore lifecycle (design.md §D4) and reconciles four state
// sources: the TOML `[auto-raise]` section (startup + file-watcher reloads),
// the runtime toggle commands (enable-auto-raise / disable-auto-raise), the
// master `enable on/off` toggle (via pauseForMaster / resumeFromMaster), and
// the macOS NSWorkspace observer hooks fanned out from GlobalObserver.
//
// Precedence rules:
//   - Runtime disable is sticky across config reloads (§D8). Once the user
//     runs `disable-auto-raise`, touching the config file does not silently
//     re-enable hover-raise. Running `enable-auto-raise` clears the flag.
//   - The master toggle takes effect independently: `enable off` stops the
//     bridge and snapshots the running state; `enable on` restores it. The
//     snapshot is NOT sticky — it's only consulted across a single
//     off→on cycle.
@MainActor enum AutoRaiseController {
    private static var lastConfig: AutoRaiseConfig?
    private static var runtimeDisabled: Bool = false
    private static var routeCallbackInstalled: Bool = false
    // Non-nil while the bridge is paused by `enable off`. Carries the config
    // that was in effect at pause time so `enable on` can restart cleanly.
    private static var masterPauseSnapshot: AutoRaiseConfig?

    static var isEnabled: Bool { autoraise_is_running() }

    // True when `disable-auto-raise` has disabled the bridge AND the bridge
    // is currently not running. Used by `disable-auto-raise` to detect true
    // no-op invocations (already stopped AND sticky flag set).
    static var isNoopForDisableCommand: Bool { !isEnabled && runtimeDisabled }

    // User-triggered start — called at boot (gated on config.enabled) and by
    // `enable-auto-raise`. Ignores config.enabled at this layer: the caller
    // decided to start, we start. Clears the sticky runtime-disabled flag.
    // Returns true iff the bridge is running after the call — false means the
    // tap could not be installed (typically: Accessibility permission missing).
    @discardableResult
    static func start(config: AutoRaiseConfig) -> Bool {
        runtimeDisabled = false
        lastConfig = config
        installRouteCallbackOnce()
        let bridge = config.toBridge()
        if autoraise_is_running() {
            autoraise_reload(bridge)
            return true
        }
        return autoraise_start(bridge)
    }

    // User-triggered stop — `disable-auto-raise`. Sets the sticky flag so a
    // subsequent config reload doesn't silently re-enable.
    static func stop() {
        runtimeDisabled = true
        if autoraise_is_running() { autoraise_stop() }
    }

    // Config-file-watcher reload. Respects the sticky runtime-disabled flag;
    // otherwise mirrors start/stop based on config.enabled.
    static func reload(config: AutoRaiseConfig) {
        lastConfig = config
        if runtimeDisabled { return }
        if masterPauseSnapshot != nil {
            // Paused by `enable off`. Update the snapshot so the eventual
            // `enable on` resumes with the newest config, but don't restart
            // the bridge here.
            masterPauseSnapshot = config
            return
        }
        if config.enabled {
            installRouteCallbackOnce()
            let bridge = config.toBridge()
            if autoraise_is_running() {
                autoraise_reload(bridge)
            } else {
                _ = autoraise_start(bridge)
            }
        } else {
            if autoraise_is_running() { autoraise_stop() }
        }
    }

    // Called by EnableCommand when the master toggle flips to off. Snapshots
    // the currently-applied config (if the bridge was running) so the
    // corresponding `enable on` can restart with it. Does NOT mutate
    // runtimeDisabled — a user-level disable survives a master-off/on cycle.
    static func pauseForMaster() {
        guard autoraise_is_running(), let config = lastConfig else { return }
        masterPauseSnapshot = config
        autoraise_stop()
    }

    // Called by EnableCommand when the master toggle flips to on. If a
    // snapshot is pending AND the user hasn't sticky-disabled, restart.
    static func resumeFromMaster() {
        guard let config = masterPauseSnapshot else { return }
        masterPauseSnapshot = nil
        if runtimeDisabled { return }
        installRouteCallbackOnce()
        _ = autoraise_start(config.toBridge())
    }

    // Fanned out from GlobalObserver (design.md §D6).
    static func onActiveSpaceDidChange() { autoraise_on_active_space_did_change() }
    static func onAppDidActivate() { autoraise_on_app_did_activate() }

    // Called at the end of runLightSession. AeroSpace's own commands can pull
    // the window out from under the cursor (move-node-to-workspace, close,
    // layout, flatten-workspace-tree, …) without a macOS-level space change,
    // so the mouse-event-driven auto-raise path never fires.
    //
    // We deliberately skip AutoRaiseCore's hit-test here. layoutWorkspaces
    // sets window frames via AXUIElementSetAttributeValue, which propagates
    // to each target app's AX server asynchronously — an immediate AX
    // hit-test races with that round-trip. AeroSpace just wrote the layout
    // itself, so `lastAppliedLayoutPhysicalRect` is the authoritative source
    // for "where is window X on screen right now". Walk the focused
    // workspace's tree instead and route directly.
    static func onLayoutDidChange() {
        guard isEnabled else { return }
        let cursor = CGEvent(source: nil)?.location ?? .zero
        let workspace = focus.workspace
        guard let window = workspace.allLeafWindowsRecursive.first(where: {
            $0.lastAppliedLayoutPhysicalRect?.contains(cursor) == true
        }) else { return }
        RaiseRouter.route(windowId: CGWindowID(window.windowId))
    }

    private static func installRouteCallbackOnce() {
        if routeCallbackInstalled { return }
        autoraise_set_route_callback(RaiseRouter.cCallback)
        routeCallbackInstalled = true
    }
}
