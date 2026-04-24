# Tasks: polish-autoraise-integration

## Phase 1 — Code fixes

### Master-toggle coupling (I1, design.md §D1)

- [ ] 1.1 Add `AutoRaiseController.pauseForMaster()` / `resumeFromMaster()` backed
      by a `private static var masterPauseSnapshot: AutoRaiseConfig?`. `pauseForMaster`
      captures `lastConfig` into the snapshot and calls `autoraise_stop()` iff the
      bridge is currently running; otherwise no-op and leaves the snapshot nil.
      `resumeFromMaster` no-ops if the snapshot is nil; otherwise clears it and
      calls `autoraise_start(snapshot.toBridge())` through the bridge (respecting
      `runtimeDisabled` — if sticky-disabled, skip the start).
- [ ] 1.2 Call `AutoRaiseController.pauseForMaster()` when `EnableCommand`
      transitions to `.off`, and `resumeFromMaster()` when it transitions to
      `.on`. Place the calls after `TrayMenuModel.shared.isEnabled = newState`
      so observers see the new master state first.
- [ ] 1.3 Remove the AutoRaise fan-out lines from `GlobalObserver.onNotif`'s
      post-`isEnabled` block only if pause/resume makes them redundant — verify
      first. If the bridge is torn down on `enable off`, the
      `autoraise_on_active_space_did_change` / `autoraise_on_app_did_activate`
      entry points are already no-ops (they check `bridgeRunning`), so leaving
      the fan-out in place is safe and costs nothing.

### Surface `autoraise_start` failure (I2, design.md §D2)

- [ ] 1.4 Change `autoraise_start` in `AutoRaiseBridge.h` / `AutoRaiseBridge.mm`
      to return `bool`: `true` iff the tap was successfully installed (matches
      the existing success path that sets `bridgeRunning = YES`). The failure
      path (`CGEventTapCreate` returned `NULL`) returns `false` without
      mutating state.
- [ ] 1.5 Thread the result through `AutoRaiseController.start(config:)` —
      make it return `@discardableResult Bool`. `reload`, `pauseForMaster`,
      `resumeFromMaster` can reuse the same flow internally without exposing
      a result to their callers.
- [ ] 1.6 In `EnableAutoRaiseCommand`, if `AutoRaiseController.start(config:)`
      returns `false`, return `.fail` with an `io.err` message pointing at
      Accessibility permission as the likely cause. Do not mutate
      `runtimeDisabled` on failure — a subsequent retry (once permission is
      granted) should still work.
- [ ] 1.7 At `initAppBundle.swift`'s `AutoRaiseController.start` call site,
      discard the result with `_ =` (boot-time failure has no user-facing
      surface to report to; Accessibility prompt handling is elsewhere).

### `reloadConfig` ordering (I5, design.md §D5)

- [ ] 1.8 In `ReloadConfigCommand.swift::reloadConfig`, move the
      `AutoRaiseController.reload(config: config.autoRaise)` call to
      immediately after `config = parsedConfig`, before `try await activateMode`.
      Leave `syncStartAtLogin` and `MessageModel.shared.message = nil` where
      they are — scope of this change is auto-raise only.

### Nits

- [ ] 1.9 `AutoRaiseBridge.mm::applyConfig`: drop the redundant
      `BOOL ? true : false` ternary on `ignoreSpaceChanged`, `invertDisableKey`,
      `invertIgnoreApps`. Direct `BOOL` → `bool` conversion works.
- [ ] 1.10 `AutoRaise.mm::raiseAndActivate`: remove the now-unused
      `pid_t window_pid` parameter and the `(void) window_pid;` line.
      Update the two retry call-sites in `performRaiseCheck`
      (`raiseAndActivate(_win1, captured_pid)`, `(_win2, captured_pid)`) and
      drop the `captured_pid` local if nothing else uses it.
- [ ] 1.11 `AutoRaise.mm::performRaiseCheck`: before `CFRelease(axObserver)`
      in the re-create path, remove the old observer's run-loop source with
      `CFRunLoopRemoveSource(CFRunLoopGetCurrent(), AXObserverGetRunLoopSource(axObserver), kCFRunLoopCommonModes)`.
      Apply the same treatment in `AutoRaiseBridge.mm::autoraise_stop` before
      the `CFRelease(axObserver)` there.
- [ ] 1.12 `AutoRaiseController.swift`: `isRuntimeDisabled` has exactly one
      caller (`DisableAutoRaiseCommand`). Options: (a) inline the check into
      the command via a dedicated helper method on the controller
      (`isTrueNoopForDisable`), or (b) leave as-is and move on. Prefer (a) to
      keep controller internals encapsulated.

## Phase 2 — Docs & specs

- [ ] 2.1 `openspec/changes/integrate-autoraise/design.md` §D9: update the
      event-tap mask description from
      "`kCGEventMouseMoved`, `kCGEventKeyDown`, `kCGEventFlagsChanged`" to
      just `kCGEventMouseMoved`, with a one-line note that the disable-key
      check polls current modifier state via `CGEventCreateKeyboardEvent` +
      `CGEventGetFlags` instead of intercepting keyboard events.
- [ ] 2.2 `openspec/changes/integrate-autoraise/specs/auto-raise/spec.md`:
      rename the "Upstream warp keys are rejected" scenario to "Unknown
      keys are rejected" and change the config example from
      `warpX = 0.5` to `altTaskSwitcher = true` (matches the behavior
      actually tested and the parser's actual failure mode).
- [ ] 2.3 `docs/guide.adoc` auto-raise section: add a short note that
      `enable off` also pauses hover-raise, and `enable on` resumes it to the
      prior state. Place it next to the existing runtime-toggle paragraph so
      users see all three control surfaces (config / runtime toggle / master
      toggle) together.
- [ ] 2.4 `CLAUDE.md`: update the "Periphery is skipped on macOS 14" line to
      mention the macOS 26 skip as well, referencing
      `peripheryapp/periphery#1105`.

## Phase 3 — Verification

- [ ] 3.1 `./test.sh` passes end-to-end: swift build with `-warnings-as-errors`,
      all tests green, lint clean, `generate.sh` no-op.
- [ ] 3.2 Smoke test the I2 path manually: build debug, revoke Accessibility
      permission, run `aerospace enable-auto-raise`, confirm non-zero exit with
      the expected stderr message. Re-grant permission, confirm success.
- [ ] 3.3 Smoke test the I1 coupling: enable auto-raise, hover to confirm it
      works, run `aerospace enable off`, hover again — no raise should happen;
      run `aerospace enable on`, hover — raises resume. Then run
      `aerospace disable-auto-raise` → `enable off` → `enable on` and confirm
      auto-raise stays disabled (sticky flag preserved across the master cycle).
- [ ] 3.4 Smoke test the I5 path: introduce a transient config error that
      makes `activateMode` throw (e.g., an invalid mode keybinding in a
      reload), confirm `AutoRaiseController.reload` still picked up the new
      `autoRaise` config before the throw. Revert the transient error.
