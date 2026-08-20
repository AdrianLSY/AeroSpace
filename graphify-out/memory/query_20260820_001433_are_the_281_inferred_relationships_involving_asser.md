---
type: "query"
date: "2026-08-20T00:14:33.333660+00:00"
question: "Are the 281 inferred relationships involving assertEquals() actually correct?"
contributor: "graphify"
outcome: "useful"
source_nodes: ["assertEquals()", "assert.swift", "ConfigTest", "LayoutCommandTest"]
---

> **ERRATA — 2026-08-20.** This memo is a dated snapshot; its findings were true at
> commit `d42555f6`, the tree the graph was built from. The graph has since been
> re-mapped to `be847df0` and the claims below were re-verified against it.
>
> **Count superseded.** There are now **283** distinct test methods calling `assertEquals`,
> not 281. #5 added `testDeprecatedAliasIsValidatedLikeTheCanonicalName()`
> (`MoveWorkspaceToMonitorCommandTest.swift:14`) and #6 added
> `testNotHelpDoesNotLeakTestUsage()` (`TestCommandTest.swift:35`), each in a file that already
> had callers. The edge-correctness verdict (all edges correct, sole declaration at
> `assert.swift:34`) is unaffected.

# Q: Are the 281 inferred relationships involving assertEquals() actually correct?

## Answer

VERDICT (verified, not refuted; verifier exhaustively checked ALL 281, not just the sample): YES - 281/281 correct. Node sources_appbundletests_assert_assertequals (assert.swift:34, sole declaration repo-wide). All 281 INFERRED edges are calls edges from distinct test methods (39 files, all under Sources/AppBundleTests/), correct caller->callee direction. Deterministic 12-edge sample: 12/12 verified at exact cited lines; verifier then scanned all 281 caller bodies - 281/281 semantically correct. Why INFERRED not EXTRACTED: Swift visibility is module-scoped so cross-file calls carry no import evidence; extractor conservatively downgrades cross-file name resolution. All 10 EXTRACTED edges are intra-assert.swift. The INFERRED label reflects extractor conservatism, not errors.

## Outcome

- Signal: useful

## Source Nodes

- assertEquals()
- assert.swift
- ConfigTest
- LayoutCommandTest