# integrate-autoraise — Handoff Notes

**Branch**: `integrate-autoraise`
**OpenSpec change**: `openspec/changes/integrate-autoraise/`
**Progress**: 12 of 44 tasks complete — Phases 1–2 done; Phases 3–9 pending.
**Linux caveat**: all work so far was done on a Linux devbox. `./build-debug.sh` has **not** been run. Verify the Phase 1 + Phase 2 build on macOS before writing Phase 3 code.

## Read these first (in order)

1. `openspec/changes/integrate-autoraise/proposal.md` — why, scope, and what's out-of-scope (cmd-tab warp, cursor scale).
2. `openspec/changes/integrate-autoraise/design.md` — 11 design decisions. D5 (raise-routing bridge), D6 (unified observers), D11 (GPL license propagation) are the load-bearing ones.
3. `openspec/changes/integrate-autoraise/specs/auto-raise/spec.md` — 9 requirements with scenarios.
4. `openspec/changes/integrate-autoraise/tasks.md` — work breakdown, 44 tasks across 9 phases. Current checkboxes reflect reality.
5. Repo `CLAUDE.md` — project architecture and build commands.
6. `AutoRaise/CLAUDE.md` — upstream AutoRaise reference. The `AutoRaise/` submodule is retained as reference; task 7.3 removes it after the port is verified.

## What's committed on this branch

Three atomic commits on top of `main`:

```
C1  Add AutoRaise submodule, CLAUDE.md, and OpenSpec tooling
    • .gitmodules + AutoRaise submodule
    • CLAUDE.md (project instructions for Claude Code)
    • .claude/{skills,commands}/opsx/*  (OpenSpec workflow)
    • openspec/config.yaml

C2  Add integrate-autoraise OpenSpec change proposal
    • openspec/changes/integrate-autoraise/{proposal,design,tasks}.md
    • openspec/changes/integrate-autoraise/specs/auto-raise/spec.md
    • openspec/changes/integrate-autoraise/HANDOFF.md (this file)

C3  Port AutoRaise into AutoRaiseCore SPM target (Phases 1–2)
    • Package.swift   — new AutoRaiseCore target; AppBundle depends on it
    • Sources/AutoRaiseCore/AutoRaise.mm        (ported, 723 lines)
    • Sources/AutoRaiseCore/include/AutoRaiseBridge.h   (scaffold)
    • Sources/AutoRaiseCore/include/module.modulemap
```

## Phase 1 (scaffolding) — done

- Created `Sources/AutoRaiseCore/` as an ObjC++ SPM target mirroring the `Sources/PrivateApi/` pattern.
- `Package.swift`: target added, `AppBundle` depends on it.
- `project.yml`: **no change needed** — Xcode's SPM integration pulls `AutoRaiseCore` transitively via the existing `AppBundle` product dependency. (Same way `PrivateApi` works today.)
- Unverified: `./build-debug.sh` requires macOS.

## Phase 2 (port) — done

`Sources/AutoRaiseCore/AutoRaise.mm` — 723 lines (down from upstream 1322; 45% smaller). Comprehensive modification notice at the top of the file enumerates every removal for GPL compliance.

**Removed**: `main()`, NSApplication bootstrap, CLI/config-file parsing, `ConfigClass`, `MDWorkspaceWatcher`, the cmd-tab warp + `CGSSetCursorScale` path, all `if (verbose) { NSLog(...) }` guards, `logWindowTitle`, `OLD_ACTIVATION_METHOD`, `ALTERNATIVE_TASK_SWITCHER`, `#include <Carbon/Carbon.h>`, `#include <libproc.h>`, and the unused-in-upstream dead globals (`_previousFinderWindow`, `FinderBundleId`, `LittleSnitchBundleId`, `pathBuffer`).

**Kept**: all AX helpers, `performRaiseCheck` with `raiseGeneration` cancellation + 50ms/100ms retries, the `CGEventTap` handler (trimmed to mouse-moved throttle + suppression gate + tap-disabled recovery), `spaceChanged`, and the config globals (`ignoreApps`, `ignoreTitles`, `stayFocusedBundleIds`, `pollMillis`, `disableKey`, `invertDisableKey`, `invertIgnoreApps`, `ignoreSpaceChanged`) as file-scope state for the bridge to populate.

**Changed**:
- `appActivated` reduced to one line — opens the `SUPPRESS_MS` suppression window only. The design doc mentioned it could be "empty or deleted" after warp removal, but keyboard app-switch suppression still matters (otherwise a stale cursor position fires a wrong raise on cmd-tab). User confirmed this keeps the right behavior.
- `activate()` lost the `#ifdef OLD_ACTIVATION_METHOD` Carbon branch.

## What's next: Phase 3 — bridge C API + event tap lifecycle

See `tasks.md` Phase 3 for the full checklist. Open design calls the next agent should resolve early:

### D3.a — How does the bridge read/write `AutoRaise.mm`'s file-scope globals?

Two clean options:

- **(a) setter functions** exposed from `AutoRaise.mm`, globals stay `static`.
  - Pro: explicit API surface; the only way to mutate state is through the setters.
  - Con: boilerplate (8+ setters).
- **(b) `extern` the globals** from `AutoRaiseBridge.mm`, drop `static` qualifier.
  - Pro: minimal ceremony; same target, same "de-facto singleton" the design doc already calls out.
  - Con: less encapsulation.

**My recommendation**: (b). Matches the globals-stay-globals decision in design.md §D3. Add a short comment in `AutoRaise.mm` saying "set by AutoRaiseBridge only" above the bloc of globals.

### D3.b — `AutoRaiseConfigC` shape

The design doc left this to implementer. Options:

- `const char * const *` arrays + `size_t count` — pure C, but Swift→C string marshaling is awkward.
- Single `const char *` with delimiter — even uglier.
- **ObjC class** (`@interface AutoRaiseConfig`) with `NSArray<NSString *> *` fields — zero marshaling cost in ObjC++, Swift constructs it natively through the module.

**My recommendation**: the ObjC-class shape. Matches how AutoRaise already stores the arrays internally. The "C struct" naming in tasks.md (`AutoRaiseConfigC`) is aspirational; the cleaner implementation is an ObjC class.

### D3.c — Route-callback signature and threading

- Signature: `typedef void (*AutoRaiseRouteRaise)(uint32_t cgWindowId);` — `CGWindowID` is `UInt32` in Swift. One-shot install via `autoraise_set_route_callback(fn)` at controller start.
- Threading: the tap runs on a secondary thread. AeroSpace's focus path is `@MainActor`. Dispatch to main from the bridge side (`dispatch_async(dispatch_get_main_queue(), ...)`) before invoking the callback; keeps the Swift callback simple.

### D3.d — `AssistiveControl` auto-append

Upstream's `main()` appends `@"AssistiveControl"` to `ignoreApps` before assigning. The constant is preserved in `AutoRaise.mm`. Replicate that in the bridge: after Swift hands in the user's ignoreApps array, bridge concatenates `AssistiveControl` before assigning to the global.

## Environment caveats

- **Build verification**: do `./build-debug.sh` on macOS before writing Phase 3 code. If it fails, the likely suspects (in order):
  1. `-warnings-as-errors` tripping on something in the ported file (ARC edge cases, unused-function warnings, implicit casts).
  2. SPM oddity with `.mm` + `publicHeadersPath`. (Unlikely — same as `PrivateApi/`.)
  3. Static init ordering for the `NSArray * const = @[…]` file-scope literals. (Should be fine; upstream uses the same pattern, but it's where I'd look first.)
- The `AutoRaise/` submodule is *retained* as reference. Do not delete until task 7.3 — "after the port is verified working".

## Navigation pointers for later phases

- **Phase 4** (Swift controller + router + observer wiring):
  - `Sources/AppBundle/focus.swift` — `setFocus(to:)` is the function `RaiseRouter` calls.
  - `Sources/AppBundle/GlobalObserver.swift` — task 4.4 fans out from `onNotif` into `AutoRaiseController.onActiveSpaceDidChange()` / `.onAppDidActivate()`.
  - `Sources/AppBundle/initAppBundle.swift` — task 4.5 calls `AutoRaiseController.start(config.autoRaise)` after `GlobalObserver.initObserver()`.
- **Phase 5** (config):
  - `Sources/AppBundle/config/Config.swift` — add `autoRaise: AutoRaiseConfig`.
  - `Sources/AppBundle/config/parseConfig.swift` — add `[auto-raise]` section parsing (spec §"Config schema" has the exact TOML layout).
  - `Sources/AppBundle/config/ConfigFileWatcher.swift` — live-reload hook.
- **Phase 6** (commands): follow `CLAUDE.md` §"Adding / modifying a command" — the canonical 6-step checklist covers both `enable-auto-raise` and `disable-auto-raise`.

## Behavior flags the next agent should hold on to

- **Current-workspace-only**: `RaiseRouter` must drop any raise whose target window isn't on `focus.workspace`. Check spec §"Hover-raise within current workspace" and `design.md` §D7.
- **on-focus-changed fires on every hover** — this is intentional (user confirmed). Don't "optimize" it away.
- **Runtime disable beats config**: once the user runs `disable-auto-raise`, a config reload does not re-enable. Controller must remember the runtime state across `reload()` calls.
- **License is GPL-2.0-or-later**: once `AutoRaise.mm` is linked into AeroSpaceApp, the whole binary is GPL. Task 7.1/7.2 captures the `LICENSE-GPL` + README note; don't skip them.
