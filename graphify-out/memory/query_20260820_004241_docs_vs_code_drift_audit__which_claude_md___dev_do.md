---
type: "query"
date: "2026-08-20T00:42:41.118612+00:00"
question: "Docs-vs-code drift audit: which CLAUDE.md / dev-docs claims still hold?"
contributor: "graphify"
outcome: "useful"
source_nodes: ["CLAUDE.md Project Guidance", "swift-test.sh", "architecture.md", "development.md", "lint.sh"]
---

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