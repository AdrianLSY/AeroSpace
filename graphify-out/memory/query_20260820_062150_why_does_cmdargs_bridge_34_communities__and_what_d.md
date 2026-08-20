---
type: "query"
date: "2026-08-20T06:21:50.673345+00:00"
question: "Why does CmdArgs bridge 34 communities, and what does it add beyond the Command bridge?"
contributor: "graphify"
outcome: "useful"
source_nodes: ["CmdArgs", "Command", "SubscribeCmdArgs", "cmdManifest.swift", "RefreshSessionEvent", "parseCmdArgs.swift"]
---

# Q: Why does CmdArgs bridge 34 communities, and what does it add beyond the Command bridge?

## Answer

VERIFIED (one trace claim corrected by the verifier): CmdArgs (parseCmdArgs.swift:13) has 73 edges across 34 neighbor communities, betweenness 0.0718 (Command: 0.0680 - nearly equal). Protocol requires exactly 3 things: associatedtype ExitCodeType (default BinaryExitCode), static parser: CmdParser<Self>, var commonState (L20-22); everything else is derived in the same-file extension. Two AppBundle extensions retrofit server-only powers: toCommand() 45-case switch (cmdManifest.swift:3-101, refuses execAndForget and subscribe) and resolveTargetOrReportError (cmdResolveTargetOrReportError.swift, the --window-id > --workspace > env > focus precedence). The 45 implements edges scatter across 23 communities (arg structs co-cluster with their own command helpers) vs Command's 44 implements over only 9 (impls clump on shared tree/focus deps). Pairing: 44/45 pair 1:1 by name; the CmdArgs with NO Command counterpart is SubscribeCmdArgs (NOT exec-and-forget): subscribe is a long-lived stream the server intercepts BEFORE parseCommand (server.swift:62-70); ExecAndForgetCommand exists - its asymmetry is wiring (toCommand refuses it), matching the pipeline-consistency findings. VERIFIER CORRECTION: the trace called the CmdArgs->RefreshSessionEvent edge extractor noise; it is REAL - case socketServer(any CmdArgs) at commonUtil.swift:94 (the graph is undirected; the reference originates in commonUtil.swift, not parseCmdArgs.swift). Verdict: mostly the client-side mirror of the Command story, but with three real additions: Command structurally hangs OFF CmdArgs (associatedtype T: CmdArgs), the parse-twice constraint explains why CmdArgs lives in Common, and the subscribe asymmetry is only visible from this side.

## Outcome

- Signal: useful

## Source Nodes

- CmdArgs
- Command
- SubscribeCmdArgs
- cmdManifest.swift
- RefreshSessionEvent
- parseCmdArgs.swift