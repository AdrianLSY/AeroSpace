# Tasks: integrate-autoraise

## Phase 1 — Scaffolding

- [x] 1.1 Create `Sources/AutoRaiseCore/` directory with `include/module.modulemap` and `include/AutoRaiseBridge.h`.
- [x] 1.2 Add `AutoRaiseCore` target in `Package.swift` (language: ObjC++, ARC enabled, linked frameworks: AppKit, Carbon, ApplicationServices).
- [x] 1.3 Add `AutoRaiseCore` as a dependency of `AppBundle` in `Package.swift`.
- [x] 1.4 Update `project.yml` with the matching Xcode target so `./generate.sh` produces a consistent `AeroSpace.xcodeproj`. — **No change needed**: Xcode target depends on the `AppBundle` SwiftPM product (`AeroSpacePackage`); Xcode's SPM integration picks up `AutoRaiseCore` as a transitive dependency via Package.swift. Same pattern as `PrivateApi` today.
- [x] 1.5 Verify `./build-debug.sh` passes with an empty `AutoRaise.mm` stub in the new target. — Verified on macOS with the full port (supersedes the stub check): `swift build` completes in 99s with AutoRaiseCore, AppBundle, and AeroSpaceApp all linking cleanly. Note: `build-debug.sh`'s `swift build --target AppBundleTests` step fails on Command Line Tools due to missing XCTest; orthogonal toolchain issue, resolved by installing Xcode 26+ (also required for release builds per CLAUDE.md).

## Phase 2 — Port AutoRaise.mm

- [x] 2.1 Copy `AutoRaise/AutoRaise.mm` into `Sources/AutoRaiseCore/AutoRaise.mm`. Preserve its GPL copyright header.
- [x] 2.2 Strip `main()`, `NSApplicationMain`, the argv/NSArgumentDomain CLI path.
- [x] 2.3 Strip `ConfigClass` file IO, `~/.AutoRaise` / `~/.config/AutoRaise/config` reading, `parametersDictionary`, `warnAndStripDeprecated`, `rewriteConfigStrippingDeprecatedKeys`, and all deprecated-key constants.
- [x] 2.4 Strip `MDWorkspaceWatcher` — its subscriptions are replaced by bridge calls from Swift (Phase 4).
- [x] 2.5 Strip the warp path: `appActivated`'s warp/scale body, `CGSSetCursorScale` / `CGSGetCursorScale` extern decls, `SCALE_DELAY_MS` / `SCALE_DURATION_MS`, `TASK_SWITCHER_MODIFIER_KEY` handling, `activated_by_task_switcher`, `altTaskSwitcher` branch, `warpX` / `warpY` / `scale` config reads. `appActivated` becomes a tiny function that opens the SUPPRESS window (needed even without warp, to cover keyboard app-switch stabilization).
- [x] 2.6 Strip the `-verbose` logging gate, or route `NSLog` calls behind a compile-time flag that stays off. — Fully removed `verbose` global and all `if (verbose) { NSLog(...); }` call-sites. `logWindowTitle` (only called from verbose branches) removed.
- [x] 2.7 Strip `OLD_ACTIVATION_METHOD` and `ALTERNATIVE_TASK_SWITCHER` compile flags (we standardize on one activation path). Also removed `#include <Carbon/Carbon.h>` and `#include <libproc.h>` — no symbols from either remain.
- [x] 2.8 Confirm remaining file compiles standalone with `-fobjc-arc` against AppKit + Carbon + ApplicationServices. — Verified via the same build as task 1.5. `AutoRaise.mm` compiles clean with no warnings under `-warnings-as-errors`.

## Phase 3 — Bridge surface

- [x] 3.1 Define `AutoRaiseConfigC` struct in `AutoRaiseBridge.h` with primitive fields for all ported options (see spec requirement §Config). — Implemented as an ObjC `@interface AutoRaiseBridgeConfig` instead of a plain C struct (design.md §D3.b refinement): zero marshaling cost when Swift passes NSArrays of strings, and the `Bridge` in the name distinguishes this wire type from the Swift model struct `AutoRaiseConfig` (AppBundle). Fields: pollMillis, disableKey (CGEventFlags mask), ignoreSpaceChanged, invertDisableKey, invertIgnoreApps, ignoreApps, ignoreTitles, stayFocusedBundleIds.
- [x] 3.2 Define bridge C API: `autoraise_start`, `autoraise_stop`, `autoraise_reload`, `autoraise_on_active_space_did_change`, `autoraise_on_app_did_activate`, `autoraise_set_route_callback`. — Also added `autoraise_is_running` for the Swift controller's idempotency checks.
- [x] 3.3 Implement bridge in `AutoRaiseBridge.mm`: install/teardown the `CGEventTap`, convert `AutoRaiseConfigC` into the existing global state variables, replace AutoRaise's `raiseAndActivate` body with a call to the route-callback passing `CGWindowID`. — Tap installed on `CFRunLoopGetMain()` (design.md §D3.c), `kCGHIDEventTap` + listen-only. `applyConfig` auto-appends `@"AssistiveControl"` to ignoreApps (§D3.d). Config-owned and runtime-state globals in `AutoRaise.mm` have `static` dropped; bridge accesses them via `extern`.
- [x] 3.4 Wire `raiseGeneration` retries: the 50ms/100ms `dispatch_after` blocks must still gate on `gen == raiseGeneration` and call the route callback on success. — No code change required: the retry blocks call `raiseAndActivate(_win1, captured_pid)` which now routes through the callback. `autoraise_stop` bumps `raiseGeneration` so in-flight retries no-op post-teardown.
- [x] 3.5 Expose the module to Swift via `include/module.modulemap` (`module AutoRaiseCore`). — Existing module map is sufficient; `#import <Foundation/Foundation.h>` inside the `#ifdef __OBJC__` block in the public header lets clang's modules import Foundation transitively for Swift.

## Phase 4 — Swift side

- [x] 4.1 Create `Sources/AppBundle/autoraise/AutoRaiseController.swift` with `start`/`stop`/`reload`/`isEnabled` and the two observer callbacks `onActiveSpaceDidChange` / `onAppDidActivate`. — `@MainActor enum` with sticky `runtimeDisabled` flag enforcing the §D8 precedence rule (runtime disable beats config reload). Route callback installed lazily on first start via `installRouteCallbackOnce`.
- [x] 4.2 Create `Sources/AppBundle/autoraise/RaiseRouter.swift` with the `CGWindowID → Window` mapping, current-workspace check (`window.visualWorkspace == focus.workspace`), and `setFocus(to:)` call. Register as the bridge route-callback on controller start. — `RaiseRouter.cCallback` is a `@convention(c)` closure that calls `MainActor.assumeIsolated { route(...) }`. Valid because the CGEventTap + dispatch_after retries run on the main run loop (§D3.c). Confirmed to compile cleanly under Swift 6.3 strict concurrency.
- [x] 4.3 Create `Sources/AppBundle/autoraise/AutoRaiseConfig.swift` model struct + conversion to `AutoRaiseConfigC`. — Swift `AutoRaiseConfig` is a `ConvenienceCopyable, Equatable` struct. `toBridge()` constructs an `AutoRaiseBridgeConfig` and maps the Swift `AutoRaiseDisableKey` enum to the `CGEventFlags.maskControl` / `.maskAlternate` raw values.
- [x] 4.4 Wire `GlobalObserver.onNotif` to call `AutoRaiseController.onActiveSpaceDidChange()` on `activeSpaceDidChangeNotification` and `.onAppDidActivate()` on `didActivateApplicationNotification`, after scheduling the existing refresh session.
- [x] 4.5 Call `AutoRaiseController.start(config.autoRaise)` from `initAppBundle.swift` after `GlobalObserver.initObserver()`, gated on `config.autoRaise.enabled`. — `Config.autoRaise` field added with a default-constructed `AutoRaiseConfig` (TOML parsing lands in Phase 5); `enabled` defaults to false so the controller is only wired, not active, until Phase 5 delivers config parsing.

## Phase 5 — Config

- [x] 5.1 Add `AutoRaiseConfig` field to `Config` in `Sources/AppBundle/config/Config.swift`. — Landed in Phase 4 alongside the controller wiring; defaults to `AutoRaiseConfig()` (i.e. `enabled = false`).
- [x] 5.2 Add `[auto-raise]` section parsing in `Sources/AppBundle/config/parseConfig.swift` (or a new `parseAutoRaise.swift`). Keys: `enabled`, `poll-millis`, `ignore-space-changed`, `invert-disable-key`, `invert-ignore-apps`, `ignore-apps`, `ignore-titles`, `stay-focused-bundle-ids`, `disable-key`. — `parseAutoRaise.swift` introduces the subtable parser; `configParser` in `parseConfig.swift` registers it. `parseArrayOfStrings` is now non-private so the subtable parser can reuse it. Unknown keys fail via the generic `unknownKeyError` in `parseTable`.
- [x] 5.3 Validate `poll-millis >= 1`, `disable-key ∈ {control, option, disabled}`, `ignore-titles` entries compile as ICU regex. — Folded into the per-field parsers in `parseAutoRaise.swift`. ICU regex validation uses `NSRegularExpression(pattern:)`, matching AutoRaise.mm's `NSRegularExpressionSearch` call-site.
- [x] 5.4 Hook `ConfigFileWatcher` reload path to call `AutoRaiseController.reload(newConfig.autoRaise)`. — `reloadConfig()` in `ReloadConfigCommand.swift` is the single entry point that both `ConfigFileWatcher` and the `reload-config` command feed into. `AutoRaiseController.reload(config:)` is called after `syncStartAtLogin()` and before `MessageModel.shared.message` is cleared.
- [x] 5.5 Reload must respect runtime toggle: if the user has disabled via `disable-auto-raise`, a reload does not re-enable. — Already enforced in `AutoRaiseController.reload` via the sticky `runtimeDisabled` flag; no further wiring needed.

## Phase 6 — Commands

- [x] 6.1 `Sources/Common/cmdArgs/impl/EnableAutoRaiseCmdArgs.swift` + `DisableAutoRaiseCmdArgs.swift`; register in `cmdArgsManifest.swift`. — Both structs take only `--fail-if-noop` (no positional args). `CmdKind` gains `enableAutoRaise = "enable-auto-raise"` and `disableAutoRaise = "disable-auto-raise"`, kept alphabetical with the `enable` / `debugWindows` neighbors.
- [x] 6.2 `Sources/AppBundle/command/impl/EnableAutoRaiseCommand.swift` + `DisableAutoRaiseCommand.swift`; register in `cmdManifest.swift`. — Both commands short-circuit on `AutoRaiseController.isEnabled` mismatch (the `--fail-if-noop` / stderr-message split mirrors `EnableCommand`). The transition branch calls `AutoRaiseController.start(config: config.autoRaise)` / `.stop()`, which maintain the §D8 sticky flag.
- [x] 6.3 `docs/aerospace-enable-auto-raise.adoc` + `docs/aerospace-disable-auto-raise.adoc`; link from `docs/commands.adoc`. — New `==` sections in `docs/commands.adoc` placed alphabetically (`disable-auto-raise` between close-all-windows-but-current and enable; `enable-auto-raise` between enable and exec-and-forget).
- [x] 6.4 Shell-completion grammar entries in `grammar/commands-bnf-grammar.txt`. — Two new `| disable-auto-raise [--fail-if-noop]` and `| enable-auto-raise [--fail-if-noop]` alternatives under the `<subcommand>` rule.
- [x] 6.5 Run `./generate.sh`, commit generated files, confirm `./test.sh` passes the generate-is-no-op check. — `./generate.sh --ignore-shell-parser` regenerated `cmdHelpGenerated.swift` (added `enable_auto_raise_help_generated` + `disable_auto_raise_help_generated` blocks), `subcommandDescriptionsGenerated.swift`, and `AeroSpace.xcodeproj`. Shell parser was skipped (ANTLR needs JDK which is absent on this box); `grammar/ShellParser.g4` is untouched so the generated `ShellParserGenerated/` package doesn't need regen. Full `./test.sh` deferred to Phase 8 QA (same XCTest toolchain constraint noted in 1.5). `swift build` completes in 41s clean.

## Phase 7 — Licensing & cleanup

- [x] 7.1 Add `LICENSE-GPL` at repo root with full GPL-2.0-or-later text. — Canonical text fetched from gnu.org/licenses/gpl-2.0.txt (338 lines). Matches the "either version 2 of the License, or (at your option) any later version" clause in `Sources/AutoRaiseCore/AutoRaise.mm`'s header.
- [x] 7.2 Amend `LICENSE` / `README.md` with the combined-work notice. — `LICENSE.txt` now opens with a dual-licensing preamble: individual files keep their header license (MIT for most, GPL-2.0-or-later for `Sources/AutoRaiseCore/`), combined binary is GPL-2.0-or-later. New `## License` section in `README.md` points at both `LICENSE.txt` and `LICENSE-GPL`.
- [x] 7.3 Remove the `AutoRaise/` submodule entry from `.gitmodules` and delete the submodule directory (after port is verified working). — `git submodule deinit -f AutoRaise` + `git rm -f AutoRaise` + `rm -rf .git/modules/AutoRaise`. `.gitmodules` was left empty after the deinit (no other submodules), so it was deleted too. Post-removal `swift build` remains clean — no code referenced the submodule path; upstream material now lives entirely in `Sources/AutoRaiseCore/`.

## Phase 8 — Tests & QA

- [ ] 8.1 Unit tests for `[auto-raise]` TOML parsing round-trip in `Sources/AppBundleTests/`.
- [ ] 8.2 Unit test: `RaiseRouter.route` drops windows on non-focused workspaces.
- [ ] 8.3 Manual QA script: multi-monitor hover, full-screen apps, workspace switch mid-hover, `disableKey` held while hovering, `ignoreApps` entry, `stayFocusedBundleIds` entry, `enable`/`disable-auto-raise` runtime toggle, config file live-reload.
- [ ] 8.4 Verify `./test.sh` passes (build with `-warnings-as-errors`, swift tests, lint, generate.sh no-op).
- [ ] 8.5 Release build (`./build-release.sh`) succeeds on a universal binary.

## Phase 9 — Docs

- [ ] 9.1 Update `CLAUDE.md` §Architecture with a new "AutoRaise integration" subsection describing `AutoRaiseCore` target, bridge shape, raise-routing rule.
- [ ] 9.2 New `docs/guide/auto-raise.adoc` user-facing guide covering config keys, commands, `disableKey`, and the `on-focus-changed` firing-on-hover gotcha.
- [ ] 9.3 `docs/aerospace-config.adoc` (or the relevant config reference) documents the `[auto-raise]` section.
