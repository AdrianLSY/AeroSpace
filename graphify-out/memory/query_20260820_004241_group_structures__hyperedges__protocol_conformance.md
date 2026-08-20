---
type: "query"
date: "2026-08-20T00:42:41.265150+00:00"
question: "Group structures: hyperedges, protocol conformance patterns, distributed class bodies"
contributor: "graphify"
outcome: "useful"
source_nodes: ["CmdArgs", "Command", "TreeNode", "Window", "Workspace", "TilingContainer"]
---

> **ERRATA — 2026-08-20.** This memo is a dated snapshot; its findings were true at
> commit `d42555f6`, the tree the graph was built from. The graph has since been
> re-mapped to `be847df0` and the claims below were re-verified against it.
>
> **Both reported graphify tool bugs are FIXED, and one count is wrong.**
>
> - (a) Hyperedge id collision — fixed. The committed graph carries 20 hyperedges with 20
>   distinct ids; the two fork-release groups are `fork_release_pipeline` and
>   `fork_release_pipeline_docs`. A uniquify pass in the graphify skill prevents recurrence.
> - (b) CmdArgs node fragmentation — fixed. There is no node with id `cmdargs`; the single
>   node labelled `CmdArgs` is the real declaration at `Sources/Common/cmdArgs/parseCmdArgs.swift:13`
>   and it receives all 45 `implements` edges. This is a data patch, not an upstream fix: the
>   extractor re-mints the placeholder whenever a `*CmdArgs.swift` file is re-extracted, and
>   the merge was re-applied during the 2026-08-20 re-map. Expect it again after any
>   `graphify extract --force`.
> - Tier (3) extension counts: `extension Workspace` occurs in **5** files, not 6. TreeNode (6),
>   Window (7) and TilingContainer (5) are correct. A loose grep returns 7 only because it also
>   matches the unrelated `extension WorkspaceCmdArgs`.

# Q: Group structures: hyperedges, protocol conformance patterns, distributed class bodies

## Answer

VERIFIED (both actionable findings confirmed): Architecture organizes behavior in 3 tiers: (1) flat conformance tables at the CLI boundary - 45 CmdArgs conformers (protocol at parseCmdArgs.swift:13) and 44 Command conformers, wired by two manifest switches; (2) single inheritance hierarchy for the window tree (TreeNode + 10 subclasses); (3) extension-scattering - subsystems graft verbs onto tree nouns: extension TreeNode in 6 files, Window in 7, Workspace in 6, TilingContainer in 5; dependency direction stays subsystem->tree. GRAPHIFY TOOL BUGS FOUND: (a) two distinct hyperedges share id fork_release_pipeline (from release-adrianlsy.yml and fork-maintenance.md) - consumers keying by id drop one; extractor should uniquify. (b) CmdArgs node fragmentation: all 45 implements edges target placeholder node id cmdargs (no source_file) while 8 other CmdArgs-labeled nodes exist and the real declaration node gets zero implements edges. Also: implements edges conflate raw-value enum backing (enum X: String, 18 edges to String) with protocol conformance; method edges conflate call sites with extension definitions (LexerToken external methods are all test invocations). 8 of 17 hyperedges are image-scene noise; most valuable: command_definition_workflow, fork_release_pipeline, fork_issue_routing (the last two encode the fork entire delta).

## Outcome

- Signal: useful

## Source Nodes

- CmdArgs
- Command
- TreeNode
- Window
- Workspace
- TilingContainer