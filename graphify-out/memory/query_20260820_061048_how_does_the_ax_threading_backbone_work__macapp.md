---
type: "query"
date: "2026-08-20T06:10:48.419571+00:00"
question: "How does the AX-threading backbone work (MacApp + RunLoopJob): scheduler, per-app wrapper, end-to-end command path, inbound events?"
contributor: "graphify"
outcome: "useful"
source_nodes: ["MacApp", "RunLoopJob", "ThreadGuardedValue", "AxSubscription", "runLightSession()", "MoveCommand", ".layoutRecursive()", "GlobalObserver.swift", "AxAppThreadToken"]
---

# Q: How does the AX-threading backbone work (MacApp + RunLoopJob): scheduler, per-app wrapper, end-to-end command path, inbound events?

## Answer

VERIFIED (4 traces, 4 adversarial verifiers, zero refutations): AeroSpace runs ONE real Foundation Thread + CFRunLoop per app (MacApp.getOrRegister, MacApp.swift:46-100; thread named AxAppThread, parks in CFRunLoopRun at :86; custom-actor-executor rejected as macOS-14-only, :4-6). Jobs reach the thread via RunLoopAction.perform(#selector, on: thread, waitUntilDone: false) (runLoop.swift:6-15). Async bridge: runInLoop wraps withCheckedThrowingContinuation inside withTaskCancellationHandler (runLoop.swift:17-39); onCancel flips RunLoopJob's hand-rolled OSAtomic flag (:65-72, author notes Atomic<Bool> needs macOS 15); in-flight AX calls are never interrupted - job bodies poll job.checkCancellation() between AX calls (setFrame :415-417, getAxRect :406). AXUIElement refs NEVER cross threads: boxed in ThreadGuardedValue (Sendable over nonisolated(unsafe) storage, runtime token check on every access, ThreadGuardedValue.swift:3-24); only value types (Rect, UInt32 windowId) return. lint.sh bans raw Task.init in favor of Task.startUnstructured (@_inheritActorContext wrapper, TaskEx.swift:8-19). END-TO-END 'move left': CLI sends RAW args + AEROSPACE_WINDOW_ID env over unix socket (_main.swift:117,157-160) -> server re-parses with shared parser (server.swift:71) -> awaited hop to @MainActor runLightSession (server.swift:90) -> one awaited AX round trip for getNativeFocusedWindow (refresh.swift:69) -> MoveCommand.run is pure in-memory tree mutation, zero AX (MoveCommand.swift:8-45) -> relayout at session end (refresh.swift:82) writes lastAppliedLayout*Rect and issues setAxFrame per changed window (layoutRecursive.swift:33-40) -> FIRE-AND-FORGET job per window: cancel prior setFrameJobs entry, disableAnimations (AXEnhancedUserInterface off, MacApp.swift:424-436), size->position->size write order (issues #143/#335, :411-419), bottoming in public AXUIElementSetAttributeValue; the server reply can be written before pixels move. INBOUND: NSWorkspace notifs on queue .main (GlobalObserver.swift:49-54); AX callbacks land on the per-app thread (AxSubscription adds observer source to CFRunLoopGetCurrent, AxSubscription.swift:44; app-level kAXWindowCreated/kAXFocusedWindowChanged, window-level Destroyed/Mini/Demini->refreshObs, Moved->movedObs, Resized->resizedObs, MacApp.swift:69,375-383); all hop back via Task.startUnstructured { @MainActor }. Coalescing is cancel-and-replace (latest wins), NOT time-debounce - only the config watcher debounces (200ms, ConfigFileWatcher.swift:29-43). New-window AX registration is deferred while left mouse is down to support tab drag-out (MacApp.swift:393). MOST FRAGILE SPOT (verified): the ThreadGuardedValue/AxAppThreadToken guard checks a TASK-LOCAL token (pid-compared, AxAppThreadToken.swift:15), not real thread identity - and Task.startUnstructured copies task-locals, so main-actor tasks spawned from AX callbacks (refresh.swift:145, moveWithMouse.swift:10, MacApp.swift:80) carry the app's token onto the main actor; main-actor code touching x.windows.threadGuarded would PASS the check while the AX thread concurrently mutates it. Today all access routes through runInLoop by convention; the compiler cannot catch a violation (ThreadGuardedValue is Sendable). Runner-up: RunLoopJob._isCancelled unsynchronized read of a deprecated OSAtomic flag (stale-read worst case only).

## Outcome

- Signal: useful

## Source Nodes

- MacApp
- RunLoopJob
- ThreadGuardedValue
- AxSubscription
- runLightSession()
- MoveCommand
- .layoutRecursive()
- GlobalObserver.swift
- AxAppThreadToken