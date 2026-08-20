---
type: "query"
date: "2026-08-20T00:14:33.333660+00:00"
question: "Are the 281 inferred relationships involving assertEquals() actually correct?"
contributor: "graphify"
outcome: "useful"
source_nodes: ["assertEquals()", "assert.swift", "ConfigTest", "LayoutCommandTest"]
---

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