---
type: "query"
date: "2026-08-20T00:14:33.236991+00:00"
question: "Why does Common connect Command Framework Imports to 57 other communities?"
contributor: "graphify"
outcome: "useful"
source_nodes: ["Common", "server.swift", "_main.swift", "parseCommand.swift"]
---

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