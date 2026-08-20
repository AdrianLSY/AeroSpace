---
type: "query"
date: "2026-08-20T00:42:41.215236+00:00"
question: "Refresh-session invariant: do all tree mutations route through runLightSession/refreshModel?"
contributor: "graphify"
outcome: "useful"
source_nodes: ["runLightSession()", "runHeavyCompleteRefreshSession()", "refresh.swift", "initAppBundle.swift", "GlobalObserver.swift"]
---

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