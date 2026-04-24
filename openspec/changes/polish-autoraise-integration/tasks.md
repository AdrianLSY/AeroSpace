# Tasks: polish-autoraise-integration

## Phase 1 — Code fixes

### Master-toggle coupling (I1, design.md §D1)

- [x] 1.1 Add `AutoRaiseController.pauseForMaster()` / `resumeFromMaster()` backed
      by a `private static var masterPauseSnapshot: AutoRaiseConfig?`. `pauseForMaster`
      captures `lastConfig` into the snapshot and calls `autoraise_stop()` iff the
      bridge is currently running; otherwise no-op and leaves the snapshot nil.
      `resumeFromMaster` no-ops if the snapshot is nil; otherwise clears it and
      calls `autoraise_start(snapshot.toBridge())` through the bridge (respecting
      `runtimeDisabled` — if sticky-disabled, skip the start).
      — `reload` also updates the snapshot when a file-watcher reload arrives
      while paused, so the eventual resume picks up the latest config.
- [x] 1.2 Call `AutoRaiseController.pauseForMaster()` when `EnableCommand`
      transitions to `.off`, and `resumeFromMaster()` when it transitions to
      `.on`. Place the calls after `TrayMenuModel.shared.isEnabled = newState`
      so observers see the new master state first.
- [x] 1.3 Remove the AutoRaise fan-out lines from `GlobalObserver.onNotif`'s
      post-`isEnabled` block only if pause/resume makes them redundant — verify
      first. — **Verified, no change needed.** `autoraise_on_active_space_did_change`
      / `autoraise_on_app_did_activate` already early-return when
      `bridgeRunning == false`, so the fan-out becomes a bridge-level no-op
      while paused. Keeping the fan-out in place is free and keeps the observer
      wiring consistent between master-off and master-on.

### Surface `autoraise_start` failure (I2, design.md §D2)

- [x] 1.4 Change `autoraise_start` in `AutoRaiseBridge.h` / `AutoRaiseBridge.mm`
      to return `bool`: `true` iff the tap was successfully installed (matches
      the existing success path that sets `bridgeRunning = YES`). The failure
      path (`CGEventTapCreate` returned `NULL`) returns `false` without
      mutating state.
- [x] 1.5 Thread the result through `AutoRaiseController.start(config:)` —
      make it return `@discardableResult Bool`. `reload`, `pauseForMaster`,
      `resumeFromMaster` can reuse the same flow internally without exposing
      a result to their callers.
- [x] 1.6 In `EnableAutoRaiseCommand`, if `AutoRaiseController.start(config:)`
      returns `false`, return `.fail` with an `io.err` message pointing at
      Accessibility permission as the likely cause. Do not mutate
      `runtimeDisabled` on failure — a subsequent retry (once permission is
      granted) should still work. — `BinaryExitCode` has no `.fail(...)` form
      so the message goes through `io.err(...)` before the `return .fail`.
- [x] 1.7 At `initAppBundle.swift`'s `AutoRaiseController.start` call site,
      discard the result with `_ =` (boot-time failure has no user-facing
      surface to report to; Accessibility prompt handling is elsewhere).

### `reloadConfig` ordering (I5, design.md §D5)

- [x] 1.8 In `ReloadConfigCommand.swift::reloadConfig`, move the
      `AutoRaiseController.reload(config: config.autoRaise)` call to
      immediately after `config = parsedConfig`, before `try await activateMode`.
      Leave `syncStartAtLogin` and `MessageModel.shared.message = nil` where
      they are — scope of this change is auto-raise only.

### Nits

- [x] 1.9 `AutoRaiseBridge.mm::applyConfig`: drop the redundant
      `BOOL ? true : false` ternary on `ignoreSpaceChanged`, `invertDisableKey`,
      `invertIgnoreApps`. Direct `BOOL` → `bool` conversion works.
- [x] 1.10 `AutoRaise.mm::raiseAndActivate`: remove the now-unused
      `pid_t window_pid` parameter and the `(void) window_pid;` line.
      Updated the three call-sites in `performRaiseCheck` (immediate raise +
      two retry blocks) and dropped the `captured_pid` local.
- [x] 1.11 Before `CFRelease(axObserver)`, remove the old observer's run-loop
      source with
      `CFRunLoopRemoveSource(CFRunLoopGetMain(), AXObserverGetRunLoopSource(axObserver), kCFRunLoopCommonModes)`.
      Applied in both `AutoRaise.mm::performRaiseCheck` (window-change path)
      and `AutoRaiseBridge.mm::autoraise_stop`. Also changed the matching
      `CFRunLoopAddSource` in `performRaiseCheck` from
      `CFRunLoopGetCurrent()` to `CFRunLoopGetMain()` so add/remove use the
      same reference in every code path.
- [x] 1.12 `AutoRaiseController.swift`: `isRuntimeDisabled` had exactly one
      caller. Replaced the public getter with a narrower
      `isNoopForDisableCommand: Bool` (computed as
      `!isEnabled && runtimeDisabled`) and updated
      `DisableAutoRaiseCommand` to use it.

## Phase 2 — Docs & specs

- [x] 2.1 `openspec/changes/integrate-autoraise/design.md` §D9: update the
      event-tap mask description from
      "`kCGEventMouseMoved`, `kCGEventKeyDown`, `kCGEventFlagsChanged`" to
      just `kCGEventMouseMoved`, with a note that the disable-key check polls
      current modifier state via `CGEventCreateKeyboardEvent` +
      `CGEventGetFlags` instead of intercepting keyboard events.
- [x] 2.2 `openspec/changes/integrate-autoraise/specs/auto-raise/spec.md`:
      rename the "Upstream warp keys are rejected" scenario to "Unknown keys
      (including upstream-only AutoRaise options) are rejected" and change
      the config example from `warpX = 0.5` to `altTaskSwitcher = true`
      (matches the behavior actually tested and the parser's actual failure
      mode).
- [x] 2.3 `docs/guide.adoc` auto-raise section: note that `enable off` also
      pauses hover-raise and `enable on` restores the prior state. Placed in
      the existing Runtime-toggle bullet list so users see all three control
      surfaces together.
- [x] 2.4 `CLAUDE.md`: update the "Periphery is skipped on macOS 14" line to
      mention the macOS 26 skip as well, referencing
      `peripheryapp/periphery#1105`.

## Phase 3 — Verification

- [x] 3.1 `./test.sh` substantive parts verified:
      - `./build-debug.sh -Xswiftc -warnings-as-errors` — clean, no warnings
        (0 errors / 0 warnings introduced; preexisting "swiftly not
        installed" notice is unrelated).
      - `./swift-test.sh` — 132 tests pass, 0 failures. Includes
        `RaiseRouterTest` (3) and `ParseAutoRaiseTest` (7), which continue
        to exercise the invariants most at risk from the changes in this
        change.
      - `./lint.sh` — SwiftFormat formatted 0/265 files (no diffs), SwiftLint
        clean. Periphery skipped on macOS 26 as expected
        (`peripheryapp/periphery#1105`).
      - `JAVA_HOME=... ./generate.sh` — regenerates xcodeproj and generated
        files; `git status` afterward shows only the intentional edits in
        this change, confirming generate.sh is a no-op on top of the new
        state. Full `./test.sh` would pass once the change is committed (the
        preflight `check-uncommitted-files.sh` fails by design while edits
        are in-flight).
- [ ] 3.2 Smoke test the I2 path manually: build debug, revoke Accessibility
      permission, run `aerospace enable-auto-raise`, confirm non-zero exit with
      the expected stderr message. Re-grant permission, confirm success.
      — **Deferred to user.** Requires interactive Accessibility toggle in
      System Settings.
- [ ] 3.3 Smoke test the I1 coupling: enable auto-raise, hover to confirm it
      works, run `aerospace enable off`, hover again — no raise should happen;
      run `aerospace enable on`, hover — raises resume. Then run
      `aerospace disable-auto-raise` → `enable off` → `enable on` and confirm
      auto-raise stays disabled (sticky flag preserved across the master cycle).
      — **Deferred to user.** Requires real mouse/windows.
- [ ] 3.4 Smoke test the I5 path: introduce a transient config error that
      makes `activateMode` throw (e.g., an invalid mode keybinding in a
      reload), confirm `AutoRaiseController.reload` still picked up the new
      `autoRaise` config before the throw. Revert the transient error.
      — **Deferred to user.** Requires runtime config reload testing.
