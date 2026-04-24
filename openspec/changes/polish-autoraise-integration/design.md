# Design: polish-autoraise-integration

## Context

The `integrate-autoraise` change landed a full port of AutoRaise into AeroSpace
(AutoRaiseCore SPM target + `AutoRaiseController`/`RaiseRouter` + `[auto-raise]`
TOML section + `enable-auto-raise` / `disable-auto-raise` runtime commands).
Architecture and license handling are correct. Review found five specific
issues and some nits to clean up before merging to `main`.

Two of the issues involve interactions between existing AeroSpace state and the
new auto-raise subsystem (I1 master toggle, I5 reload ordering). The others
are local polishing: a silent-failure path (I2), a doc-vs-code drift (I3), and
a spec scenario that doesn't match its test (I4).

The polish change intentionally stays narrow. Anything that would be a real
redesign — re-architecting the reloadConfig failure-recovery flow, adding a
bidirectional retry-cancel channel from Swift back into ObjC++, redesigning
master-toggle coupling as a more general "pause aerospace" notion — is out of
scope and left for separate changes.

## Decisions

### D1. Master toggle coupling: pause the bridge, don't just gate the observer

The current `GlobalObserver.onNotif` ([GlobalObserver.swift:13](Sources/AppBundle/GlobalObserver.swift:13))
early-returns when `TrayMenuModel.shared.isEnabled` is false, which skips the
AutoRaise fan-out. But the `CGEventTap` is not torn down, so mouse-moved events
keep driving `performRaiseCheck` → `routeRaise` → `window.focusWindow()` while
AeroSpace's refresh sessions are suspended. Net effect: hover-raise keeps
mutating the tree even though the master switch is off, and AutoRaise loses its
space-change / app-activate sync in the meantime.

**Options considered**

- **Option A — Decouple at the observer only.** Move the AutoRaise fan-out
  before the `isEnabled` check so the state machines stay in sync, but leave
  raises firing when the master is off. Simple, but means `enable off` doesn't
  actually stop AeroSpace from changing focus — user-surprising.
- **Option B — Drop raises in `RaiseRouter` when master is off.** Tap keeps
  running, wasted CPU on every mouse move. Same surprise avoided, but
  wasteful.
- **Option C — Pause the bridge (chosen).** `EnableCommand` calls
  `AutoRaiseController.pauseForMaster()` on transition to `.off`, which
  snapshots the current running state and calls `autoraise_stop()`.
  Transition to `.on` calls `resumeFromMaster()` which restarts using the
  snapshot (if the bridge was running before). No wasted work, no surprise
  raises while master is off, and the existing `runtimeDisabled` sticky flag
  is untouched — user's runtime `disable-auto-raise` decision survives a
  master-off/on cycle.

**State machine after the change**

Three independent inputs determine whether the bridge is running:

- `config.autoRaise.enabled` — TOML setting, applied at startup and on reload.
- `runtimeDisabled` — sticky flag set by `disable-auto-raise`, cleared by
  `enable-auto-raise`. Survives config reload (already implemented).
- `masterPauseSnapshot: AutoRaiseConfig?` — new. Set by `pauseForMaster` iff
  the bridge was running; cleared by `resumeFromMaster`. Survives nothing —
  it's a transient state captured across a single `enable off` → `enable on`
  cycle.

The bridge runs iff: `(config.enabled || user-explicitly-started) && !runtimeDisabled && masterPauseSnapshot == nil`.

`pauseForMaster` / `resumeFromMaster` only ever affect the third input.

### D2. Propagate `autoraise_start` failure as a hard error

`CGEventTapCreate` returns `NULL` when the process doesn't have Accessibility
permission. Today `autoraise_start` silently returns without setting
`bridgeRunning = YES`; `autoraise_is_running()` then reads false; the
`enable-auto-raise` command reports success. User is confused.

**Chosen approach.** Change the bridge surface to return `bool`:

```c
bool autoraise_start(AutoRaiseBridgeConfig *config);
```

`true` iff the tap was installed successfully. `AutoRaiseController.start`
returns the same `Bool`. `EnableAutoRaiseCommand` checks the result; on
`false` it returns `.fail` with a stderr message pointing at Accessibility
permission. The boot-time call from `initAppBundle.swift` ignores the result
with `_ =` (same rationale as upstream: if we can't install the tap at boot,
there's nothing actionable to report from that call site).

Alternative considered: log a warning from the bridge and leave the Swift API
as-is. Rejected because it hides the failure from the CLI command, which is
the most useful place to surface it.

### D3. Event-tap mask — doc follows code, not the other way around

The port uses only `kCGEventMouseMoved`. The `disable-key` modifier check in
`performRaiseCheck` creates a synthetic keyboard event via
`CGEventCreateKeyboardEvent(NULL, 0, true)` and reads its flags — it polls
current modifier state instead of intercepting key events. Keeping the tap
narrow reduces CPU overhead and avoids the need to handle
`kCGEventFlagsChanged` re-entrancy.

Design doc §D9 (`"observes kCGEventMouseMoved, kCGEventKeyDown,
kCGEventFlagsChanged"`) predates this implementation decision. Update the doc
to match the code.

### D4. Unknown-key scenario uses a key with an int/bool value, not Double

`tomlAnyToParsedConfigRecursive` ([parseConfig.swift:200](Sources/AppBundle/config/parseConfig.swift:200))
rejects Double at the preprocess stage with "Unsupported TOML type: Double",
before the per-section field parser runs. So `warpX = 0.5` never reaches the
unknown-key path. `ParseAutoRaiseTest.testUnknownKeyRejected` works around
this by using `altTaskSwitcher = true`. The spec scenario should use an
equivalent example so the doc and test exercise the same behavior.

**Chosen wording.** Rename the scenario to "Unknown keys are rejected" and
use `altTaskSwitcher = true` as the example key (matches the test; captures
intent without claiming a behavior that doesn't exist).

### D5. Apply `AutoRaiseController.reload` earlier in `reloadConfig`

Current order ([ReloadConfigCommand.swift:32-38](Sources/AppBundle/command/impl/ReloadConfigCommand.swift:32)):

```
resetHotKeys()
config = parsedConfig
configUrl = url
try await activateMode(activeMode)   // can throw
syncStartAtLogin()
AutoRaiseController.reload(config: config.autoRaise)
MessageModel.shared.message = nil
```

If `activateMode` throws, `config` is updated but `AutoRaiseController.reload`
(and `syncStartAtLogin`, and the message clear) never run. Auto-raise sees the
old config even though the global `config` is new.

**Narrow fix.** Move `AutoRaiseController.reload` to directly after
`config = parsedConfig`:

```
resetHotKeys()
config = parsedConfig
configUrl = url
AutoRaiseController.reload(config: config.autoRaise)
try await activateMode(activeMode)
syncStartAtLogin()
MessageModel.shared.message = nil
```

This keeps the auto-raise view in sync with the global `config` regardless of
whether `activateMode` succeeds. The broader pattern (`syncStartAtLogin` and
`MessageModel` clearing also skipped on throw) is preexisting; fixing the
whole ordering story belongs in a separate change that can weigh the
rollback-vs-partial-apply tradeoff properly.

## Alternatives Considered

- **Leave I1 alone and document the quirk instead.** Rejected — the behavior
  is genuinely surprising (hover raises after `enable off`), and the fix is
  small.
- **Add a retry-cancel channel (ObjC++ learns about dropped raises).**
  Rejected for this change — correctness is fine, only wasted CPU on already-
  stopped retries. Revisit if profiling shows it matters.
- **Fold these fixes into the `integrate-autoraise` change itself (amend
  existing commits).** Rejected — review feedback is more reviewable as its
  own change. Once this lands, `integrate-autoraise` can be archived clean.

## Risks & Unknowns

- **Master-toggle coupling is a behavior change.** Users who relied on
  hover-raise continuing to work after `enable off` will notice. Unlikely to
  be intentional (the drift was a bug), but worth calling out in the
  guide.adoc auto-raise section.
- **`autoraise_start` returning `bool` ripples through the bridge ABI.**
  Internal API only; no external consumers.
- **I5 narrows a gap but doesn't close it.** If a reviewer asks "why not fix
  the whole ordering story," the answer is: scope. We address what the review
  surfaced; structural reload cleanup is a larger, separate change.
