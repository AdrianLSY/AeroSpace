---
type: "query"
date: "2026-08-20T00:42:41.328163+00:00"
question: "Cohesion outliers: which communities are junk clusters vs real subsystems?"
contributor: "graphify"
outcome: "useful"
source_nodes: ["Command Test Fixtures", "assertEquals()", "shellLexer.swift", "ArrSlice", "FocusCmdArgs", "MoveCmdArgs"]
---

# Q: Cohesion outliers: which communities are junk clusters vs real subsystems?

## Answer

VERIFIED (actionable finding confirmed): The GRAPH_REPORT.md cohesion column is internal-edge DENSITY (size-biased) - verifier matched 14/14 communities to density and 0/14 to internal-edge fraction - and per-community node counts understate true sizes non-uniformly (c0 listed 14 vs true 117; c4 listed 5 vs true 64; c16 correct at 44). Report should state metric and true sizes. Findings: all four perfectly-cohesive (1.00) communities are non-code (OpenSpec skills, CI pipeline, dev scripts, fork docs); Fork Docs & Guidance has ZERO edges into any code community - no doc-to-code traceability in the graph. Tightest real code subsystems: hand-written shell lexer/parser (0.907 fraction) and ArrSlice (0.896). Junk clusters: c18 Command Framework Imports (0.257, ~40 file nodes glued by imports edges); c48 absorbed SetEx.swift via bare generic-type nodes (Element/Self/Int label collisions); god-node placement creates phantom coupling (assertEquals in c4 makes Config Parsing Tests look like the top partner of the command-test megacluster). Code oddity spotted: exact duplicate Boundaries enum in FocusCmdArgs.swift:49-52 and MoveCmdArgs.swift:23-26 (upstream-owned, no fork action).

## Outcome

- Signal: useful

## Source Nodes

- Command Test Fixtures
- assertEquals()
- shellLexer.swift
- ArrSlice
- FocusCmdArgs
- MoveCmdArgs