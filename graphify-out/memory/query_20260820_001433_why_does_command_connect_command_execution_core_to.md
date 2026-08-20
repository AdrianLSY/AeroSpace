---
type: "query"
date: "2026-08-20T00:14:33.285658+00:00"
question: "Why does Command connect Command Execution Core to 20 other communities?"
contributor: "graphify"
outcome: "useful"
source_nodes: ["Command", "HotkeyBinding", "Config", "TreeNode", "FocusCommand", "MoveCommand"]
---

# Q: Why does Command connect Command Execution Core to 20 other communities?

## Answer

VERDICT (verified, not refuted): Command is a 10-line protocol (Sources/AppBundle/command/Command.swift:4, protocol Command: AeroAny, Equatable, Sendable) bridging via TWO simultaneous fan-outs: (1) conformance fan-in - 44 implements edges, exactly 44 files in command/impl/ conform (one struct per command, mandated by the three-place command pipeline), clustered into 9 communities; (2) existential-consumer fan-out - 17 references edges from subsystems that store/run any Command generically: HotkeyBinding.swift:61 (Shell<any Command>), Config.swift:37-63 (hook fields), parseOnWindowDetected.swift:6-8, Shell.swift:73+ (runShellAnd/Or/Seq/Pipe), refresh.swift:95-96 (isServerEnabled guard), parseCommand.swift:7/25. Contrast with TreeNode: Command is a centralized behavior contract others point AT (implements+references in); TreeNode is a stateful class whose subclasses inherit from it and whose own method body is smeared across subsystem files by Swift extensions (method edges pointing OUT).

## Outcome

- Signal: useful

## Source Nodes

- Command
- HotkeyBinding
- Config
- TreeNode
- FocusCommand
- MoveCommand