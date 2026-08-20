---
type: "query"
date: "2026-08-20T00:42:41.215236+00:00"
question: "Refresh-session invariant: do all tree mutations route through runLightSession/refreshModel?"
contributor: "graphify"
outcome: "useful"
source_nodes: ["runLightSession()", "runHeavyCompleteRefreshSession()", "refresh.swift", "initAppBundle.swift", "GlobalObserver.swift"]
---

> **ERRATA — 2026-08-20.** This memo is a dated snapshot; its findings were true at
> commit `d42555f6`, the tree the graph was built from. The graph has since been
> re-mapped to `be847df0` and the claims below were re-verified against it.
>
> **Count was already wrong when written — not caused by #3–#6.** The tree has **13**
> `runLightSession` call sites, not 12: `GlobalObserver.swift:26` and `:68`,
> `initAppBundle.swift:31`, `server.swift:90`, `ui/MenuBar.swift:19`, `:34`, `:54`, `:116`,
> `config/ConfigFileWatcher.swift:39`, `config/HotkeyBinding.swift:39`,
> `mouse/moveWithMouse.swift:19`, `mouse/resizeWithMouse.swift:19`,
> `mouse/focusFollowsMouse.swift:46` (excluding the declaration at `layout/refresh.swift:59`).
> The "graph in-edges match grep 1:1" parenthetical therefore does not hold. The invariant
> itself was re-checked and still holds.

# Q: Refresh-session invariant: do all tree mutations route through runLightSession/refreshModel?

## Answer

VERIFIED EXPLORATION (no actionable findings - invariant HOLDS): All 12 runLightSession call sites, both runHeavyCompleteRefreshSession callers, 6 external schedulers enumerated (graph in-edges match grep 1:1); every tree-structure mutation outside Sources/AppBundle/tree/ traces to a session. Single-flight mechanism: one @MainActor task slot activeRefreshTask (refresh.swift:5); scheduleCancellableCompleteRefreshSession cancels prior task (:12) and checks cancellation on entry (:14); runLightSession preempts heavy (:66-67) and reschedules at exit (:86); light sessions are NOT slot-registered so light-light interleaving at await points is possible, mitigated by refreshModel before/after body (:74-76). Two deliberate out-of-session mutations, both currently safe: (1) startup bootstrap initAppBundle.swift:22-23 (garbageCollectUnusedWorkspaces + focusWorkspace) after server/observers live at :20-21 - safe only because the stretch is synchronous @MainActor; an inserted await would break it. (2) resetManipulatedWithMouseIfPossible on mouse-up (GlobalObserver.swift:57-62) mutates only non-structural bookkeeping. Termination path (appBundleUtil.swift:28-52) bypasses sessions but never mutates the tree - comment forbids .parent calls.

## Outcome

- Signal: useful

## Source Nodes

- runLightSession()
- runHeavyCompleteRefreshSession()
- refresh.swift
- initAppBundle.swift
- GlobalObserver.swift