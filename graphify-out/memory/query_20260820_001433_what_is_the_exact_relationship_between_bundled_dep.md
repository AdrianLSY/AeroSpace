---
type: "query"
date: "2026-08-20T00:14:33.189234+00:00"
question: "What is the exact relationship between Bundled Dependencies License Index and tomlplusplus MIT License?"
contributor: "graphify"
outcome: "useful"
source_nodes: ["Bundled Dependencies License Index", "tomlplusplus MIT License (Mark Gillard)"]
---

# Q: What is the exact relationship between Bundled Dependencies License Index and tomlplusplus MIT License?

## Answer

VERDICT (verified, not refuted): stale license file. legal/third-party-license/LICENSE-tomlplusplus.txt is orphaned; legal/README.md correctly omits it. tomlplusplus is not a dependency on any axis: Package.swift:24-29 and Package.resolved pin only HotKey, TOMLDecoder 0.4.4, swift-collections, ISSoundAdditions; TOMLDecoder is pure Swift with no tomlplusplus dependency; repo-wide grep matches only the license file itself. Git history: file added 2024-07-07 (commit 2d21f579) in the TOMLKit era (TOMLKit wrapped tomlplusplus C++); commit 16a0b634 (Migrate from TOMLKit to TOMLDecoder, 2026-03-27) removed the README entries and deleted LICENSE-TOMLKIT.txt but forgot LICENSE-tomlplusplus.txt. Correct fix: delete the file (upstream oversight inherited by fork). The AMBIGUOUS/0.2 edge faithfully encoded a real inconsistency.

## Outcome

- Signal: useful

## Source Nodes

- Bundled Dependencies License Index
- tomlplusplus MIT License (Mark Gillard)