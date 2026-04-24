# polish-autoraise-integration

## Why

Code review of the `integrate-autoraise` branch surfaced five concrete issues
plus a handful of nits to address before merging to `main`. None of them change
the architecture — they tighten behavior, surface silent failures, and keep
docs/code/specs in sync. Collected here as a single follow-up so the
`integrate-autoraise` change archives clean and the fixes are tracked atomically
rather than smuggled into unrelated commits.

## What Changes

- **I1. Couple auto-raise to the master toggle.** When `enable off` runs, pause
  auto-raise via a new `AutoRaiseController.pauseForMaster()` call from
  `EnableCommand`. When `enable on` runs, call `resumeFromMaster()` to restore
  the prior running state. Resolves the drift where the `CGEventTap` kept
  firing raises while `GlobalObserver`'s AutoRaise fan-out was gated on
  `TrayMenuModel.shared.isEnabled`.
- **I2. Surface `autoraise_start` failure.** Change `autoraise_start` to return
  `bool`. `AutoRaiseController.start` propagates the result; `EnableAutoRaiseCommand`
  returns `.fail` with an actionable stderr message when the bridge couldn't
  install the event tap (typical cause: missing Accessibility permission).
- **I3. Sync design.md §D9 event-tap mask.** Design doc claims the tap observes
  `kCGEventMouseMoved`, `kCGEventKeyDown`, `kCGEventFlagsChanged`; the port
  masks only `kCGEventMouseMoved` (disable-key is polled via
  `CGEventCreateKeyboardEvent` + `CGEventGetFlags`, no key-event interception
  needed). Update the doc to match.
- **I4. Fix unknown-key scenario in spec.** The "Upstream warp keys are
  rejected" scenario uses `warpX = 0.5`, but a Double value hits the
  "Unsupported TOML type" path in `tomlAnyToParsedConfigRecursive` before the
  per-key parser runs, so the actual error message differs from what the
  scenario implies. Rephrase to use a bool/int unknown key (matching
  `ParseAutoRaiseTest.testUnknownKeyRejected`).
- **I5. Reorder `reloadConfig` so `AutoRaiseController.reload` runs before
  `activateMode`.** Eliminates the edge case where `activateMode` throws after
  `config = parsedConfig` has been assigned, leaving auto-raise's view of
  config lagging behind the global `config`.
- **Nits.** Drop the redundant `BOOL ? true : false` in
  `AutoRaiseBridge.mm::applyConfig`; remove the now-unused `window_pid`
  parameter from `raiseAndActivate` and its call-sites; remove the stale
  `CFRunLoopSource` for the old `axObserver` before `CFRelease` in
  `performRaiseCheck` (carry-over from upstream); mention the macOS 26
  periphery skip in `CLAUDE.md`; tighten `AutoRaiseController.isRuntimeDisabled`
  visibility now that it has exactly one caller.

## Impact

- **Affected capabilities.** `auto-raise` — behavior refinement only; no new
  requirements and no breaking changes to existing scenarios. The
  `integrate-autoraise` spec is edited in place (I4).
- **Affected code.**
  - `Sources/AppBundle/autoraise/AutoRaiseController.swift` — new
    `pauseForMaster` / `resumeFromMaster`; `start` returns `Bool`.
  - `Sources/AppBundle/command/impl/EnableCommand.swift` — call pause/resume
    on master toggle transitions.
  - `Sources/AppBundle/command/impl/EnableAutoRaiseCommand.swift` — handle
    `start` failure with `.fail` + stderr message.
  - `Sources/AppBundle/command/impl/ReloadConfigCommand.swift` — move
    `AutoRaiseController.reload` before `activateMode`.
  - `Sources/AutoRaiseCore/include/AutoRaiseBridge.h` +
    `Sources/AutoRaiseCore/AutoRaiseBridge.mm` — `autoraise_start` signature
    change; ternary cleanup.
  - `Sources/AutoRaiseCore/AutoRaise.mm` — drop unused `window_pid` arg;
    remove old `axObserver`'s run-loop source before release.
  - `openspec/changes/integrate-autoraise/design.md` — §D9 update.
  - `openspec/changes/integrate-autoraise/specs/auto-raise/spec.md` — scenario
    fix (I4).
  - `docs/guide.adoc` — note that `enable off` also pauses hover-raise.
  - `CLAUDE.md` — macOS 26 periphery note.
- **Downstream behavior.** `enable off` now pauses hover-raise in addition to
  window management — user-visible but arguably the expected semantics.
  Documented in the user guide.
- **Out of scope.**
  - The carry-over cross-workspace retry "waste" where ObjC++ keeps scheduling
    retries for raises Swift has already dropped. Performance-only, no
    correctness impact. Revisit if it shows up in profiling.
  - Broader `reloadConfig` failure-ordering cleanup (several post-assignment
    calls are skipped when `activateMode` throws). The I5 fix narrows one gap
    but leaves the structural issue unchanged — that's a larger refactor
    for another change.
