---
type: "query"
date: "2026-08-20T00:42:41.118612+00:00"
question: "Docs-vs-code drift audit: which CLAUDE.md / dev-docs claims still hold?"
contributor: "graphify"
outcome: "useful"
source_nodes: ["CLAUDE.md Project Guidance", "swift-test.sh", "architecture.md", "development.md", "lint.sh"]
---

> **ERRATA — 2026-08-20.** This memo is a dated snapshot; its findings were true at
> commit `d42555f6`, the tree the graph was built from. The graph has since been
> re-mapped to `be847df0` and the claims below were re-verified against it.
>
> **Two of six findings are CLOSED; four remain actionable.**
>
> - Finding (1) `swift-test.sh --filter` — closed by #4 (`95a4f91f`). The script is unchanged
>   (line 5 still runs bare `swift test`), but `CLAUDE.md:45-56` now documents that limitation
>   instead of promising pass-through, so there is no doc-vs-code contradiction left.
> - Finding (5) `MacosUnconventionalWindowsContainer` / `normalizeLayoutReason.swift` — closed
>   by #4. `CLAUDE.md:180-187` now states the file declares no type of that name, lists the four
>   sibling containers, and places `normalizeLayoutReason.swift` one level up from `tree/`.
>
> The opening tally "all 6 actionable findings" and "11/15 sampled claims HOLD" are therefore
> both superseded.

# Q: Docs-vs-code drift audit: which CLAUDE.md / dev-docs claims still hold?

## Answer

VERIFIED (all 6 actionable findings confirmed by adversarial re-check): 11/15 sampled claims HOLD exactly. DRIFTED: (1) swift-test.sh:5 runs swift test with NO argument forwarding - CLAUDE.md's promised --filter passthrough is silently ignored, full suite always runs. (2) dev-docs/architecture.md:17-24 describes nonexistent xcode-app-bundle-launcher/ dir and root-level AeroSpace.xcodeproj/project.yml; real: Sources/AeroSpaceApp/AeroSpaceApp.swift and xcode/{AeroSpace.xcodeproj,project.yml}. (3) dev-docs/development.md:45 lists nonexistent swiftformat.sh (real: format.sh), omits lint.sh and swift-test.sh. (4) lint.sh:20-32 periphery skip cites AutoRaiseCore which commit d42555f6 removed - stale rationale, though d42555f6's message deliberately deferred this. (5) CLAUDE.md names type MacosUnconventionalWindowsContainer which does not exist (file defines 4 separate container classes); normalizeLayoutReason.swift is at Sources/AppBundle/, not tree/. (6) The 0.95 semantically_similar_to edge claude_spm_vs_xcode_split <-> dev_docs counterpart links CONTRADICTORY descriptions (CLAUDE.md right, architecture.md stale) - the graph edge marks a real doc-vs-doc contradiction. HOLDS include: swiftlint check-mode, bash>=5 PATH nuke, hand-written shell parser, Window.get(byId:) test branch, single private API, refresh-session claims, NonisolatedNonsendingByDefault.

## Outcome

- Signal: useful

## Source Nodes

- CLAUDE.md Project Guidance
- swift-test.sh
- architecture.md
- development.md
- lint.sh