# Design: integrate-autoraise

## Context

AutoRaise is ~1322 lines of Objective-C++ (`AutoRaise/AutoRaise.mm`), purely event-driven via `CGEventTap`, with its own NSWorkspace observers, its own config file parser, and its own `main()`. It uses the macOS Accessibility API to resolve the window under the cursor and raise it via `AXUIElementPerformAction(kAXRaiseAction)` + `NSRunningApplication.activate`.

AeroSpace already uses one private API — `_AXUIElementGetWindow` — exposed via the `PrivateApi` C-shim SPM target at `Sources/PrivateApi/include/private.{h,m}`. That pattern proves SPM can build Objective-C code alongside Swift in this project.

The current AeroSpace focus model is authoritative: `focus.swift` holds `_focus: FrozenFocus`; every focus change goes through `setFocus(to: LiveFocus)` which updates the tree's most-recent-child, sets the monitor's active workspace, and lets subsequent refresh sessions reconcile. `on-focus-changed` user callbacks fire from `checkOnFocusChangedCallbacks()` during refresh.

`GlobalObserver` (`Sources/AppBundle/GlobalObserver.swift`) is the single subscription point for NSWorkspace notifications: `didLaunch`, `didActivate`, `didHide`, `didUnhide`, `activeSpaceDidChange`, `didTerminate`, plus a global `leftMouseUp` monitor. Every handler schedules a refresh session.

## Decisions

### D1. Port the source, don't rewrite

AutoRaise's value is in the subtle macOS behaviors already debugged upstream: `WINDOW_CORRECTION` (3px transparent Monterey border), `MENUBAR_CORRECTION`, the retry schedule at 50ms/100ms for Electron/Finder AX flakiness, the `raiseGeneration` cancellation discipline, AX-element recursive walk to find the right `AXWindow`/`AXSheet`/`AXDrawer`. Rewriting all that in Swift would be recreating footguns one at a time.

Instead: copy `AutoRaise.mm` into `Sources/AppBundle/autoraise/`, strip the parts we don't want (main, NSApp, ConfigClass file IO, warp, cursor scale, `MDWorkspaceWatcher`, `-verbose`, 5.x migration), and expose a small C entry-point surface the Swift side drives.

### D2. New SPM target `AutoRaiseCore`

Don't put ObjC++ inside the existing `AppBundle` target — SPM's target model expects per-target language settings, and `AppBundle` is Swift. Mirror the `PrivateApi` pattern: a dedicated target with its own include dir, module map, and `-fobjc-arc` flag.

```
Sources/
  AutoRaiseCore/
    AutoRaise.mm
    AutoRaiseBridge.mm
    include/
      AutoRaiseBridge.h    ← exposed to Swift via module map
      module.modulemap
```

`AppBundle` adds `.target(name: "AutoRaiseCore")` as a dependency in `Package.swift`, and `project.yml` gets the matching Xcode target entry (regenerated via `./generate.sh`).

### D3. Globals stay globals

AutoRaise.mm has file-scope state (`axObserver`, `eventTap`, `lastCheckTime`, `suppressRaisesUntil`, `raiseGeneration`, the config NSArrays for ignore-lists, etc.). Making that reentrant or instance-based would be a major refactor and we only ever have one AutoRaise instance in one process. Keep the globals; the library is a de-facto singleton.

### D4. Swift owns lifecycle

`AutoRaiseController` (Swift, `@MainActor`) is the only thing AppBundle calls. Its API:

```swift
@MainActor enum AutoRaiseController {
    static func start(config: AutoRaiseConfig)
    static func stop()
    static func reload(config: AutoRaiseConfig)
    static var isEnabled: Bool { get }

    // Called by GlobalObserver (D6)
    static func onActiveSpaceDidChange()
    static func onAppDidActivate()
}
```

All four `start`/`stop`/`reload`/observer methods translate to C entry points in `AutoRaiseBridge.h`:

```c
void autoraise_start(const AutoRaiseConfigC *config);
void autoraise_stop(void);
void autoraise_reload(const AutoRaiseConfigC *config);
void autoraise_on_active_space_did_change(void);
void autoraise_on_app_did_activate(void);
```

`AutoRaiseConfigC` is a plain C struct with primitive fields and NUL-terminated C strings (the ignore-list arrays are flattened to newline-separated strings or `char **` + `size_t` pairs — implementation detail).

### D5. Raise routing via Swift callback

Replace AutoRaise's `raiseAndActivate` internals with a call out to Swift:

```c
// In AutoRaiseBridge.h, a function pointer the ObjC++ side calls:
typedef void (*AutoRaiseRouteRaise)(uint32_t cgWindowId);
void autoraise_set_route_callback(AutoRaiseRouteRaise cb);
```

`RaiseRouter.swift` provides the callback:

```swift
enum RaiseRouter {
    @MainActor static func route(windowId: CGWindowID) {
        guard let window = Window.get(byId: windowId) else { return }
        // D7: ignore windows not on the currently-focused workspace
        guard window.visualWorkspace == focus.workspace else { return }
        _ = window.focusWindow()
    }
}
```

The key property: AutoRaise still decides *when* and *which window* to raise (all its AX walking, pixel corrections, suppression, retries); AeroSpace decides *how* to make that focus change land (through its own tree/focus machinery).

**Retry handling**: AutoRaise's 50ms/100ms `dispatch_after` retries must still fire. They call back into Swift each time — `raiseGeneration` in ObjC++ gates them so stale retries no-op, same as upstream. The callback is idempotent: focusing an already-focused window is a no-op in `setFocus(to:)` (returns true early).

### D6. Unified observers

`GlobalObserver.onNotif` fans out. After scheduling AeroSpace's refresh session, it also invokes the corresponding controller method inline:

```swift
// Sketch, inside GlobalObserver.onNotif:
switch notifName {
case NSWorkspace.activeSpaceDidChangeNotification.rawValue:
    AutoRaiseController.onActiveSpaceDidChange()
case NSWorkspace.didActivateApplicationNotification.rawValue:
    AutoRaiseController.onAppDidActivate()
default: break
}
```

AutoRaise's ObjC++ side no longer subscribes to NSWorkspace — `MDWorkspaceWatcher` is removed. The bridge methods call directly into the relevant internal functions (`spaceChanged()`, `appActivated()` minus the warp path).

**Ordering**: Swift schedules AeroSpace's refresh session (async) *then* calls AutoRaise's handler (sync on main actor). AutoRaise's raise — if any — routes through `setFocus(to:)`, which takes effect immediately and the *next* refresh session reconciles. Net effect: both paths converge on a consistent final state, regardless of which handler "won" a given tick.

### D7. Current-workspace-only rule

`RaiseRouter.route` drops any raise whose target window is not on `focus.workspace`. Rationale: matches i3 behavior, avoids surprise workspace flips when the cursor enters a screen region that happens to contain a window belonging to a non-active workspace. This is checked in Swift (where the tree model lives), not in ObjC++ — AutoRaise has no notion of workspaces.

### D8. Runtime toggle commands

New commands:

- `enable-auto-raise` — calls `AutoRaiseController.start(config.autoRaise)` if not already running.
- `disable-auto-raise` — calls `AutoRaiseController.stop()`.

Both follow the standard command checklist from `CLAUDE.md` §"Adding / modifying a command": args model in `Sources/Common/cmdArgs/impl/`, impl in `Sources/AppBundle/command/impl/`, docs in `docs/aerospace-enable-auto-raise.adoc` + `docs/aerospace-disable-auto-raise.adoc`, shell-completion grammar, `./generate.sh` run to update generated files.

The config key `[auto-raise].enabled` controls startup state; the commands override at runtime. Config reloads (file watcher) do not override a runtime toggle — if the user ran `disable-auto-raise`, a config reload won't silently re-enable it.

### D9. Event tap lifecycle

`AutoRaiseController.start` installs the `CGEventTap`; `stop` calls `CGEventTapEnable(tap, false)` and releases. The tap is listen-only (must return the event unmodified, same as upstream) and observes only `kCGEventMouseMoved`.

We don't intercept `kCGEventKeyDown` / `kCGEventFlagsChanged` to implement the `disable-key` check: upstream's approach of polling current modifier state via `CGEventCreateKeyboardEvent(NULL, 0, true)` + `CGEventGetFlags` is preserved in `performRaiseCheck`, so there's no need to intercept the key stream just to know which modifiers are held. Narrower mask = less tap overhead and no `kCGEventFlagsChanged` re-entrancy to worry about.

The tap's recovery path (when the system disables it under load) is preserved: the handler re-enables via `CGEventTapEnable(tap, true)` on `kCGEventTapDisabledByTimeout` / `kCGEventTapDisabledByUserInput`.

### D10. Config bridge

`Config` (`Sources/AppBundle/config/Config.swift`) gains an `autoRaise: AutoRaiseConfig` field. TOML section parsed by new code in `parseConfig.swift`. On startup and on `ConfigFileWatcher` reload, `AutoRaiseController.reload(config.autoRaise)` is called — the controller diffs against last-applied and re-applies only changed fields via `autoraise_reload`.

Deprecated keys (the 5.x migration path in AutoRaise: `delay`, `focusDelay`, `requireMouseStop`, `mouseDelta`) are **not** ported — they never existed in AeroSpace's config, so there's no migration burden.

### D11. License propagation

`AutoRaise.mm` is GPL-2.0-or-later. Compiling it into the AeroSpace binary means the binary is GPL-2.0-or-later (the MIT-licensed source files remain MIT in the repo, but the combined binary is GPL). Housekeeping:

- Keep AutoRaise's copyright header on `Sources/AutoRaiseCore/AutoRaise.mm`.
- Add `LICENSE-GPL` at repo root containing the full GPL-2.0-or-later text (for compliance when distributing the binary).
- Update `LICENSE` (or README) with a short note: "AeroSpace binaries include code from AutoRaise (GPL-2.0-or-later). Source of individual files remains under their respective headers; the combined binary is distributed under GPL-2.0-or-later."

## Alternatives Considered

- **Ship AutoRaise as a child process bundled in `.app/Contents/MacOS/`** — preserves the license boundary (mere aggregation). Rejected because the user explicitly wants a single-process integration with tree-aware raises.
- **Clean-room reimplement in Swift** — avoids GPL propagation. Rejected: user accepts GPL; reimplementing ~1300 lines of hard-won macOS AX workarounds is high-risk for no license benefit we care about.
- **Keep parallel NSWorkspace observers** — simpler initial port. Rejected in favor of unified observers from the start (explicit user decision).
- **Port warp / cursor-scale** — rejected. Private SkyLight API (`CGSSetCursorScale`) is a liability; cmd-tab warp is tangential to hover-raise and overlaps with AeroSpace's `move-mouse` command.

## Risks & Unknowns

- **`on-focus-changed` firing on every hover** is intentional but may be surprising in practice; doc it loudly in the new config section.
- **Cross-workspace hover suppression** needs to be robust against edge cases: a window that moves workspace mid-hover, a workspace-switch that happens during a pending retry, etc. `raiseGeneration` handles stale retries in ObjC++; Swift's check against `focus.workspace` at route-time handles stale targets.
- **`disableKey` interaction with AeroSpace keybindings**: AutoRaise listens for `control`/`option` to temporarily disable raise. AeroSpace's Carbon hotkey registration is orthogonal (different API), so they shouldn't collide, but worth confirming in QA.
- **Event-tap recovery under load**: Apple may disable the tap if the handler blocks. Handler must stay cheap. The Swift callback path goes through `@MainActor` dispatch — we need to confirm this doesn't stall the tap thread. If it does, the tap handler should `dispatch_async` to main rather than block.
- **Initial AX permission prompt**: both processes today prompt separately. After the port, only AeroSpace prompts; AutoRaise's code runs inside AeroSpace's process and inherits the permission. Users upgrading from a side-by-side setup should be told to remove the separate AutoRaise entry from System Settings → Privacy & Security → Accessibility.
