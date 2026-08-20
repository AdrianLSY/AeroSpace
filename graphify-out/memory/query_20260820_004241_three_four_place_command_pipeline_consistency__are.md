---
type: "query"
date: "2026-08-20T00:42:41.166784+00:00"
question: "Three/four-place command pipeline consistency: are CmdKind, toCommand(), docs adoc, and the BNF grammar in sync?"
contributor: "graphify"
outcome: "useful"
source_nodes: ["CmdKind", "commands-bnf-grammar.txt", "EchoCmdArgs", "SubscribeCmdArgs", "MoveWorkspaceToMonitorCmdArgs", "cmdArgsManifest.swift"]
---

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