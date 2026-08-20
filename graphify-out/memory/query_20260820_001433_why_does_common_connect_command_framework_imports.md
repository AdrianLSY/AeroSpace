---
type: "query"
date: "2026-08-20T00:14:33.236991+00:00"
question: "Why does Common connect Command Framework Imports to 57 other communities?"
contributor: "graphify"
outcome: "useful"
source_nodes: ["Common", "server.swift", "_main.swift", "parseCommand.swift"]
---

> **ERRATA — 2026-08-20.** This memo is a dated snapshot; its findings were true at
> commit `d42555f6`, the tree the graph was built from. The graph has since been
> re-mapped to `be847df0` and the claims below were re-verified against it.
>
> **Count superseded.** #6 added `Sources/AppBundleTests/CompletionGrammarTest.swift`, whose
> line 2 is `@testable import Common`. The test-file count is now **46**, not 45, for a total of
> **159** import edges, not 158; "grep count matches exactly" no longer holds. AppBundle (111)
> and Cli (2) are unchanged.

# Q: Why does Common connect Command Framework Imports to 57 other communities?

## Answer

VERDICT (verified, not refuted): Common is not a file but the shared SPM library target (Package.swift:39-45). All 158 edges are AST import edges (import Common statements: 111 AppBundle files, 45 test files, 2 Cli files - grep count matches exactly). The bridge SHAPE is an import-graph artifact (one module node vs 58 fine-grained communities inflates betweenness 0.116), but the fan-in reflects the real shared-parser constraint (CLAUDE.md): args parsed on client (Sources/Cli/_main.swift:58) and re-parsed on server (server.swift:71 -> parseCommand.swift:26) via the same code in Sources/Common/cmdArgs/ - Common is the ONLY in-repo target both Cli (Package.swift:68) and AppBundle (Package.swift:53) depend on.

## Outcome

- Signal: useful

## Source Nodes

- Common
- server.swift
- _main.swift
- parseCommand.swift