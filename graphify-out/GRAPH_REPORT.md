# Graph Report - AeroSpace  (2026-08-20)

## Corpus Check
- 382 files · ~345,190 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 3773 nodes · 8710 edges · 186 communities (164 shown, 22 thin omitted)
- Extraction: 81% EXTRACTED · 19% INFERRED · 0% AMBIGUOUS · INFERRED: 1659 edges (avg confidence: 0.81)
- Token cost: 107,671 input · 0 output

## Community Hubs (Navigation)
- Command Test Fixtures
- CmdArgs Protocol Core
- Command Stdin Tests
- Recursive Layout Engine
- Config Command Args
- Move Mouse Args
- Command Pipeline & Rebase Docs
- Volume HUD Panel
- CmdArgs Conformance Findings
- Array Slice Utility
- Direction Enums
- Layout Test DSL
- MacApp AX Threading
- Run Callback Args
- Optional Extensions
- Workspace To Monitor Args
- Shell Test DSL
- Shared Arg Enums
- Tree Node Case Enums
- Non-Leaf Node Kinds
- Arg Parser Framework
- Secure Input HUD
- AX Element Attributes
- AX Dump Fixtures
- Appearance & SwiftUI Views
- Frozen Tree Snapshots
- Echo Command Tests
- Array Extensions
- Shell Parser Tests
- Debug Windows Recording
- Move Workspace Tests
- Subscribe Args Tests
- String Logical Segments
- Collection Extensions
- Move Node Commands
- Sequence Patterns
- Server Enablement Checks
- List Modes Args
- Shell Execution & IO
- Split Command Args
- Swap Command Args
- Subcommand Parser Registry
- Nullable Wrapper
- Config File Watcher
- Lazy Sequence Filters
- Exec Env Config
- App Entry Point
- Completable Future
- Command Kind Registry
- JSON Encoder Defaults
- MainActor Isolation Checks
- Container Auto-Flatten
- Tiling Container Test Helpers
- NonCopyable Wrapper
- Refresh Session Engine
- NS Panel HUD
- AX Element Mock
- Activation Policy Helper
- Equatable Noop Wrapper
- Join Args Helper
- Tree Node Containers
- Cardinal Direction Moves
- Tray Menu & Status UI
- TreeNode Base Class
- Config Parsing & Diagnostics
- Format Variable Expansion
- Test Assertion Helpers
- Focus State Management
- Boolean Flag Parsers
- Format Interpolation Vars
- CLI Entry Point
- MacWindow Lifecycle
- Format Command Tests
- Config Parsing Tests
- Specific Arg Parsing
- Broadcast Latch Async
- AX Run Loop & Frames
- AeroAny & App Abstraction
- Window Layout Primitives
- Workspace Command Args
- Config Value Parsers
- Frozen Tree Types
- Interpolated Arg Consumption
- Monitor Description Parsing
- Test Harness Setup
- Key Mapping & Presets
- JSON Model
- Monitor Target Args
- Unix Socket Connection
- Per-Monitor Gaps Config
- Focus Direction Args
- Client-Server Protocol
- Layout Command Args
- Shell Lexer & Parser
- Tree Node Parent Cases
- Config Parse Diagnostics
- String Interpolation Tokens
- Hotkey Binding Config
- Move Node Tests
- Test Command Args
- Common Utility Extensions
- Command Execution Core
- Config Command Values
- Result Extensions
- Rect Geometry
- Test & Test-Not Commands
- Config Root Model
- Grammar Test Parser
- Format Primitives
- Exit Code Commands
- Tree Node Binding
- Known Bundle IDs
- Workspace Model
- Cross-File Import Hub
- Window Detected Callbacks
- Tiling Container Nodes
- Fullscreen Command Args
- List Windows Args
- Server Event Types
- CGPoint Offset Helpers
- List Command Args
- Command Parse Results
- AX Subscriptions & Threading
- Array Slice Collection
- App Termination Handling
- Menu Bar Actions
- AX Accessibility Attributes
- Layout Normalization
- Refresh Session Events
- Monitor Info Impl
- Window Detected Tests
- Command Dispatch & Shell
- List Workspaces Args
- Volume Command Args
- Reload Config Command
- AX Dump Recursive
- Enable Command Args
- MRU Stack
- Relative Monitor Resolution
- Native Focus & Mouse Probes
- AX Thread Guard Findings
- Collection Grouping Helpers
- Env Variable Tests
- Start At Login
- Range Extensions
- Window Tree Membership
- Shared Parser Constraint
- Grammar & Rebase Protocol
- Focus Grammar Nonterminals
- Layouts Grammar Nonterminal
- CLI Grammar Productions
- Command Module Imports
- Code Generation Pipeline
- Docs & Completion Build Scripts
- AX Trust Prompt
- Clean Xcode Script
- Publish Release Script
- Reset AX Permission
- Test Suite Imports
- Bool Stub Node
- Build & Dev Scripts
- CI Release Pipeline
- Project Docs & Licensing
- Release Build Scripts
- Fork Release Workflow
- ISSoundAdditions License
- HotKey License
- TOMLDecoder License
- OpenSpec Workflow Skills
- TreeNode Bridge Findings
- Fork Docs & Drift Audit
- Good Monitor Arrangement
- App Icon Design
- Bad Monitor Arrangement
- Stacked Monitor Pitfall
- Horizontal Accordion Diagram
- Vertical Accordion Diagram
- swift-collections License
- SwiftLint Configuration
- Window Tree Diagram
- Call Edge Dedup Findings
- Hyperedge ID Collision Fix

## God Nodes (most connected - your core abstractions)
1. `assertEquals()` - 279 edges
2. `parseCommand()` - 214 edges
3. `Common` - 159 edges
4. `CmdArgs` - 76 edges
5. `TreeNode` - 75 edges
6. `CmdIo` - 74 edges
7. `Command` - 69 edges
8. `OrderedJson` - 68 edges
9. `CmdEnv` - 64 edges
10. `assertTrue()` - 61 edges

## Surprising Connections (you probably didn't know these)
- `CmdArgs Protocol Bridge` --references--> `CmdArgs`  [INFERRED]
  graphify-out/memory/query_20260820_062150_why_does_cmdargs_bridge_34_communities__and_what_d.md → Sources/Common/cmdArgs/parseCmdArgs.swift
- `Command Pipeline Four-Place Consistency` --references--> `CmdKind`  [INFERRED]
  graphify-out/memory/query_20260820_004241_three_four_place_command_pipeline_consistency__are.md → Sources/Common/cmdArgs/cmdArgsManifest.swift
- `TreeNode Three Bridge Mechanisms` --references--> `TreeNode`  [INFERRED]
  graphify-out/memory/query_20260819_135128_why_does_treenode_connect_treenode_base_class_to_1.md → Sources/AppBundle/tree/TreeNode.swift
- `Duplicate Boundaries Enum` --references--> `Boundaries`  [INFERRED]
  graphify-out/memory/query_20260820_004241_cohesion_outliers__which_communities_are_junk_clus.md → Sources/Common/cmdArgs/impl/FocusCmdArgs.swift
- `Duplicate Boundaries Enum` --references--> `Boundaries`  [INFERRED]
  graphify-out/memory/query_20260820_004241_cohesion_outliers__which_communities_are_junk_clus.md → Sources/Common/cmdArgs/impl/MoveCmdArgs.swift

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Bundled Dependencies with Permissive Licenses** — legal_readme_bundled_dependencies, legal_readme_hotkey, legal_readme_tomldecoder, legal_readme_swift_collections, legal_readme_issoundadditions [EXTRACTED 1.00]
- **AeroSpace Window Tree Hierarchy** — docs_assets_tree_horizontal_tiles_root_node, docs_assets_tree_vertical_tiles_container, docs_assets_tree_sublime_text_window, docs_assets_tree_google_chrome_window, docs_assets_tree_finder_window, docs_assets_tree_terminal_active_window [EXTRACTED 1.00]
- **2026-08-20 Errata Re-Verification Pass (d42555f6 to be847df0)** — graphify_out_memory_query_20260820_001433_are_the_220_inferred_relationships_involving_parse_raw_call_site_count, graphify_out_memory_query_20260820_001433_are_the_281_inferred_relationships_involving_asser_assertequals_edge_correctness, graphify_out_memory_query_20260820_001433_why_does_common_connect_command_framework_imports_common_shared_target, graphify_out_memory_query_20260820_004241_refresh_session_invariant__do_all_tree_mutations_r_runlightsession_call_site_count, graphify_out_memory_query_20260820_004241_group_structures__hyperedges__protocol_conformance_extension_scattering_pattern [EXTRACTED 1.00]
- **Fork Release Pipeline (tag push to tap PR and Pages deploy)** — dev_docs_fork_maintenance_tag_naming, dev_docs_fork_maintenance_release_workflow, dev_docs_fork_maintenance_cutting_a_release, github_workflows_release_adrianlsy, github_workflows_pages, script_publish_release_adrianlsy, dev_docs_fork_maintenance_tap_repo, fork_homebrew_tap_cask [EXTRACTED 1.00]
- **Good Diagonal Monitor Arrangement Example** — docs_assets_monitor_arrangement_2_good_good_left_corner, docs_assets_monitor_arrangement_2_good_good_right_corner [EXTRACTED 1.00]
- **Three Monitors Arranged with Free Bottom Corners** — docs_assets_monitor_arrangement_1_good_monitor_1, docs_assets_monitor_arrangement_1_good_monitor_2, docs_assets_monitor_arrangement_1_good_monitor_3, docs_assets_monitor_arrangement_1_good_good_left_corner, docs_assets_monitor_arrangement_1_good_good_right_corner [EXTRACTED 1.00]
- **Horizontal Tiles Window Tree Example** — docs_assets_h_tiles_finder_window, docs_assets_h_tiles_terminal_window [EXTRACTED 1.00]
- **Stacked Monitors with Corner Placement Annotations** — docs_assets_monitor_arrangement_2_bad_monitor_1, docs_assets_monitor_arrangement_2_bad_monitor_2, docs_assets_monitor_arrangement_2_bad_bad_left_corner, docs_assets_monitor_arrangement_2_bad_bad_right_corner, docs_assets_monitor_arrangement_2_bad_good_right_corner [EXTRACTED 1.00]
- **Rebase Conflict Resolution Flow** — dev_docs_fork_maintenance_rebase_protocol, dev_docs_fork_maintenance_expected_conflict_set, dev_docs_fork_maintenance_generated_files_rule, dev_docs_fork_maintenance_fork_owned_files, dev_docs_fork_maintenance_deletions_to_reverify, dev_docs_fork_maintenance_upstream_shaped_files, dev_docs_fork_maintenance_post_rebase_checks, test [EXTRACTED 1.00]
- **Store-Aware OpenSpec CLI Workflows** — _claude_commands_opsx_apply_workflow, _claude_commands_opsx_archive_workflow, _claude_commands_opsx_explore_workflow, _claude_commands_opsx_propose_workflow, _claude_commands_opsx_sync_workflow, _claude_commands_opsx_update_workflow, _claude_skills_openspec_apply_change_skill_workflow, _claude_skills_openspec_archive_change_skill_workflow, _claude_skills_openspec_explore_skill_workflow, _claude_skills_openspec_propose_skill_workflow, _claude_skills_openspec_sync_specs_skill_workflow, _claude_skills_openspec_update_change_skill_workflow, _claude_commands_opsx_apply_openspec_cli, _claude_commands_opsx_apply_store_selection [EXTRACTED 1.00]
- **Traffic-Light Colored Circles with Window-Operation Glyphs on a Squircle** — resources_assets_xcassets_appicon_appiconset_icon_app_icon, resources_assets_xcassets_appicon_appiconset_icon_window_management_semantics, resources_assets_xcassets_appicon_appiconset_icon_macos_squircle_convention [INFERRED 0.75]
- **Horizontal Accordion Layout Demonstration** — docs_assets_h_accordion_screenshot, docs_assets_h_accordion_horizontal_accordion_layout, docs_assets_h_accordion_accordion_padding, docs_assets_h_accordion_focused_window_centering [INFERRED 0.75]
- **macOS Window Controls Visual Metaphor** — docs_assets_icon_aerospace_app_icon, docs_assets_icon_macos_traffic_light_motif, docs_assets_icon_window_management_symbolism [INFERRED 0.75]
- **Monitor 2 Blocked Bottom Corners (bad arrangement scenario)** — docs_assets_monitor_arrangement_1_bad_monitor_1, docs_assets_monitor_arrangement_1_bad_monitor_2, docs_assets_monitor_arrangement_1_bad_monitor_3, docs_assets_monitor_arrangement_1_bad_bad_left_corner, docs_assets_monitor_arrangement_1_bad_bad_right_corner [INFERRED 0.75]
- **Vertical Accordion Layout Demonstration** — docs_assets_v_accordion_screenshot, docs_assets_v_accordion_vertical_accordion_layout, docs_assets_v_accordion_accordion_padding, docs_assets_v_accordion_focused_window_prominence [INFERRED 0.75]
- **AX Thread-Safety and Session Reconciliation Chain** — graphify_out_memory_query_20260820_061048_how_does_the_ax_threading_backbone_work__macapp_ax_threading_backbone, graphify_out_memory_query_20260820_061048_how_does_the_ax_threading_backbone_work__macapp_task_local_token_guard_weakness, graphify_out_memory_query_20260820_061048_how_does_the_ax_threading_backbone_work__macapp_cancel_and_replace_coalescing, graphify_out_memory_query_20260820_061048_how_does_the_ax_threading_backbone_work__macapp_end_to_end_move_left_path [INFERRED 0.85]
- **Placements Illustrating the Free Bottom Corner Rule** — docs_assets_monitor_arrangement_2_bad_free_bottom_corner_requirement, docs_assets_monitor_arrangement_2_bad_bad_left_corner, docs_assets_monitor_arrangement_2_bad_bad_right_corner, docs_assets_monitor_arrangement_2_bad_good_right_corner [INFERRED 0.85]
- **Graph Extraction Artifacts and Tool Bugs** — graphify_out_memory_query_20260820_001433_what_connects_the_631_weakly_connected_nodes__gh_a_entity_resolution_failure, graphify_out_memory_query_20260820_004241_cohesion_outliers__which_communities_are_junk_clus_junk_clusters [INFERRED 0.85]
- **parseCommand Shared Fan-In (CLI, Server, Config, Tests)** — graphify_out_memory_query_20260820_001433_why_does_common_connect_command_framework_imports_shared_parser_constraint, graphify_out_memory_query_20260820_001433_why_does_common_connect_command_framework_imports_common_shared_target, graphify_out_memory_query_20260820_004241_subsystem_coupling_map__how_do_aerospace_subsystem_config_cli_grammar_dependency, graphify_out_memory_query_20260820_001433_are_the_220_inferred_relationships_involving_parse_parsecommand_node_disambiguation, graphify_out_memory_query_20260820_004241_three_four_place_command_pipeline_consistency__are_bnf_grammar_flag_rot [INFERRED 0.85]
- **Fork's Shell-Completion Correctness Fix Set** — fork_completion_nonexistent_flag, fork_completion_missing_flags, fork_completion_invalid_combinations, fork_completion_missing_separator, fork_completion_forbidden_flags, grammar_commands_bnf_grammar, build_shell_completion [INFERRED 0.85]
- **Four-Place Command Definition Workflow** — graphify_out_memory_query_20260820_004241_three_four_place_command_pipeline_consistency__are_command_pipeline_consistency, graphify_out_memory_query_20260820_004241_three_four_place_command_pipeline_consistency__are_bnf_grammar_flag_rot, graphify_out_memory_query_20260820_004241_three_four_place_command_pipeline_consistency__are_exec_and_forget_exemption, graphify_out_memory_query_20260820_004241_group_structures__hyperedges__protocol_conformance_cmdargs_conformance_table, graphify_out_memory_query_20260820_004241_group_structures__hyperedges__protocol_conformance_command_conformance_table, graphify_out_memory_query_20260820_004241_three_four_place_command_pipeline_consistency__are_completion_grammar_drift_guard [INFERRED 0.95]
- **Fork Issue Routing System** — _github_issue_template_config_contact_links, _github_issue_template_fork_bug_template, _github_issue_template_fork_feature_template, _github_issue_template_upstream_redirect_template, _github_issue_template_config_upstream_redirect_policy, _github_issue_template_config_upstream_aerospace_repo [INFERRED 0.95]
- **Fork Release Pipeline (tag to Homebrew tap)** — _github_workflows_release_adrianlsy_release, _github_workflows_release_adrianlsy_fork_tag_format, github_workflows_build_release_script, script_build_brew_cask_script, _github_workflows_release_adrianlsy_aerospace_adrianlsy_cask, _github_workflows_release_adrianlsy_homebrew_tap_repo [EXTRACTED 1.00]
- **Adding a CLI Command (all places that must change)** — claude_command_pipeline, dev_docs_architecture_command_checklist, grammar_commands_bnf_grammar [EXTRACTED 1.00]

## Communities (186 total, 22 thin omitted)

### Community 0 - "Command Test Fixtures"
Cohesion (internal edge density over full membership; size-biased): 0.05
Nodes (109 total, 9 shown after stub filtering): FocusCommandTest, LayoutCommandTest, ListWindowsTest, ListWorkspacesTest, MoveCommandTest, ResizeCommandTest, SplitCommandTest, SwapCommandTest (+1 more)

### Community 1 - "CmdArgs Protocol Core"
Cohesion (internal edge density over full membership; size-biased): 0.03
Nodes (95 total, 63 shown after stub filtering): Set, ArgParserProtocol, BalanceSizesCmdArgs, DebugWindowsCmdArgs, ExecAndForgetCmdArgs, FalseCmdArgs, FlattenWorkspaceTreeCmdArgs, FocusBackAndForthCmdArgs (+55 more)

### Community 10 - "Command Stdin Tests"
Cohesion (internal edge density over full membership; size-biased): 0.07
Nodes (49 total, 6 shown after stub filtering): CmdStdin, EvalCommandTest, WorkspaceCommandTest, ShellRunTest, assertTrue(), .emptyStdin

### Community 100 - "Recursive Layout Engine"
Cohesion (internal edge density over full membership; size-biased): 0.34
Nodes (14 total, 6 shown after stub filtering): LayoutContext, TilingContainer, Window, Workspace, CGFloat, CGPoint

### Community 101 - "Config Command Args"
Cohesion (internal edge density over full membership; size-biased): 0.16
Nodes (14 total, 13 shown after stub filtering): ConfigCmdArgs, Mode, parseConfigCmdArgs(), .mode, allKeys, configPath, getKey, majorKeys (+5 more)

### Community 102 - "Move Mouse Args"
Cohesion (internal edge density over full membership; size-biased): 0.19
Nodes (14 total, 12 shown after stub filtering): MouseTarget, MoveMouseCmdArgs, parseMouseTarget(), parseMoveMouseCmdArgs(), monitorForceCenter, monitorLazyCenter, windowForceCenter, windowLazyCenter (+4 more)

### Community 103 - "Command Pipeline & Rebase Docs"
Cohesion (internal edge density over full membership; size-biased): 0.17
Nodes (13 total, 11 shown after stub filtering): SubCommandParserProtocol, initSubcommands(), .declaredFlagKeys, Client/Server Interaction over Unix Socket, New Command Checklist, SPM Library + Xcode Launcher Infrastructure, Upstream Architecture Primer, Client/Server Split (CLI client, app server over Unix socket) (+3 more)

### Community 105 - "Volume HUD Panel"
Cohesion (internal edge density over full membership; size-biased): 0.18
Nodes (13 total, 10 shown after stub filtering): VolumePanel, VolumeView, Float, Color, ColorScheme, String, .barColor, .fontColor (+2 more)

### Community 106 - "CmdArgs Conformance Findings"
Cohesion (internal edge density over full membership; size-biased): 0.15
Nodes (13 total, 11 shown after stub filtering): Window, AppBundle Extensions Retrofit Server Powers onto CmdArgs, Subscribe Command Asymmetry, Command Pipeline Four-Place Consistency, exec-and-forget Grammar Exemption, CmdArgs Conformance Table (45 conformers), CmdArgs Node Fragmentation (patched; recurs after --force), Command Conformance Table (44 conformers) (+3 more)

### Community 107 - "Array Slice Utility"
Cohesion (internal edge density over full membership; size-biased): 0.31
Nodes (13 total, 8 shown after stub filtering): Range<Int>, .slice, PartialRangeFrom, PartialRangeUpTo, Bool, Int, Range, Self

### Community 108 - "Direction Enums"
Cohesion (internal edge density over full membership; size-biased): 0.18
Nodes (13 total, 10 shown after stub filtering): CardinalOrDfsDirection, DfsNextPrev, RawRepresentable, RawValue, .allCases, dfsRelative, direction, .rawValue (+2 more)

### Community 109 - "Layout Test DSL"
Cohesion (internal edge density over full membership; size-biased): 0.15
Nodes (13): LayoutDescription, floatingWindowsContainer, h_accordion, h_tiles, macosFullscreen, macosHiddeAppWindow, macosMinimized, macosPopupWindowsContainer (+5 more)

### Community 11 - "MacApp AX Threading"
Cohesion (internal edge density over full membership; size-biased): 0.10
Nodes (48 total, 21 shown after stub filtering): MacApp, CancellationMode, ThreadGuardedValue, T, .bundlePath, .execPath, .name, Bool (+13 more)

### Community 110 - "Run Callback Args"
Cohesion (internal edge density over full membership; size-biased): 0.19
Nodes (13 total, 11 shown after stub filtering): CallbackKind, RunCallbackCmdArgs, parseCallbackKind(), parseRunCallbackCmdArgs(), onFocusChanged, onFocusedMonitorChanged, onWindowDetected, Bool (+3 more)

### Community 111 - "Optional Extensions"
Cohesion (internal edge density over full membership; size-biased): 0.19
Nodes (13 total, 8 shown after stub filtering): Optional, .prettyDescription, F, Int, StaticString, String, T, Wrapped

### Community 112 - "Workspace To Monitor Args"
Cohesion (internal edge density over full membership; size-biased): 0.20
Nodes (12 total, 10 shown after stub filtering): MoveWorkspaceToMonitorCmdArgs, parseWorkspaceToMonitorCmdArgs(), Bool, Lateinit, CmdArgsCommonState, CmdParser, MonitorTarget, ParsedCmd (+2 more)

### Community 114 - "Shell Test DSL"
Cohesion (internal edge density over full membership; size-biased): 0.24
Nodes (12 total, 6 shown after stub filtering): Shell, ExpressibleByExtendedGraphemeClusterLiteral, ExpressibleByStringLiteral, ExpressibleByUnicodeScalarLiteral, Self, String

### Community 116 - "Shared Arg Enums"
Cohesion (internal edge density over full membership; size-biased): 0.18
Nodes (12 total, 11 shown after stub filtering): Dimension, Units, height, smart, smartOpposite, width, String, UInt (+3 more)

### Community 118 - "Tree Node Case Enums"
Cohesion (internal edge density over full membership; size-biased): 0.18
Nodes (11): ChildParentRelation, TilingContainer, floatingWindow, macosNativeFullscreenWindow, macosNativeHiddenAppWindow, macosNativeMinimizedWindow, macosPopupWindow, rootTilingContainer (+3 more)

### Community 119 - "Non-Leaf Node Kinds"
Cohesion (internal edge density over full membership; size-biased): 0.18
Nodes (11): NonLeafTreeNodeKind, LayoutReason, floatingWindowsContainer, macosFullscreenWindowsContainer, macosHiddenAppsWindowsContainer, macosMinimizedWindowsContainer, macosPopupWindowsContainer, tilingContainer (+3 more)

### Community 12 - "Arg Parser Framework"
Cohesion (internal edge density over full membership; size-biased): 0.08
Nodes (46 total, 40 shown after stub filtering): ArgParser, PosArgParserContext, EvalCmdArgs, MoveCmdArgs, WhenBoundariesCrossed, dashDashArg(), newMandatoryPosArgParser(), parseCardinalDirectionArg() (+32 more)

### Community 120 - "Secure Input HUD"
Cohesion (internal edge density over full membership; size-biased): 0.25
Nodes (11 total, 8 shown after stub filtering): SecureInputPanel, SecureInputView, .body, .fontColor, Bool, Color, ColorScheme, close

### Community 121 - "AX Element Attributes"
Cohesion (internal edge density over full membership; size-biased): 0.20
Nodes (11 total, 8 shown after stub filtering): AXUIElement, windowOrNil(), Any, Attr, AxUiElementMock, Bool, CGWindowID, WindowIdAndAxUiElementMock

### Community 122 - "AX Dump Fixtures"
Cohesion (internal edge density over full membership; size-biased): 0.20
Nodes (10 total, 8 shown after stub filtering): [String: Json], URL, AxUiElementMock, .isSynthetic, Attr, Bool, CGWindowID, .isDirectory

### Community 124 - "Appearance & SwiftUI Views"
Cohesion (internal edge density over full membership; size-biased): 0.20
Nodes (10 total, 6 shown after stub filtering): AppearanceTheme, Carbon, .current, dark, light, SwiftUI

### Community 125 - "Frozen Tree Snapshots"
Cohesion (internal edge density over full membership; size-biased): 0.38
Nodes (10 total, 8 shown after stub filtering): CGPoint, moveFloatingWindow(), moveTilingWindow(), moveWithMouse(), swapWindows(), Bool, TilingContainer, Window

### Community 127 - "Array Extensions"
Cohesion (internal edge density over full membership; size-biased): 0.22
Nodes (10 total, 5 shown after stub filtering): Array, Bool, Int, Self, T

### Community 13 - "Shell Parser Tests"
Cohesion (internal edge density over full membership; size-biased): 0.08
Nodes (45 total, 5 shown after stub filtering): ShellLexerTest, ShellParserTest, assertFail(), assertSucc(), F

### Community 130 - "Debug Windows Recording"
Cohesion (internal edge density over full membership; size-biased): 0.28
Nodes (9 total, 8 shown after stub filtering): DebugWindowsState, debugWindowsIfRecording(), dumpWindowDebugInfo(), notRecording, recording, recordingAborted, String, Window

### Community 131 - "Move Workspace Tests"
Cohesion (internal edge density over full membership; size-biased): 0.28
Nodes (9 total, 4 shown after stub filtering): MoveWorkspaceToMonitorCommandTest, parseMoveWorkspaceToMonitorTarget(), MonitorTarget, String

### Community 132 - "Subscribe Args Tests"
Cohesion (internal edge density over full membership; size-biased): 0.36
Nodes (9 total, 3 shown after stub filtering): SubscribeCmdArgsTest, parseSubscribeCmdArgs(), ParsedCmd

### Community 133 - "String Logical Segments"
Cohesion (internal edge density over full membership; size-biased): 0.25
Nodes (9 total, 7 shown after stub filtering): String, StringLogicalSegment, StringLogicalSegments, number, string, Int, String

### Community 135 - "Collection Extensions"
Cohesion (internal edge density over full membership; size-biased): 0.32
Nodes (8 total, 4 shown after stub filtering): Collection, Index, Element, Int

### Community 136 - "Move Node Commands"
Cohesion (internal edge density over full membership; size-biased): 0.29
Nodes (8 total, 7 shown after stub filtering): MoveNodeToWorkspaceCommand, moveWindowToWorkspace(), MoveNodeToWorkspaceCmdArgs, Bool, Int, Window, Workspace

### Community 137 - "Sequence Patterns"
Cohesion (internal edge density over full membership; size-biased): 0.25
Nodes (8 total, 7 shown after stub filtering): SequencePattern, OrderedCollections, Seq, empty, many, one, two

### Community 138 - "Server Enablement Checks"
Cohesion (internal edge density over full membership; size-biased): 0.21
Nodes (8 total, 6 shown after stub filtering): NSApplication.ActivationPolicy, Int, StaticString, String, NSApplication, String

### Community 139 - "List Modes Args"
Cohesion (internal edge density over full membership; size-biased): 0.32
Nodes (8 total, 6 shown after stub filtering): ListModesCmdArgs, parseListModesCmdArgs(), Bool, ParsedCmd, Self, StrArrSlice

### Community 14 - "Shell Execution & IO"
Cohesion (internal edge density over full membership; size-biased): 0.07
Nodes (44 total, 29 shown after stub filtering): CmdIoForwardingStdin, CmdIoImpl, CmdResult, Shell, Int32ExitCode, runShellAnd(), runShellOr(), runShellPipe() (+21 more)

### Community 140 - "Split Command Args"
Cohesion (internal edge density over full membership; size-biased): 0.36
Nodes (8 total, 6 shown after stub filtering): SplitCmdArgs, parseSplitArg(), parseSplitCmdArgs(), ParsedCmd, Self, StrArrSlice

### Community 141 - "Swap Command Args"
Cohesion (internal edge density over full membership; size-biased): 0.32
Nodes (8 total, 6 shown after stub filtering): SwapCmdArgs, parseSwapCmdArgs(), Bool, ParsedCmd, Self, StrArrSlice

### Community 142 - "Subcommand Parser Registry"
Cohesion (internal edge density over full membership; size-biased): 0.36
Nodes (8 total, 5 shown after stub filtering): SubCommandParser, SubCommandParserProtocol, ParsedCmd, StrArrSlice, T

### Community 143 - "Nullable Wrapper"
Cohesion (internal edge density over full membership; size-biased): 0.25
Nodes (8 total, 7 shown after stub filtering): Nullable, .isNull, just, null, .valueOrNil, Bool, T

### Community 144 - "Config File Watcher"
Cohesion (internal edge density over full membership; size-biased): 0.29
Nodes (7 total, 5 shown after stub filtering): ConfigFileWatcher, DispatchSourceFileSystemObject, Int32, MainActor, URL

### Community 146 - "Lazy Sequence Filters"
Cohesion (internal edge density over full membership; size-biased): 0.29
Nodes (7 total, 5 shown after stub filtering): LazySequenceProtocol, LazyFilterSequence, LazyMapSequence, Self, Unwrapped

### Community 147 - "Exec Env Config"
Cohesion (internal edge density over full membership; size-biased): 0.57
Nodes (7 total, 5 shown after stub filtering): ExecConfig, RawExecConfig, parseEnvVariables(), parseExecConfig(), String

### Community 148 - "App Entry Point"
Cohesion (internal edge density over full membership; size-biased): 0.33
Nodes (6 total, 5 shown after stub filtering): AeroSpaceApp, App, OpenWindowAction, .body, Scene

### Community 149 - "Completable Future"
Cohesion (internal edge density over full membership; size-biased): 0.47
Nodes (6 total, 3 shown after stub filtering): CompletableFuture, Dispatch, T

### Community 15 - "Command Kind Registry"
Cohesion (internal edge density over full membership; size-biased): 0.05
Nodes (44): CmdKind, CaseIterable, balanceSizes, closeAllWindowsButCurrent, config, debugWindows, echo, enable (+36 more)

### Community 151 - "JSON Encoder Defaults"
Cohesion (internal edge density over full membership; size-biased): 0.33
Nodes (6 total, 4 shown after stub filtering): JSONEncoder, .aeroSpaceDefault, Encodable, String

### Community 152 - "MainActor Isolation Checks"
Cohesion (internal edge density over full membership; size-biased): 0.33
Nodes (6 total, 4 shown after stub filtering): MainActor, StaticString, T, UInt

### Community 16 - "Refresh Session Engine"
Cohesion (internal edge density over full membership; size-biased): 0.07
Nodes (44 total, 38 shown after stub filtering): GlobalObserver, OptimalHideCorner, RunSessionGuard, updateFocusCache(), getNativeFocusedWindow(), layoutWorkspaces(), normalizeContainers(), refresh() (+30 more)

### Community 162 - "AX Element Mock"
Cohesion (internal edge density over full membership; size-biased): 0.50
Nodes (4 total, 3 shown after stub filtering): AxUiElementMock, .cast, AXUIElement

### Community 163 - "Activation Policy Helper"
Cohesion (internal edge density over full membership; size-biased): 0.50
Nodes (4 total, 3 shown after stub filtering): NSApplication.ActivationPolicy, .prettyDescription, String

### Community 17 - "Tree Node Containers"
Cohesion (internal edge density over full membership; size-biased): 0.07
Nodes (44 total, 36 shown after stub filtering): FloatingWindowsContainer, MacosFullscreenWindowsContainer, MacosHiddenAppsWindowsContainer, MacosMinimizedWindowsContainer, MacosPopupWindowsContainer, NonLeafTreeNodeCases, Window, WindowParentCases (+28 more)

### Community 19 - "Cardinal Direction Moves"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (43 total, 37 shown after stub filtering): FloatingWindowData, FocusCommand, MoveCommand, CardinalDirection, hitAllMonitorsOuterFrameBoundaries(), hitWorkspaceBoundaries(), makeFloatingWindowsSeenAsTiling(), restoreFloatingWindows() (+29 more)

### Community 2 - "Tray Menu & Status UI"
Cohesion (internal edge density over full membership; size-biased): 0.05
Nodes (68 total, 54 shown after stub filtering): ExperimentalUISettings, MenuBarStyle, MenuBarStyleButton, MenuBarLabel, String, Message, MessageModel, MessageType (+46 more)

### Community 20 - "TreeNode Base Class"
Cohesion (internal edge density over full membership; size-biased): 0.06
Nodes (43 total, 35 shown after stub filtering): NilTreeNode, TreeNode, TreeNodeUserDataKey, resizeWithMouse(), CGFloat, Window, Any, Bool (+27 more)

### Community 21 - "Config Parsing & Diagnostics"
Cohesion (internal edge density over full membership; size-biased): 0.14
Nodes (41 total, 33 shown after stub filtering): ConfigBacktrace, OrderedJson.JsonDict, ParsedCmd, Parser, ParserProtocol, ResOrStr, expectedActualTypeError(), expectedActualTypeDiagnostic() (+25 more)

### Community 22 - "Format Variable Expansion"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (41 total, 32 shown after stub filtering): AeroObj, Cell, InterVarExpansionError, WindowWithPrefetchedTitle, InterVar, toLayoutResult(), toLayoutString(), unknownInterpolationVariable() (+24 more)

### Community 23 - "Test Assertion Helpers"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (41 total, 19 shown after stub filtering): ModeCommandTest, MoveNodeToMonitorCommandTest, TriggerBindingCommandTest, WorkspaceCmdArgs, assertNil(), assertNotEquals(), assertNotNil(), failExpectedActual() (+11 more)

### Community 24 - "Focus State Management"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (39 total, 30 shown after stub filtering): EffectiveLeaf, FrozenFocus, LiveFocus, Window, Workspace, getNextPrevWorkspace(), checkOnFocusChangedCallbacks_nonCancellable(), onFocusChanged() (+22 more)

### Community 25 - "Boolean Flag Parsers"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (39 total, 32 shown after stub filtering): CloseAllWindowsButCurrentCmdArgs, CloseCmdArgs, MoveNodeToWorkspaceCmdArgs, parseMoveNodeToWorkspaceCmdArgs(), boolFlag(), constSubArgParserFun(), falseBoolFlag(), singleValueSubArgParser() (+24 more)

### Community 26 - "Format Interpolation Vars"
Cohesion (internal edge density over full membership; size-biased): 0.06
Nodes (39 total, 37 shown after stub filtering): AppFormatVar, Kind, MonitorFormatVar, PlainInterVar, WindowFormatVar, WorkspaceFormatVar, SplitArg, CaseIterable (+29 more)

### Community 27 - "CLI Entry Point"
Cohesion (internal edge density over full membership; size-biased): 0.08
Nodes (37 total, 27 shown after stub filtering): Main, Bool, Int, MainActor, [String], URL, hasStdin(), run() (+19 more)

### Community 28 - "MacWindow Lifecycle"
Cohesion (internal edge density over full membership; size-biased): 0.11
Nodes (37 total, 16 shown after stub filtering): MacWindow, Window, tryOnWindowDetected(), unbindAndGetBindingDataForNewTilingWindow(), unbindAndGetBindingDataForNewWindow(), .allWindows, .isHiddenInCorner, Bool (+8 more)

### Community 29 - "Format Command Tests"
Cohesion (internal edge density over full membership; size-biased): 0.11
Nodes (37 total, 11 shown after stub filtering): FormatTest, FormatVar, assertPrimitive(), StaticString, UInt, app, .kind, monitor (+3 more)

### Community 3 - "Config Parsing Tests"
Cohesion (internal edge density over full membership; size-biased): 0.07
Nodes (68 total, 7 shown after stub filtering): ConfigCommandTest, ConfigTest, ParseEnvVariablesTest, parseConfig(), assertEquals(), assertFalse(), Bool

### Community 30 - "Specific Arg Parsing"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (36 total, 29 shown after stub filtering): ArgParserInput, PosArgParserInput, String, SubArgParserInput, ResizeCmdArgs, parseDimension(), parseResizeCmdArgs(), parseUnits() (+21 more)

### Community 31 - "Broadcast Latch Async"
Cohesion (internal edge density over full membership; size-biased): 0.14
Nodes (35 total, 17 shown after stub filtering): AwaitableOneTimeBroadcastLatch, UniqueToken, AwaitableOneTimeBroadcastLatchTest, Task, syncConfigFileWatcher(), CheckedContinuation, isolated, Error (+9 more)

### Community 32 - "AX Run Loop & Frames"
Cohesion (internal edge density over full membership; size-biased): 0.12
Nodes (35 total, 21 shown after stub filtering): RunLoopAction, RunLoopJob, Thread, AxWindow, [UInt32: AxWindow], NSRunningApplication, disableAnimations(), getAxRect() (+13 more)

### Community 33 - "AeroAny & App Abstraction"
Cohesion (internal edge density over full membership; size-biased): 0.08
Nodes (34 total, 24 shown after stub filtering): AbstractApp, Window, TestApp, AeroAny, Array, AXUIElement, CGFloat, CGPoint (+16 more)

### Community 34 - "Window Layout Primitives"
Cohesion (internal edge density over full membership; size-biased): 0.10
Nodes (34 total, 21 shown after stub filtering): Window, check(), die(), dieT(), getStringStacktrace(), .run, .cases, .nodeCases (+13 more)

### Community 35 - "Workspace Command Args"
Cohesion (internal edge density over full membership; size-biased): 0.08
Nodes (34 total, 26 shown after stub filtering): WorkspaceFilter, SummonWorkspaceCmdArgs, WorkspaceCmdArgs, WorkspaceTarget, WorkspaceName, parseWorkspaces(), parseWorkspaceName(), parseWorkspaceCmdArgs() (+18 more)

### Community 36 - "Config Value Parsers"
Cohesion (internal edge density over full membership; size-biased): 0.06
Nodes (33 total, 31 shown after stub filtering): OrderedJson, TomlType, tomlAnyToOrderedJsonRecursive(), Any, array, .asArrayOrNil, .asBoolOrNil, .asDictOrNil (+23 more)

### Community 37 - "Frozen Tree Types"
Cohesion (internal edge density over full membership; size-biased): 0.11
Nodes (31 total, 25 shown after stub filtering): FrozenMonitor, FrozenWorkspace, FrozenContainer, FrozenTreeNode, FrozenWindow, FrozenWorld, cacheClosedWindowIfNeeded(), resetClosedWindowsCache() (+17 more)

### Community 38 - "Interpolated Arg Consumption"
Cohesion (internal edge density over full membership; size-biased): 0.07
Nodes (31 total, 24 shown after stub filtering): EchoCmdArgs, ModeCmdArgs, TriggerBindingCmdArgs, Lateinit, consumeWholeArrayOfInterpolatedPosArgs(), consumeStrCliArg(), parseTriggerBindingCmdArgs(), Bool (+16 more)

### Community 39 - "Monitor Description Parsing"
Cohesion (internal edge density over full membership; size-biased): 0.10
Nodes (30 total, 21 shown after stub filtering): MonitorDescription, Regex, CaseInsensitiveRegex, String, parseCasInsensitiveRegex(), parseMonitorDescription(), parseMonitorDescriptions(), parseWorkspaceToMonitorAssignment() (+13 more)

### Community 4 - "Test Harness Setup"
Cohesion (internal edge density over full membership; size-biased): 0.04
Nodes (64 total, 18 shown after stub filtering): BalanceSizesCommandTest, CloseCommandTest, ExecCommandTest, FalseCommandTest, FlattenWorkspaceTreeCommandTest, FocusMonitorCommandTest, JoinWithCommandTest, ListAppsTest (+10 more)

### Community 40 - "Key Mapping & Presets"
Cohesion (internal edge density over full membership; size-biased): 0.10
Nodes (30 total, 25 shown after stub filtering): NSEvent.ModifierFlags, KeyMapping, Preset, ExperimentalUISettingsItems, Boundaries, Boundaries, getKeysPreset(), isValidKeyNotation() (+17 more)

### Community 41 - "JSON Model"
Cohesion (internal edge density over full membership; size-biased): 0.08
Nodes (30 total, 23 shown after stub filtering): Json, AxWindowKindTest, int, checkAxDumpsRecursive(), array, .asDictOrDie, .asDictOrNil, .asInt64OrNil (+15 more)

### Community 42 - "Monitor Target Args"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (30 total, 25 shown after stub filtering): FocusMonitorCmdArgs, MonitorTarget, MoveNodeToMonitorCmdArgs, NextPrev, parseFocusMonitorCmdArgs(), parseMonitorTarget(), parseMoveNodeToMonitorCmdArgs(), .cases (+17 more)

### Community 43 - "Unix Socket Connection"
Cohesion (internal edge density over full membership; size-biased): 0.15
Nodes (29 total, 18 shown after stub filtering): Subscriber, InitConnectionError, IsDone, NWConnection, newConnection(), startUnixSocketServer(), toggleReleaseServerIfDebug(), handleSubscribeAndWaitTillError() (+10 more)

### Community 44 - "Per-Monitor Gaps Config"
Cohesion (internal edge density over full membership; size-biased): 0.16
Nodes (28 total, 21 shown after stub filtering): DynamicConfigValue, PerMonitorValue, ConfigParserContext, Gaps, Inner, Outer, ResolvedGaps, parseDynamicValue() (+13 more)

### Community 45 - "Focus Direction Args"
Cohesion (internal edge density over full membership; size-biased): 0.10
Nodes (27 total, 25 shown after stub filtering): FocusCmdArgs, FocusCmdTarget, WhenBoundariesCrossed, parseBoundaries(), parseBoundariesAction(), parseFocusCmdArgs(), .boundaries, .boundariesAction (+17 more)

### Community 48 - "Client-Server Protocol"
Cohesion (internal edge density over full membership; size-biased): 0.13
Nodes (26 total, 14 shown after stub filtering): ClientServerTest, ClientRequest, ClientRequestData, CodingKeys, ServerAnswer, CodingKey, Decoder, stdin (+6 more)

### Community 49 - "Layout Command Args"
Cohesion (internal edge density over full membership; size-biased): 0.10
Nodes (26 total, 22 shown after stub filtering): LayoutCmdArgs, LayoutDescription, String, parseLayoutCmdArgs(), parseToggleBetween(), Bool, accordion, floating (+14 more)

### Community 5 - "Shell Lexer & Parser"
Cohesion (internal edge density over full membership; size-biased): 0.07
Nodes (63 total, 48 shown after stub filtering): Char, Character, LexerToken, Location, Payload, State, String, WordKind (+40 more)

### Community 50 - "Tree Node Parent Cases"
Cohesion (internal edge density over full membership; size-biased): 0.08
Nodes (26 total, 24 shown after stub filtering): ConventionalWindowParentCases, TilingContainerParentCases, TilingTreeNodeCases, TreeNodeCases, floatingWindowsContainer, .floatingWindowsContainerOrNil, tilingContainer, .tilingContainerOrNil (+16 more)

### Community 51 - "Config Parse Diagnostics"
Cohesion (internal edge density over full membership; size-biased): 0.12
Nodes (26 total, 22 shown after stub filtering): ConfigParseDiagnostic, ParseConfigResult, ReadConfigResult, Severity, TomlBacktraceItem, readConfig(), .description, .isRootKey (+14 more)

### Community 53 - "String Interpolation Tokens"
Cohesion (internal edge density over full membership; size-biased): 0.11
Nodes (25 total, 18 shown after stub filtering): Array, InterpolationParserState, InterToken, String, Error, LocalizedError, RawStringInterToken, interpolationCharEncountered (+10 more)

### Community 55 - "Hotkey Binding Config"
Cohesion (internal edge density over full membership; size-biased): 0.16
Nodes (25 total, 19 shown after stub filtering): HotkeyBinding, Key, Mode, Dictionary, parseBinding(), parseBindings(), parseMode(), parseModes() (+11 more)

### Community 56 - "Move Node Tests"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (25 total, 8 shown after stub filtering): MoveNodeToWorkspaceCommandTest, MoveNodeToWorkspaceCmdArgs, ParsedCmd, .cmdOrDie, .errorOrNil, Bool, String, T

### Community 57 - "Test Command Args"
Cohesion (internal edge density over full membership; size-biased): 0.14
Nodes (25 total, 17 shown after stub filtering): InfixOperator, TestCmdArgs, ParsedCliArgs, parseTestCmdArgs(), parseTestInfixOperator(), parseTestLhs(), parseTestRhs(), equals (+9 more)

### Community 58 - "Common Utility Extensions"
Cohesion (internal edge density over full membership; size-biased): 0.15
Nodes (25 total, 11 shown after stub filtering): Comparable, Sequence, .withIndex, Double, E, Int, ParsedCmd, R (+3 more)

### Community 6 - "Command Execution Core"
Cohesion (internal edge density over full membership; size-biased): 0.12
Nodes (58 total, 13 shown after stub filtering): CmdEnv, CmdIo, MoveMouseCommand, BinaryExitCode, changeTilingLayout(), moveMouse(), windowSubjectRectOrReportError(), activateMode_nonCancellable() (+5 more)

### Community 60 - "Config Command Values"
Cohesion (internal edge density over full membership; size-biased): 0.13
Nodes (24 total, 18 shown after stub filtering): ConfigMapValue, ConfigScalarValue, Shell<any Command>, String, buildConfigMap(), getKey(), <mode_id> / <binding> nonterminals (shell out to config --get mode), Encodable (+10 more)

### Community 61 - "Result Extensions"
Cohesion (internal edge density over full membership; size-biased): 0.12
Nodes (24 total, 15 shown after stub filtering): [AeroObj], Result, showMessageInGui(), Bool, String, .failureOrNil, .isSuccess, Bool (+7 more)

### Community 62 - "Rect Geometry"
Cohesion (internal edge density over full membership; size-biased): 0.12
Nodes (24 total, 18 shown after stub filtering): CGRect, Rect, .bottomLeftCorner, .bottomRightCorner, .center, .height, .maxX, .maxY (+10 more)

### Community 63 - "Test & Test-Not Commands"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (24 total, 8 shown after stub filtering): TestCommandTest, TestNotCmdArgs, parseTestNotCmdArgs(), CmdArgsCommonState, CmdParser, ParsedCmd, Self, StrArrSlice

### Community 65 - "Config Root Model"
Cohesion (internal edge density over full membership; size-biased): 0.11
Nodes (23 total, 21 shown after stub filtering): Config, ConfigVersion, DefaultContainerOrientation, FocusFollowsMouse, getDefaultConfigUrlFromProject(), parseFocusFollowsMouse(), Mode, _1 (+13 more)

### Community 66 - "Grammar Test Parser"
Cohesion (internal edge density over full membership; size-biased): 0.20
Nodes (23 total, 10 shown after stub filtering): CompletionGrammarTest, Failure, Grammar, Sequence, Set, .url, String, StaticString (+2 more)

### Community 67 - "Format Primitives"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (23 total, 14 shown after stub filtering): Kind, Primitive, int, bool, int, string, bool, .kind (+6 more)

### Community 68 - "Exit Code Commands"
Cohesion (internal edge density over full membership; size-biased): 0.10
Nodes (23 total, 15 shown after stub filtering): FalseCommand, TrueCommand, ConditionalExitCode, ExitCode, IoSideEffect, succ, Bool, Bool (+7 more)

### Community 69 - "Tree Node Binding"
Cohesion (internal edge density over full membership; size-biased): 0.17
Nodes (23 total, 13 shown after stub filtering): BindingData, NonLeafTreeNodeObject, getChildParentRelation(), getChildParentRelationOrNil(), illegalChildParentRelation(), CGFloat, Int, .kind (+5 more)

### Community 7 - "Known Bundle IDs"
Cohesion (internal edge density over full membership; size-biased): 0.04
Nodes (55 total, 48 shown after stub filtering): AxUiElementMock, AxUiElementWindowType, KnownBundleId, dialog, popup, window, Bool, NSApplication (+40 more)

### Community 70 - "Workspace Model"
Cohesion (internal edge density over full membership; size-biased): 0.15
Nodes (23 total, 16 shown after stub filtering): CGPoint, Workspace, gcMonitors(), getStubWorkspace(), isValidAssignment(), rearrangeWorkspacesOnMonitors(), .activeWorkspace, Bool (+8 more)

### Community 71 - "Cross-File Import Hub"
Cohesion (internal edge density over full membership; size-biased): 0.10
Nodes (22 total, 10 shown after stub filtering): HotKey, Bool, balance(), Foundation, TilingContainer, .isEnabled, Bool, Cancel-and-Replace Coalescing (+2 more)

### Community 72 - "Window Detected Callbacks"
Cohesion (internal edge density over full membership; size-biased): 0.13
Nodes (22 total, 19 shown after stub filtering): LegacyWindowDetectedCallbackMatcher, WindowDetectedCallback, WindowDetectedCallbackMatcher, ConvenienceMutable, parseMatcher(), parseOnWindowDetectedArray(), parseWindowDetectedCallback(), upcast() (+11 more)

### Community 73 - "Tiling Container Nodes"
Cohesion (internal edge density over full membership; size-biased): 0.13
Nodes (21 total, 14 shown after stub filtering): Layout, String, TilingContainer, Orientation, accordion, tiles, Bool, CGFloat (+6 more)

### Community 74 - "Fullscreen Command Args"
Cohesion (internal edge density over full membership; size-biased): 0.12
Nodes (21 total, 17 shown after stub filtering): FullscreenCmdArgs, MacosNativeFullscreenCmdArgs, ToggleEnum, parseFullscreenCmdArgs(), parseMacosNativeFullscreenCmdArgs(), parseToggleEnum(), Bool, ParsedCmd (+9 more)

### Community 75 - "List Windows Args"
Cohesion (internal edge density over full membership; size-biased): 0.13
Nodes (21 total, 20 shown after stub filtering): AeroObjKind, FilteringOptions, ListWindowsCmdArgs, formatParser(), getAvailableInterVars(), parseListWindowsCmdArgs(), app, monitor (+12 more)

### Community 76 - "Server Event Types"
Cohesion (internal edge density over full membership; size-biased): 0.15
Nodes (20 total, 13 shown after stub filtering): ServerEvent, ServerEventType, Codable, .eventType, Int, String, UInt32, bindingTriggered (+5 more)

### Community 77 - "CGPoint Offset Helpers"
Cohesion (internal edge density over full membership; size-biased): 0.14
Nodes (20 total, 11 shown after stub filtering): CGFloat, CGPoint, .body, .monitorApproximation, .vectorLength, .withYAxisFlipped, CGFloat, ClosedRange (+3 more)

### Community 78 - "List Command Args"
Cohesion (internal edge density over full membership; size-biased): 0.13
Nodes (20 total, 16 shown after stub filtering): ListAppsCmdArgs, ListMonitorsCmdArgs, getErrorIfFormatIsIncompatibleWithJson(), parseListAppsCmdArgs(), parseListMonitorsCmdArgs(), .format, Bool, ParsedCmd (+8 more)

### Community 79 - "Command Parse Results"
Cohesion (internal edge density over full membership; size-biased): 0.18
Nodes (20 total, 14 shown after stub filtering): ParsedCmd, CmdParsingFailure, failure, cmd, .cmdOrNil, help, Bool, Int32 (+6 more)

### Community 80 - "AX Subscriptions & Threading"
Cohesion (internal edge density over full membership; size-biased): 0.16
Nodes (19 total, 12 shown after stub filtering): AXObserver, AxSubscription, AxAppThreadToken, AXObserverCallback, HandlerToNotifKeyMapping, pid_t, AXUIElement, Bool (+4 more)

### Community 81 - "Array Slice Collection"
Cohesion (internal edge density over full membership; size-biased): 0.17
Nodes (19 total, 12 shown after stub filtering): Array, ArrSlice, ArrSliceIterator, ExpressibleByArrayLiteral, RandomAccessCollection, .endIndex, .indices, .startIndex (+4 more)

### Community 82 - "App Termination Handling"
Cohesion (internal edge density over full membership; size-biased): 0.14
Nodes (19 total, 14 shown after stub filtering): AppServerTerminationHandler, String, TerminationHandler, bootstrapConfig_nonCancellable(), initAppBundle(), initServerArgs(), smartLayoutAtStartup(), checkCancellation() (+6 more)

### Community 83 - "Menu Bar Actions"
Cohesion (internal edge density over full membership; size-biased): 0.18
Nodes (19 total, 17 shown after stub filtering): ConfigFile, findCustomConfigUrl(), getTextEditorToOpenConfig(), menuBar(), openConfigButton(), reloadConfigButton(), shortcutGroup(), ambiguousConfigError (+9 more)

### Community 84 - "AX Accessibility Attributes"
Cohesion (internal edge density over full membership; size-biased): 0.18
Nodes (18 total, 17 shown after stub filtering): ServerArgs, Ax, ReadableAttr, ReadableAttrImpl, WritableAttr, WritableAttrImpl, castToAxUiElementMock(), resetAccessibility() (+9 more)

### Community 86 - "Layout Normalization"
Cohesion (internal edge density over full membership; size-biased): 0.16
Nodes (17 total, 13 shown after stub filtering): MacOsWindowLevel, exitMacOsNativeUnconventionalState(), normalizeLayoutReason(), validateStillPopups(), getWindowLevel(), CoreGraphics, Window, Workspace (+5 more)

### Community 87 - "Refresh Session Events"
Cohesion (internal edge density over full membership; size-biased): 0.12
Nodes (16): RefreshSessionEvent, CustomStringConvertible, ax, configAutoReload, .description, focusFollowsMouse, globalObserver, globalObserverLeftMouseUp (+8 more)

### Community 88 - "Monitor Info Impl"
Cohesion (internal edge density over full membership; size-biased): 0.20
Nodes (16 total, 14 shown after stub filtering): LazyMonitorInfo, MonitorInfoImpl, NSScreen, .rect, .visibleRect, .height, .width, .isMainScreen (+6 more)

### Community 89 - "Window Detected Tests"
Cohesion (internal edge density over full membership; size-biased): 0.14
Nodes (16 total, 6 shown after stub filtering): OnWindowDetectedTest, TestWindow, CGFloat, String, UInt32, .description

### Community 9 - "Command Dispatch & Shell"
Cohesion (internal edge density over full membership; size-biased): 0.07
Nodes (50 total, 47 shown after stub filtering): Command, BalanceSizesCommand, CloseAllWindowsButCurrentCommand, CloseCommand, ConfigCommand, DebugWindowsCommand, EchoCommand, EnableCommand (+39 more)

### Community 90 - "List Workspaces Args"
Cohesion (internal edge density over full membership; size-biased): 0.17
Nodes (16 total, 15 shown after stub filtering): FilteringOptions, ListWorkspacesCmdArgs, MonitorId, parseListWorkspacesCmdArgs(), parseMonitorIds(), .format, all, focused (+7 more)

### Community 91 - "Volume Command Args"
Cohesion (internal edge density over full membership; size-biased): 0.14
Nodes (16 total, 14 shown after stub filtering): VolumeAction, VolumeCmdArgs, parseVolumeAction(), Bool, Int, Self, StrArrSlice, String (+6 more)

### Community 94 - "Reload Config Command"
Cohesion (internal edge density over full membership; size-biased): 0.22
Nodes (15 total, 13 shown after stub filtering): ReloadConfigResult, failedToParseMsg(), parsedWithWarningsMsg(), reloadConfig_nonCancellable(), resetHotKeys(), isAxWindowUnderMouse(), syncFocusFollowsMouse(), Bool (+5 more)

### Community 95 - "AX Dump Recursive"
Cohesion (internal edge density over full membership; size-biased): 0.19
Nodes (15 total, 13 shown after stub filtering): AXError, AxKind, AXUIElement, dumpAxRecursive(), prettyValue(), .repr, app, button (+5 more)

### Community 96 - "Enable Command Args"
Cohesion (internal edge density over full membership; size-biased): 0.18
Nodes (15 total, 13 shown after stub filtering): EnableCmdArgs, State, parseEnableCmdArgs(), parseState(), off, on, toggle, Bool (+5 more)

### Community 98 - "MRU Stack"
Cohesion (internal edge density over full membership; size-biased): 0.30
Nodes (14 total, 7 shown after stub filtering): MruStack, MruStackIterator, Node, IteratorProtocol, .mostRecent, Bool, T

### Community 99 - "Relative Monitor Resolution"
Cohesion (internal edge density over full membership; size-biased): 0.16
Nodes (14 total, 7 shown after stub filtering): MonitorInfo, Bool, Int, String, .monitorId_oneBased, Int, CGFloat

### Community 115 - "Native Focus & Mouse Probes"
Cohesion (internal edge density over full membership; size-biased): 0.17
Nodes (12 total, 11 shown after stub filtering): isManipulatedWithMouse(), movedObs(), resizedObs(), Bool, Window, AXUIElement, CFString, UnsafeMutableRawPointer (+3 more)

### Community 145 - "AX Thread Guard Findings"
Cohesion (internal edge density over full membership; size-biased): 0.29
Nodes (7 total, 4 shown after stub filtering): destroy(), AX Threading Backbone (MacApp + RunLoopJob), Task.init Ban in Favor of Task.startUnstructured, Task-Local Token Guard Weakness

### Community 150 - "Collection Grouping Helpers"
Cohesion (internal edge density over full membership; size-biased): 0.33
Nodes (6 total, 3 shown after stub filtering): Group, Element, OrderedSet

### Community 154 - "Env Variable Tests"
Cohesion (internal edge density over full membership; size-biased): 0.60
Nodes (5 total, 3 shown after stub filtering): testFailInterpolation(), testSucInterpolation(), String

### Community 161 - "Start At Login"
Cohesion (internal edge density over full membership; size-biased): 0.67
Nodes (4 total, 3 shown after stub filtering): cleanupPlistFromPrevVersions(), syncStartAtLogin(), ServiceManagement

### Community 164 - "Range Extensions"
Cohesion (internal edge density over full membership; size-biased): 0.50
Nodes (4 total, 3 shown after stub filtering): ClosedRange, Range, Self

### Community 166 - "Window Tree Membership"
Cohesion (internal edge density over full membership; size-biased): 0.67
Nodes (3): windowIsntPartOfTree(), String, Window

### Community 93 - "Shared Parser Constraint"
Cohesion (internal edge density over full membership; size-biased): 0.13
Nodes (15 total, 13 shown after stub filtering): parseCommand(), Bool, ParsedCmd, Shell, String, Command Protocol Dual Fan-Out, CmdArgs Protocol Bridge, Common Shared SPM Library Target (+5 more)

### Community 117 - "Grammar & Rebase Protocol"
Cohesion (internal edge density over full membership; size-biased): 0.24
Nodes (11 total, 10 shown after stub filtering): complgen (external completion generator), build-shell-completion.sh script, grammar/commands-bnf-grammar.txt (hand-maintained CLI grammar), Hand-Written Shell Lexer/Parser (ANTLR grammar retired), Rebase, Don't Merge, Expected Conflict Set, Post-Rebase Checks (test.sh + docs + completion not covered by CI), Rebase Protocol (fetch, rebase, test, force-with-lease) (+2 more)

### Community 54 - "CLI Grammar Productions"
Cohesion (internal edge density over full membership; size-biased): 0.12
Nodes (25): echo production (--stderr / --window-id / -- <string>), eval production (--stdin / -- <aerospace_shell_expr>), <event> nonterminal (subscribe event names), <monitor_pattern> nonterminal (free-form, always completes), move-mouse production (--fail-if-noop only on lazy-center), move-node-to-monitor production (direction vs pattern flag sets), move-workspace-to-monitor production, <output_format> nonterminal (format string placeholder) (+17 more)

### Community 8 - "Command Module Imports"
Cohesion (internal edge density over full membership; size-biased): 0.07
Nodes (51 total, 5 shown after stub filtering): <app_bundle_id> / <pid> nonterminals (shell out to list-apps), <monitor_id> nonterminal (shells out to list-monitors), AppKit, Common, ISSoundAdditions

### Community 113 - "Code Generation Pipeline"
Cohesion (internal edge density over full membership; size-biased): 0.21
Nodes (12 total, 5 shown after stub filtering): generate.sh script, XCODEGEN_AEROSPACE_CODE_SIGN_IDENTITY, generate-cmd-help.sh script, Generated Code (must be committed, never hand-edited), Generated Files — Never Hand-Merge

### Community 123 - "Docs & Completion Build Scripts"
Cohesion (internal edge density over full membership; size-biased): 0.36
Nodes (10 total, 7 shown after stub filtering): build-man(), build-site(), cp-docs(), build-docs.sh script, create-marker(), lazy-download-zip-and-link-bin(), install-dep.sh script

### Community 46 - "Build & Dev Scripts"
Cohesion (internal edge density over full membership; size-biased): 0.14
Nodes (26 total, 17 shown after stub filtering): build-debug.sh script, format.sh script, lint.sh script, run-cli.sh script, run-debug.sh script, check-uncommitted-files.sh script, add-optional-dep-to-bin(), setup.sh script (+9 more)

### Community 52 - "CI Release Pipeline"
Cohesion (internal edge density over full membership; size-biased): 0.11
Nodes (25 total, 24 shown after stub filtering): gh-actions-runner-xcode-select.sh script, CI Job: build-debug, CI Job: build-release, Pages Workflow: build Job, Pages Workflow: deploy Job, release-adrianlsy Release Job, build-docs.sh Script, build-debug.sh Script (+16 more)

### Community 59 - "Project Docs & Licensing"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (24 total, 22 shown after stub filtering): PackageDescription, clean-project.sh script, eval, Entity-Resolution Failure: Duplicate Script Node, Weakly-Connected Nodes Are Extraction Artifacts, Junk Clusters from Import Edges and Generic Labels, AeroSpace App Target (XcodeGen project.yml), Entry Point Build Scripts (+14 more)

### Community 85 - "Release Build Scripts"
Cohesion (internal edge density over full membership; size-biased): 0.17
Nodes (17 total, 13 shown after stub filtering): check-contains-hash(), check-universal-binary(), build-release.sh script, install-from-sources.sh script, build-brew-cask.sh script, xcodebuild-pretty(), Fork Release Pipeline End to End, Ad-Hoc Signing Plus Quarantine-Strip Workaround (+5 more)

### Community 92 - "Fork Release Workflow"
Cohesion (internal edge density over full membership; size-biased): 0.16
Nodes (15 total, 14 shown after stub filtering): publish-release-adrianlsy.sh script, MIT License (legal/LICENSE.txt, Nikita Bobko 2023), MIT License (root LICENSE.txt, Nikita Bobko 2023), .github/workflows/pages.yml, .github/workflows/release-adrianlsy.yml, Cutting A Release (tag, watch Actions, review tap PR), Fork-Owned Files (no upstream equivalent), Manual Release Fallback (+6 more)

### Community 64 - "OpenSpec Workflow Skills"
Cohesion (internal edge density over full membership; size-biased): 0.19
Nodes (23): openspec-apply-change Skill, openspec-archive-change Skill, openspec-explore Skill, openspec-propose Skill, openspec-sync-specs Skill, openspec-update-change Skill, OpenSpec CLI, Spec-Driven Schema (+15 more)

### Community 159 - "TreeNode Bridge Findings"
Cohesion (internal edge density over full membership; size-biased): 0.50
Nodes (4): Frozen Tree Snapshot Dependency, Distributed Class Body via Swift Extensions, TreeNode Three Bridge Mechanisms, Centralized Contract vs Smeared Class Body

### Community 47 - "Fork Docs & Drift Audit"
Cohesion (internal edge density over full membership; size-biased): 0.10
Nodes (26 total, 25 shown after stub filtering): Cohesion Column Is Internal-Edge Density, Fork Docs Have Zero Edges into Code, Docs TOC Scroll-spy Script, Docs Index Redirect Page, AdrianLSY AeroSpace Fork (delta scope), Tap Repo AdrianLSY/homebrew-tap (layout + HOMEBREW_TAP_PAT), AdrianLSY/AeroSpace Distribution Fork, Fork Docs Site (adrianlsy.github.io/AeroSpace) (+17 more)

### Community 104 - "Good Monitor Arrangement"
Cohesion (internal edge density over full membership; size-biased): 0.27
Nodes (13): Good Left Corner (Free Bottom-Left Zone), Good Monitor Arrangement, Good Right Corner (Free Bottom-Right Zone), Hidden-Workspace Window Corner Stashing, Monitor 1, Monitor 2, Monitor 3 (Portrait), Good Left Corner Zone (+5 more)

### Community 128 - "App Icon Design"
Cohesion (internal edge density over full membership; size-biased): 0.28
Nodes (9): AeroSpace Docs Site Branding, macOS Traffic-Light Window Controls Motif, macOS Big Sur Squircle Icon Style, Window Management Operation Symbolism (close/minimize/zoom), macOS Big Sur Squircle Icon Convention, Window Operation Glyphs (Close / Minimize / Zoom), AeroSpace App Icon, AeroSpace App Icon (+1 more)

### Community 129 - "Bad Monitor Arrangement"
Cohesion (internal edge density over full membership; size-biased): 0.44
Nodes (9): Bad Left Corner (red, Monitor 2 bottom-left blocked by Monitor 1), Bad Right Corner (red, Monitor 2 bottom-right blocked by Monitor 3), Good Left Corner (green, free space at Monitor 1 bottom-left), Good Right Corner (green, free space at Monitor 3 bottom-right), Monitor 1 (left monitor), Monitor 2 (center monitor with blocked corners), Monitor 3 (right, portrait monitor), Bad Monitor Arrangement Diagram (variant 1) (+1 more)

### Community 134 - "Stacked Monitor Pitfall"
Cohesion (internal edge density over full membership; size-biased): 0.50
Nodes (8): Bad Left Corner Placement (red, blocks Monitor 1 bottom-left), Bad Right Corner Placement (red, blocks Monitor 1 bottom-right), Good Right Corner Placement (green, bottom-aligned with Monitor 2), Monitor 1 (top stacked monitor), Monitor 2 (bottom stacked monitor), Proper Monitor Arrangement (guide.adoc section), Bad Monitor Arrangement 2 Diagram, Free Bottom Corner Requirement for Window Hiding

### Community 157 - "Horizontal Accordion Diagram"
Cohesion (internal edge density over full membership; size-biased): 0.67
Nodes (4): Accordion Padding (Edge Slivers of Adjacent Windows), Focused Window Centered Between Accordion Neighbors, Horizontal Accordion Layout, Horizontal Accordion Layout Screenshot (htop in Alacritty)

### Community 158 - "Vertical Accordion Diagram"
Cohesion (internal edge density over full membership; size-biased): 0.83
Nodes (4): Accordion Padding (peeking edges of adjacent windows), Focused Window Prominence (focused window fills most of the screen), Vertical Accordion Layout, Vertical Accordion Screenshot (htop in terminal, macOS)

### Community 97 - "Window Tree Diagram"
Cohesion (internal edge density over full membership; size-biased): 0.20
Nodes (14): Finder Window (active), h_tiles Layout (horizontal tiling), Terminal Window, Window Tree Model, Finder Window (Leaf), Google Chrome Window (Leaf), Horizontal Tiles (Root Node), Sublime Text Window (Leaf) (+6 more)

## Knowledge Gaps
- **656 isolated node(s):** `complgen (external completion generator)`, `<boundaries_action> / <boundary> nonterminals`, `<focus_direction_flag> / <focus_dfs_relative_flag> flag sets`, `<layouts> nonterminal`, `<event> nonterminal (subscribe event names)` (+651 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **22 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `Common` connect `Command Module Imports` to `Debug Windows Recording`, `Tray Menu & Status UI`, `Move Workspace Tests`, `Shell Lexer & Parser`, `Command Execution Core`, `Move Node Commands`, `Shell Execution & IO`, `Refresh Session Engine`, `Tree Node Containers`, `AX Thread Guard Findings`, `Cardinal Direction Moves`, `Exec Env Config`, `Config Parsing & Diagnostics`, `Format Variable Expansion`, `Test Assertion Helpers`, `Focus State Management`, `Test Suite Imports`, `Env Variable Tests`, `CLI Entry Point`, `MacWindow Lifecycle`, `Format Command Tests`, `AX Run Loop & Frames`, `Start At Login`, `AeroAny & App Abstraction`, `AX Element Mock`, `Frozen Tree Types`, `Monitor Description Parsing`, `Key Mapping & Presets`, `Unix Socket Connection`, `Per-Monitor Gaps Config`, `Hotkey Binding Config`, `Move Node Tests`, `Config Command Values`, `Config Root Model`, `Tree Node Binding`, `Workspace Model`, `Cross-File Import Hub`, `Window Detected Callbacks`, `Server Event Types`, `App Termination Handling`, `Menu Bar Actions`, `AX Accessibility Attributes`, `Shared Parser Constraint`, `Reload Config Command`, `AX Dump Recursive`, `Command Pipeline & Rebase Docs`, `CmdArgs Conformance Findings`, `Appearance & SwiftUI Views`, `Frozen Tree Snapshots`?**
  _High betweenness centrality (0.154) - this node is a cross-community bridge._
- **Why does `CmdArgs` connect `CmdArgs Protocol Core` to `Command Execution Core`, `Command Dispatch & Shell`, `List Modes Args`, `Arg Parser Framework`, `Split Command Args`, `Swap Command Args`, `Subcommand Parser Registry`, `Test Assertion Helpers`, `Boolean Flag Parsers`, `Specific Arg Parsing`, `AeroAny & App Abstraction`, `Workspace Command Args`, `Interpolated Arg Consumption`, `Monitor Target Args`, `Per-Monitor Gaps Config`, `Focus Direction Args`, `Layout Command Args`, `Test Command Args`, `Test & Test-Not Commands`, `Window Detected Callbacks`, `Fullscreen Command Args`, `List Windows Args`, `List Command Args`, `AX Accessibility Attributes`, `Refresh Session Events`, `List Workspaces Args`, `Volume Command Args`, `Shared Parser Constraint`, `Enable Command Args`, `Config Command Args`, `Move Mouse Args`, `Command Pipeline & Rebase Docs`, `CmdArgs Conformance Findings`, `Run Callback Args`, `Workspace To Monitor Args`?**
  _High betweenness centrality (0.089) - this node is a cross-community bridge._
- **Why does `TreeNode` connect `TreeNode Base Class` to `AeroAny & App Abstraction`, `Window Layout Primitives`, `Relative Monitor Resolution`, `Recursive Layout Engine`, `Frozen Tree Types`, `Tree Node Binding`, `Cross-File Import Hub`, `MRU Stack`, `Tiling Container Nodes`, `Command Module Imports`, `Workspace Model`, `Per-Monitor Gaps Config`, `Tree Node Containers`, `Tree Node Parent Cases`, `Cardinal Direction Moves`, `Test Suite Imports`, `Rect Geometry`, `TreeNode Bridge Findings`?**
  _High betweenness centrality (0.070) - this node is a cross-community bridge._
- **Are the 268 inferred relationships involving `assertEquals()` (e.g. with `checkAxDumpsRecursive()` and `.testBalanceSizesCommand()`) actually correct?**
  _`assertEquals()` has 268 INFERRED edges - model-reasoned connections that need verification._
- **Are the 207 inferred relationships involving `parseCommand()` (e.g. with `testParseCommandHelp()` and `testParseSingleCommandSucc()`) actually correct?**
  _`parseCommand()` has 207 INFERRED edges - model-reasoned connections that need verification._
- **What connects `complgen (external completion generator)`, `<boundaries_action> / <boundary> nonterminals`, `<focus_direction_flag> / <focus_dfs_relative_flag> flag sets` to the rest of the system?**
  _656 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Command Test Fixtures` be split into smaller, more focused modules?**
  _Cohesion score 0.04655113829425756 - nodes in this community are weakly interconnected._