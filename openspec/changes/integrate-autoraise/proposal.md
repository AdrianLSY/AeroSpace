# integrate-autoraise

## Why

AeroSpace is a tiling window manager; it does not currently implement focus-follows-mouse with raise-on-hover. AutoRaise is a single-file Objective-C++ program that does this well, and is already tracked in this repo as a git submodule at `AutoRaise/` pointing at [AdrianLSY's fork](https://github.com/AdrianLSY/AutoRaise) of upstream AutoRaise. Running AutoRaise as a separate process alongside AeroSpace would mean two processes both driving AX focus, two config files, two Accessibility permission prompts, and no shared model — hovering a window would change native macOS focus but leave AeroSpace's tree/focus state chasing behind.

Porting AutoRaise into `AppBundle` makes hover-raise a first-class AeroSpace feature: one process, one TOML config, one AX permission, and every raise flows through AeroSpace's `setFocus(to:)` so the tree model stays consistent.

## What Changes

- Move AutoRaise's event-driven hover-raise core into `Sources/AppBundle/autoraise/` as a new ObjC++ SPM target (`AutoRaiseCore`) linked into `AppBundle`.
- Drop features not wanted in the port: cmd-tab mouse warp, `CGSSetCursorScale` cursor-scale animation (private SkyLight API), the `-verbose` CLI flag, the 5.x → 6.0 config-migration path, and the standalone `main()` / `NSApplication` bootstrap.
- Route raises through a Swift bridge (`RaiseRouter.swift`): AutoRaise hands a `CGWindowID` back to Swift, Swift maps it to an AeroSpace `Window`, enforces the "current workspace only" rule, and calls `setFocus(to:)`.
- Unify NSWorkspace observers: AutoRaise's `MDWorkspaceWatcher` is removed; `GlobalObserver` forwards the relevant events to `AutoRaiseController` directly.
- `CGEventTap` (mouse-moved + key events) is owned by `AutoRaiseController`, installed on start, torn down on stop.
- Add `[auto-raise]` section to aerospace TOML config with: `enabled`, `poll-millis`, `ignore-space-changed`, `invert-disable-key`, `invert-ignore-apps`, `ignore-apps`, `ignore-titles`, `stay-focused-bundle-ids`, `disable-key`.
- Add new commands: `enable-auto-raise`, `disable-auto-raise` (runtime toggle, bindable to a keybind).
- `ConfigFileWatcher` live-reload calls `AutoRaiseController.reload(config)`.
- AeroSpace's LICENSE gains a note that the combined binary is distributed under GPL-2.0-or-later (AutoRaise's license) because GPL copyleft propagates to the linked binary.
- The `AutoRaise/` submodule is removed once the port lands.

## Impact

- **Affected capabilities**: new `auto-raise` capability.
- **Affected code**:
  - New: `Sources/AppBundle/autoraise/` (`AutoRaise.mm`, `AutoRaiseBridge.{h,mm}`, `AutoRaiseController.swift`, `RaiseRouter.swift`).
  - New: `Sources/Common/cmdArgs/impl/{Enable,Disable}AutoRaiseCmdArgs.swift`, `Sources/AppBundle/command/impl/{Enable,Disable}AutoRaiseCommand.swift`, registered in `cmdArgsManifest.swift` and `cmdManifest.swift`.
  - Modified: `Package.swift` (new target), `project.yml` (XcodeGen), `Sources/AppBundle/GlobalObserver.swift` (forwards to controller), `Sources/AppBundle/initAppBundle.swift` (starts controller after observer init), config parsing, `ConfigFileWatcher`, docs, shell-completion grammar, generated files.
  - Removed: `AutoRaise/` submodule, `.gitmodules` entry.
- **License**: AeroSpace binary becomes GPL-2.0-or-later. Source files retain their original headers; combined-work notice added to repo LICENSE.
- **Downstream behavior**: `on-focus-changed` callbacks fire on every hover-raise by design — users who bind expensive commands to that callback will see them fire more often; documented in the new config section.
- **Out of scope**: cmd-tab mouse warp, cursor-scale animation, any new AX permission flow (existing AeroSpace permission covers AutoRaise's needs since both use the same AX APIs).
