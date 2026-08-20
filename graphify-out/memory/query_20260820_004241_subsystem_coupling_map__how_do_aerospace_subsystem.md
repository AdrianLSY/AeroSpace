---
type: "query"
date: "2026-08-20T00:42:41.070672+00:00"
question: "Subsystem coupling map: how do AeroSpace subsystems actually depend on each other beyond imports?"
contributor: "graphify"
outcome: "useful"
source_nodes: ["TreeNode", "moveWithMouse.swift", "resizeWithMouse.swift", "onFocusChanged()", "KnownBundleId", "RunLoopJob", "MacApp"]
---

# Q: Subsystem coupling map: how do AeroSpace subsystems actually depend on each other beyond imports?

## Answer

VERIFIED EXPLORATION (no refutations): Top non-import couplings are test plumbing (parseCommand/.new()/assert helpers, 112+52+51+49 edges). Real signals: (1) mouse/ has no structural identity - resizeWithMouse.swift:81-96 defines a fileprivate extension ON TreeNode mutating weights via userData, moveWithMouse.swift:52 nulls window.lastAppliedLayoutPhysicalRect, both invalidate the lock-screen closedWindowsCache; both entry paths carry upstream 'todo cover with tests'. (2) Focus events execute user-configured command shells (focus.swift:171 config.onFocusChanged.run) with the config->focus->command->focus cycle broken only by global bool onFocusChangedRecursionGuard (focus.swift:119,143-145). (3) Config parsing depends on the CLI arg grammar (parseConfig.swift:186,192 call parseCommand) - upstream grammar changes silently change config validity. (4) Shell.swift:121-160 runShellOr/And/Seq/Pipe are an alternate front-end driving command execution with pipefail semantics. (5) Window classification is a 30-case per-app bundle-ID table (KnownBundleId.swift referenced at AxUiElementWindowType.swift:21,101,172,202). (6) MacApp+RunLoopJob (MacApp.swift:74,152,182,355; runLoop.swift:61,74) is the strict-concurrency backbone: every AX access is a cross-thread job.

## Outcome

- Signal: useful

## Source Nodes

- TreeNode
- moveWithMouse.swift
- resizeWithMouse.swift
- onFocusChanged()
- KnownBundleId
- RunLoopJob
- MacApp