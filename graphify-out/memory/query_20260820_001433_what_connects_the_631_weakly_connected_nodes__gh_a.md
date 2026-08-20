---
type: "query"
date: "2026-08-20T00:14:33.434166+00:00"
question: "What connects the 631 weakly-connected nodes (gh-actions-runner-xcode-select.sh, PackageDescription, .asMap) to the rest of the system?"
contributor: "graphify"
outcome: "useful"
source_nodes: ["gh-actions-runner-xcode-select.sh script", "PackageDescription", ".asMap", "Result.failureOrNil", "Bool.orAsync"]
---

# Q: What connects the 631 weakly-connected nodes (gh-actions-runner-xcode-select.sh, PackageDescription, .asMap) to the rest of the system?

## Answer

VERDICT (verified, not refuted): effectively all ~631 are extraction artifacts, NOT dead code. Definition: degree<=1 nodes deduplicated by label (1183 ids -> ~664 labels; report said 631). Four artifact kinds: (a) per-file scoped stdlib/external type duplicates (461 nodes with no source_file: Bool, String, T); (b) declared members whose call sites were not linked (.asMap declared CmdEnv.swift:28, really called at ExecAndForgetCommand.swift:12 - edge just missing); (c) unmerged duplicate entities: gh-actions-runner-xcode-select.sh extracted TWICE (once from .sh = 2-node island, once from workflow YAML = degree 4 with edges to all 4 real CI invocations at build.yml:33/:53, pages.yml:24, release-adrianlsy.yml:17) - graphify entity-resolution failure; (d) genuine boundary leaves (PackageDescription = import PackageDescription at Package.swift:4, correctly degree-1). Grep sweep of 567 degree<=1 Sources symbols: 561 genuinely used. Only 2 real dead-code candidates: Result.failureOrNil (Sources/Common/util/ResultEx.swift:57, zero callers, no periphery:ignore, and periphery scanning is disabled in lint.sh on all macOS versions so CI cannot catch it) and Bool.orAsync (BoolEx.swift:17, zero callers but deliberately kept with periphery:ignore).

## Outcome

- Signal: useful

## Source Nodes

- gh-actions-runner-xcode-select.sh script
- PackageDescription
- .asMap
- Result.failureOrNil
- Bool.orAsync