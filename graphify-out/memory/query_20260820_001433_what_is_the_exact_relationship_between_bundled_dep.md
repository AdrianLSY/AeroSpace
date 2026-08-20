---
type: "query"
date: "2026-08-20T00:14:33.189234+00:00"
question: "What is the exact relationship between Bundled Dependencies License Index and tomlplusplus MIT License?"
contributor: "graphify"
outcome: "useful"
source_nodes: ["Bundled Dependencies License Index", "tomlplusplus MIT License (Mark Gillard)"]
---

> **ERRATA — 2026-08-20.** This memo is a dated snapshot; its findings were true at
> commit `d42555f6`, the tree the graph was built from. The graph has since been
> re-mapped to `be847df0` and the claims below were re-verified against it.
>
> **CLOSED.** `legal/third-party-license/LICENSE-tomlplusplus.txt` was deleted by #3
> (`a6f9167b`) — the recommendation in this memo has been carried out. The directory now
> holds only `LICENSE-HotKey.txt`, `LICENSE-ISSoundAdditions.txt`, `LICENSE-TOMLDecoder.txt`
> and `LICENSE-swift-collections.txt`.
>
> The claim that "repo-wide grep matches only the license file itself" no longer holds in
> either direction: the file is gone, and the same PR added three prose mentions in
> `dev-docs/fork-maintenance.md` (lines 79, 82, 112) recording the deletion as a deliberate
> fork delta under "Deletions to re-verify".

# Q: What is the exact relationship between Bundled Dependencies License Index and tomlplusplus MIT License?

## Answer

VERDICT (verified, not refuted): stale license file. legal/third-party-license/LICENSE-tomlplusplus.txt is orphaned; legal/README.md correctly omits it. tomlplusplus is not a dependency on any axis: Package.swift:24-29 and Package.resolved pin only HotKey, TOMLDecoder 0.4.4, swift-collections, ISSoundAdditions; TOMLDecoder is pure Swift with no tomlplusplus dependency; repo-wide grep matches only the license file itself. Git history: file added 2024-07-07 (commit 2d21f579) in the TOMLKit era (TOMLKit wrapped tomlplusplus C++); commit 16a0b634 (Migrate from TOMLKit to TOMLDecoder, 2026-03-27) removed the README entries and deleted LICENSE-TOMLKIT.txt but forgot LICENSE-tomlplusplus.txt. Correct fix: delete the file (upstream oversight inherited by fork). The AMBIGUOUS/0.2 edge faithfully encoded a real inconsistency.

## Outcome

- Signal: useful

## Source Nodes

- Bundled Dependencies License Index
- tomlplusplus MIT License (Mark Gillard)