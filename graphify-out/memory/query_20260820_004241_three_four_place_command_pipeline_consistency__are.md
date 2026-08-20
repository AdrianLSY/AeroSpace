---
type: "query"
date: "2026-08-20T00:42:41.166784+00:00"
question: "Three/four-place command pipeline consistency: are CmdKind, toCommand(), docs adoc, and the BNF grammar in sync?"
contributor: "graphify"
outcome: "useful"
source_nodes: ["CmdKind", "commands-bnf-grammar.txt", "EchoCmdArgs", "SubscribeCmdArgs", "MoveWorkspaceToMonitorCmdArgs", "cmdArgsManifest.swift"]
---

> **ERRATA — 2026-08-20.** This memo is a dated snapshot; its findings were true at
> commit `d42555f6`, the tree the graph was built from. The graph has since been
> re-mapped to `be847df0` and the claims below were re-verified against it.
>
> **All six actionable findings are CLOSED.** Do not act on them.
>
> - (1) `echo --window` — fixed in #5 (`4e7a7a59`). `grammar/commands-bnf-grammar.txt:24` now
>   reads `echo [--stderr|--window-id <window_id>]... -- <string>...`. (The companion citation
>   `EchoCmdArgs.swift:10` was always off by one; the flag is declared at `:9`.)
> - (2) `move-workspace-to-monitor --workspace` — added in #5. Now at
>   `grammar/commands-bnf-grammar.txt:76-78`, not 71-72.
> - (3) `reload-config --warnings-as-errors` — added in #5, now at `:80`, not 74.
> - (4) `subscribe` exclusivity — fixed in #5; split into two productions at `:126-127`,
>   not 118. The parser citation `SubscribeCmdArgs.swift:23-28` is still exact.
> - (5) `eval <aerospace_shell_expr>` — restored in #5 at `:30`, with the terminal at `:136`.
> - The `move-workspace-to-display` validation bypass — fixed in #5.
>   `cmdArgsManifest.swift:124` now registers `parseWorkspaceToMonitorCmdArgs`, and
>   `MoveWorkspaceToMonitorCmdArgs.init` was demoted to `fileprivate`, making the bypass
>   structurally impossible. Regression test at `MoveWorkspaceToMonitorCommandTest.swift:14-18`.
>
> The closing clause "fix belongs upstream per fork no-delta policy" is also superseded:
> #5/#6 fixed these locally and the policy was amended to match (`FORK.md:8`, `:23`,
> `CLAUDE.md:10-11`). A drift guard now exists at `Sources/AppBundleTests/CompletionGrammarTest.swift`.

# Q: Three/four-place command pipeline consistency: are CmdKind, toCommand(), docs adoc, and the BNF grammar in sync?

## Answer

VERIFIED (all 6 actionable findings confirmed): Command-SET level fully consistent - 45 CmdKind cases = 45 toCommand() = 45 docs adoc; grammar has 44 with exec-and-forget legitimately exempt (config-only, toCommand() hard-fails it at cmdManifest.swift:27-28). But FLAG-level grammar rot in 5 commands (grammar/commands-bnf-grammar.txt): (1) line 24 echo advertises --window; parser only accepts --window-id (EchoCmdArgs.swift:10) - completion suggests a flag that always errors. (2) lines 71-72 omit move-workspace-to-monitor --workspace (supported in code+docs). (3) line 74 omits reload-config --warnings-as-errors. (4) line 118 subscribe grammar contradicts the parser exclusivity rule (exactly one of --all | events, SubscribeCmdArgs.swift:23-28). (5) line 30 eval omits mandatory <aerospace-shell-expr> positional. PLUS a validation bypass: deprecated alias move-workspace-to-display registered with raw MoveWorkspaceToMonitorCmdArgs.init (cmdArgsManifest.swift:124) instead of parseWorkspaceToMonitorCmdArgs (:122), silently accepting --wrap-around + monitor-pattern which the primary command rejects (filter at MoveWorkpsaceToMonitorCmdArgs.swift:21-26). All blame to upstream commits - fix belongs upstream per fork no-delta policy. Graph note: CmdKind cases close/split were mis-clustered into unrelated communities by generic labels.

## Outcome

- Signal: useful

## Source Nodes

- CmdKind
- commands-bnf-grammar.txt
- EchoCmdArgs
- SubscribeCmdArgs
- MoveWorkspaceToMonitorCmdArgs
- cmdArgsManifest.swift