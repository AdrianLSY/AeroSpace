---
type: "query"
date: "2026-08-20T00:14:33.383813+00:00"
question: "Are the 220 inferred relationships involving parseCommand() actually correct?"
contributor: "graphify"
outcome: "useful"
source_nodes: ["parseCommand()", "testUtil.swift", "server.swift", "EvalCommand"]
---

# Q: Are the 220 inferred relationships involving parseCommand() actually correct?

## Answer

VERDICT (verified, not refuted): YES - 12/12 sampled edges verified (100%), correct direction, and the feared test/production conflation did NOT happen. The 220-edge node is the TEST helper parseCommand (Sources/AppBundleTests/testUtil.swift:101); the production functions (Sources/AppBundle/command/parseCommand.swift:3 and :25) are a SEPARATE node (degree 13) whose 5 production call sites (server.swift:71, parseConfig.swift:186/192, parseOnWindowDetected.swift:108, EvalCommand.swift:8) are correctly attributed. Overload resolution confirms attribution: all test call sites are single-String calls which can only resolve to the helper. One harmless merge exists: the two production overloads (L3/L25) share one node. Minor recall gaps (missing edges, not wrong edges): helper-to-production delegation call and the production recursive call have no edges. Graph dedupes one call edge per calling function (331 raw call sites -> 221 edges).

## Outcome

- Signal: useful

## Source Nodes

- parseCommand()
- testUtil.swift
- server.swift
- EvalCommand