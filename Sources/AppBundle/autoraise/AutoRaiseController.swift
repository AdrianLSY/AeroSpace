import AppKit
import AutoRaiseCore
import Common

// Owns the AutoRaiseCore lifecycle (design.md §D4) and reconciles three state
// sources: the TOML `[auto-raise]` section (startup + file-watcher reloads),
// the runtime toggle commands (enable-auto-raise / disable-auto-raise), and
// the macOS NSWorkspace observer hooks fanned out from GlobalObserver.
//
// Precedence rule (§D8): a runtime disable is sticky across config reloads.
// Once the user runs `disable-auto-raise`, touching the config file does not
// silently re-enable hover-raise. Running `enable-auto-raise` clears the
// sticky flag.
@MainActor enum AutoRaiseController {
    private static var lastConfig: AutoRaiseConfig?
    private static var runtimeDisabled: Bool = false
    private static var routeCallbackInstalled: Bool = false

    static var isEnabled: Bool { autoraise_is_running() }

    // User-triggered start — called at boot (gated on config.enabled) and by
    // `enable-auto-raise`. Ignores config.enabled at this layer: the caller
    // decided to start, we start. Clears the sticky runtime-disabled flag.
    static func start(config: AutoRaiseConfig) {
        runtimeDisabled = false
        lastConfig = config
        installRouteCallbackOnce()
        let bridge = config.toBridge()
        if autoraise_is_running() {
            autoraise_reload(bridge)
        } else {
            autoraise_start(bridge)
        }
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
        if config.enabled {
            installRouteCallbackOnce()
            let bridge = config.toBridge()
            if autoraise_is_running() {
                autoraise_reload(bridge)
            } else {
                autoraise_start(bridge)
            }
        } else {
            if autoraise_is_running() { autoraise_stop() }
        }
    }

    // Fanned out from GlobalObserver (design.md §D6).
    static func onActiveSpaceDidChange() { autoraise_on_active_space_did_change() }
    static func onAppDidActivate() { autoraise_on_app_did_activate() }

    private static func installRouteCallbackOnce() {
        if routeCallbackInstalled { return }
        autoraise_set_route_callback(RaiseRouter.cCallback)
        routeCallbackInstalled = true
    }
}
