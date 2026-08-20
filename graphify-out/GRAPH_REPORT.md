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
- Tray Menu & Status UI
- Config Parsing Tests
- Test Harness Setup
- Shell Lexer & Parser
- Command Execution Core
- Known Bundle IDs
- Command Module Imports
- Command Dispatch & Shell
- Command Stdin Tests
- MacApp AX Threading
- Arg Parser Framework
- Shell Parser Tests
- Shell Execution & IO
- Command Kind Registry
- Refresh Session Engine
- Tree Node Containers
- Test Suite Imports
- Cardinal Direction Moves
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
- Key Mapping & Presets
- JSON Model
- Monitor Target Args
- Unix Socket Connection
- Per-Monitor Gaps Config
- Focus Direction Args
- Build & Dev Scripts
- Fork Docs & Drift Audit
- Client-Server Protocol
- Layout Command Args
- Tree Node Parent Cases
- Config Parse Diagnostics
- CI Release Pipeline
- String Interpolation Tokens
- CLI Grammar Productions
- Hotkey Binding Config
- Move Node Tests
- Test Command Args
- Common Utility Extensions
- Project Docs & Licensing
- Config Command Values
- Result Extensions
- Rect Geometry
- Test & Test-Not Commands
- OpenSpec Workflow Skills
- Config Root Model
- Grammar Test Parser
- Format Primitives
- Exit Code Commands
- Tree Node Binding
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
- Release Build Scripts
- Layout Normalization
- Refresh Session Events
- Monitor Info Impl
- Window Detected Tests
- List Workspaces Args
- Volume Command Args
- Fork Release Workflow
- Shared Parser Constraint
- Reload Config Command
- AX Dump Recursive
- Enable Command Args
- Window Tree Diagram
- MRU Stack
- Relative Monitor Resolution
- Recursive Layout Engine
- Config Command Args
- Move Mouse Args
- Command Pipeline & Rebase Docs
- Good Monitor Arrangement
- Volume HUD Panel
- CmdArgs Conformance Findings
- Array Slice Utility
- Direction Enums
- Layout Test DSL
- Run Callback Args
- Optional Extensions
- Workspace To Monitor Args
- Code Generation Pipeline
- Shell Test DSL
- Native Focus & Mouse Probes
- Shared Arg Enums
- Grammar & Rebase Protocol
- Tree Node Case Enums
- Non-Leaf Node Kinds
- Secure Input HUD
- AX Element Attributes
- AX Dump Fixtures
- Docs & Completion Build Scripts
- Appearance & SwiftUI Views
- Frozen Tree Snapshots
- Echo Command Tests
- Array Extensions
- App Icon Design
- Bad Monitor Arrangement
- Debug Windows Recording
- Move Workspace Tests
- Subscribe Args Tests
- String Logical Segments
- Stacked Monitor Pitfall
- Collection Extensions
- Move Node Commands
- Sequence Patterns
- Server Enablement Checks
- List Modes Args
- Split Command Args
- Swap Command Args
- Subcommand Parser Registry
- Nullable Wrapper
- Config File Watcher
- AX Thread Guard Findings
- Lazy Sequence Filters
- Exec Env Config
- App Entry Point
- Completable Future
- Collection Grouping Helpers
- JSON Encoder Defaults
- MainActor Isolation Checks
- Container Auto-Flatten
- Env Variable Tests
- Tiling Container Test Helpers
- NonCopyable Wrapper
- Horizontal Accordion Diagram
- Vertical Accordion Diagram
- TreeNode Bridge Findings
- NS Panel HUD
- Start At Login
- AX Element Mock
- Activation Policy Helper
- Range Extensions
- Equatable Noop Wrapper
- Window Tree Membership
- Join Args Helper
- AX Trust Prompt
- Focus Grammar Nonterminals
- Call Edge Dedup Findings
- HotKey License
- ISSoundAdditions License
- swift-collections License
- TOMLDecoder License
- Clean Xcode Script
- Publish Release Script
- Reset AX Permission
- SwiftLint Configuration
- Layouts Grammar Nonterminal
- Hyperedge ID Collision Fix
- Bool Stub Node

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
- `TreeNode Three Bridge Mechanisms` --references--> `MruStack`  [INFERRED]
  graphify-out/memory/query_20260819_135128_why_does_treenode_connect_treenode_base_class_to_1.md → Sources/AppBundle/util/MruStack.swift
- `Command Pipeline Four-Place Consistency` --references--> `CmdKind`  [INFERRED]
  graphify-out/memory/query_20260820_004241_three_four_place_command_pipeline_consistency__are.md → Sources/Common/cmdArgs/cmdArgsManifest.swift
- `TreeNode Three Bridge Mechanisms` --references--> `TreeNode`  [INFERRED]
  graphify-out/memory/query_20260819_135128_why_does_treenode_connect_treenode_base_class_to_1.md → Sources/AppBundle/tree/TreeNode.swift
- `Duplicate Boundaries Enum` --references--> `Boundaries`  [INFERRED]
  graphify-out/memory/query_20260820_004241_cohesion_outliers__which_communities_are_junk_clus.md → Sources/Common/cmdArgs/impl/FocusCmdArgs.swift

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **2026-08-20 Errata Re-Verification Pass (d42555f6 to be847df0)** — graphify_out_memory_query_20260820_001433_are_the_220_inferred_relationships_involving_parse_raw_call_site_count, graphify_out_memory_query_20260820_001433_are_the_281_inferred_relationships_involving_asser_assertequals_edge_correctness, graphify_out_memory_query_20260820_001433_why_does_common_connect_command_framework_imports_common_shared_target, graphify_out_memory_query_20260820_004241_refresh_session_invariant__do_all_tree_mutations_r_runlightsession_call_site_count, graphify_out_memory_query_20260820_004241_group_structures__hyperedges__protocol_conformance_extension_scattering_pattern [EXTRACTED 1.00]
- **Four-Place Command Definition Workflow** — graphify_out_memory_query_20260820_004241_three_four_place_command_pipeline_consistency__are_command_pipeline_consistency, graphify_out_memory_query_20260820_004241_three_four_place_command_pipeline_consistency__are_bnf_grammar_flag_rot, graphify_out_memory_query_20260820_004241_three_four_place_command_pipeline_consistency__are_exec_and_forget_exemption, graphify_out_memory_query_20260820_004241_group_structures__hyperedges__protocol_conformance_cmdargs_conformance_table, graphify_out_memory_query_20260820_004241_group_structures__hyperedges__protocol_conformance_command_conformance_table, graphify_out_memory_query_20260820_004241_three_four_place_command_pipeline_consistency__are_completion_grammar_drift_guard [INFERRED 0.95]
- **parseCommand Shared Fan-In (CLI, Server, Config, Tests)** — graphify_out_memory_query_20260820_001433_why_does_common_connect_command_framework_imports_shared_parser_constraint, graphify_out_memory_query_20260820_001433_why_does_common_connect_command_framework_imports_common_shared_target, graphify_out_memory_query_20260820_004241_subsystem_coupling_map__how_do_aerospace_subsystem_config_cli_grammar_dependency, graphify_out_memory_query_20260820_001433_are_the_220_inferred_relationships_involving_parse_parsecommand_node_disambiguation, graphify_out_memory_query_20260820_004241_three_four_place_command_pipeline_consistency__are_bnf_grammar_flag_rot [INFERRED 0.85]
- **Bundled Dependencies with Permissive Licenses** — legal_readme_bundled_dependencies, legal_readme_hotkey, legal_readme_tomldecoder, legal_readme_swift_collections, legal_readme_issoundadditions [EXTRACTED 1.00]
- **AeroSpace Window Tree Hierarchy** — docs_assets_tree_horizontal_tiles_root_node, docs_assets_tree_vertical_tiles_container, docs_assets_tree_sublime_text_window, docs_assets_tree_google_chrome_window, docs_assets_tree_finder_window, docs_assets_tree_terminal_active_window [EXTRACTED 1.00]
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
- **Fork's Shell-Completion Correctness Fix Set** — fork_completion_nonexistent_flag, fork_completion_missing_flags, fork_completion_invalid_combinations, fork_completion_missing_separator, fork_completion_forbidden_flags, grammar_commands_bnf_grammar, build_shell_completion [INFERRED 0.85]
- **Fork Issue Routing System** — _github_issue_template_config_contact_links, _github_issue_template_fork_bug_template, _github_issue_template_fork_feature_template, _github_issue_template_upstream_redirect_template, _github_issue_template_config_upstream_redirect_policy, _github_issue_template_config_upstream_aerospace_repo [INFERRED 0.95]

## Communities (186 total, 22 thin omitted)

### Community 0 - "Command Test Fixtures"
Cohesion (internal edge density over full membership; size-biased): 0.05
Nodes (109 total, 9 shown after stub filtering): FocusCommandTest, LayoutCommandTest, ListWindowsTest, ListWorkspacesTest, MoveCommandTest, ResizeCommandTest, SplitCommandTest, SwapCommandTest (+1 more)

### Community 1 - "CmdArgs Protocol Core"
Cohesion (internal edge density over full membership; size-biased): 0.03
Nodes (95 total, 63 shown after stub filtering): .workspace, Workspace, Set, Element, ArgParserProtocol, BalanceSizesCmdArgs, Self, StrArrSlice (+55 more)

### Community 2 - "Tray Menu & Status UI"
Cohesion (internal edge density over full membership; size-biased): 0.05
Nodes (68 total, 54 shown after stub filtering): DismissAction, Font, Hashable, Identifiable, ObservableObject, ExperimentalUISettings, .displayStyle, getExperimentalUISettingsMenu() (+46 more)

### Community 3 - "Config Parsing Tests"
Cohesion (internal edge density over full membership; size-biased): 0.07
Nodes (68 total, 7 shown after stub filtering): parseConfig(), assertEquals(), assertFalse(), Bool, ConfigCommandTest, ConfigTest, ParseEnvVariablesTest

### Community 4 - "Test Harness Setup"
Cohesion (internal edge density over full membership; size-biased): 0.04
Nodes (64 total, 18 shown after stub filtering): BalanceSizesCommandTest, CloseCommandTest, ExecCommandTest, FalseCommandTest, FlattenWorkspaceTreeCommandTest, FocusMonitorCommandTest, parseFocusMonitorTarget(), String (+10 more)

### Community 5 - "Shell Lexer & Parser"
Cohesion (internal edge density over full membership; size-biased): 0.07
Nodes (63 total, 48 shown after stub filtering): Char, Character, .isQuote, LexerToken, locateChars(), Location, .description, Payload (+40 more)

### Community 6 - "Command Execution Core"
Cohesion (internal edge density over full membership; size-biased): 0.12
Nodes (58 total, 13 shown after stub filtering): CmdEnv, .asMap, CmdIo, changeTilingLayout(), CGPoint, moveMouse(), MoveMouseCommand, CGPoint (+5 more)

### Community 7 - "Known Bundle IDs"
Cohesion (internal edge density over full membership; size-biased): 0.04
Nodes (55 total, 48 shown after stub filtering): KnownBundleId Window Classification Table, onFocusChanged Recursion Guard, Shell Command Front-End (runShellOr/And/Seq/Pipe), Subsystem Coupling Map (Beyond Imports), Pinned AX-Dump JSON5 Fixtures, KnownBundleId App Compatibility Table, Four Window-Classification Override Clusters, AxUiElementMock (+40 more)

### Community 8 - "Command Module Imports"
Cohesion (internal edge density over full membership; size-biased): 0.07
Nodes (51 total, 5 shown after stub filtering): AppKit, Common, <app_bundle_id> / <pid> nonterminals (shell out to list-apps), <monitor_id> nonterminal (shells out to list-monitors), ISSoundAdditions

### Community 9 - "Command Dispatch & Shell"
Cohesion (internal edge density over full membership; size-biased): 0.07
Nodes (50 total, 47 shown after stub filtering): ParsedCmd, Command, .info, Bool, BalanceSizesCommand, CloseAllWindowsButCurrentCommand, CloseCommand, ConfigCommand (+39 more)

### Community 10 - "Command Stdin Tests"
Cohesion (internal edge density over full membership; size-biased): 0.07
Nodes (49 total, 6 shown after stub filtering): CmdStdin, .emptyStdin, assertTrue(), EvalCommandTest, WorkspaceCommandTest, ShellRunTest

### Community 11 - "MacApp AX Threading"
Cohesion (internal edge density over full membership; size-biased): 0.10
Nodes (48 total, 21 shown after stub filtering): T, MacApp, .bundlePath, .execPath, .name, Bool, escaping, Int (+13 more)

### Community 12 - "Arg Parser Framework"
Cohesion (internal edge density over full membership; size-biased): 0.08
Nodes (46 total, 40 shown after stub filtering): Context, PosArgParser, ArgParser, dashDashArg(), newMandatoryPosArgParser(), parseCardinalDirectionArg(), parseCardinalOrDfsDirection(), parseEnum() (+32 more)

### Community 13 - "Shell Parser Tests"
Cohesion (internal edge density over full membership; size-biased): 0.08
Nodes (45 total, 5 shown after stub filtering): assertFail(), assertSucc(), F, ShellLexerTest, ShellParserTest

### Community 14 - "Shell Execution & IO"
Cohesion (internal edge density over full membership; size-biased): 0.07
Nodes (44 total, 29 shown after stub filtering): C1, C2, CmdIoForwardingStdin, CmdIoImpl, .emptyStdinIgnoringOut, CmdResult, String, runShellAnd() (+21 more)

### Community 15 - "Command Kind Registry"
Cohesion (internal edge density over full membership; size-biased): 0.05
Nodes (44): CaseIterable, CmdKind, balanceSizes, closeAllWindowsButCurrent, config, debugWindows, echo, enable (+36 more)

### Community 16 - "Refresh Session Engine"
Cohesion (internal edge density over full membership; size-biased): 0.07
Nodes (44 total, 38 shown after stub filtering): Config Reloads Are Hot (preserve runtime toggle state), Focus Subsystem (LiveFocus / FrozenFocus), Master Switch (TrayMenuModel.shared.isEnabled), Refresh Sessions (focus + layout reconciliation), runLightSession Is Single-Flight, AutoRaise Hover-to-Raise Removal (breaking change), Upstream focus-follows-mouse (AutoRaise replacement), Deliberate Out-of-Session Mutations (+30 more)

### Community 17 - "Tree Node Containers"
Cohesion (internal edge density over full membership; size-biased): 0.07
Nodes (44 total, 36 shown after stub filtering): Tree Model (TreeNode / Workspace / TilingContainer / Window), Unconventional Windows Containers (fullscreen/hidden/minimized/popup), FloatingWindowsContainer, Workspace, MacosFullscreenWindowsContainer, MacosHiddenAppsWindowsContainer, MacosMinimizedWindowsContainer, MacosPopupWindowsContainer (+28 more)

### Community 19 - "Cardinal Direction Moves"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (43 total, 37 shown after stub filtering): FloatingWindowData, FocusCommand, hitAllMonitorsOuterFrameBoundaries(), hitWorkspaceBoundaries(), makeFloatingWindowsSeenAsTiling(), restoreFloatingWindows(), CGFloat, CGPoint (+29 more)

### Community 20 - "TreeNode Base Class"
Cohesion (internal edge density over full membership; size-biased): 0.06
Nodes (43 total, 35 shown after stub filtering): resizeWithMouse(), CGFloat, Window, NilTreeNode, Any, Bool, String, T (+27 more)

### Community 21 - "Config Parsing & Diagnostics"
Cohesion (internal edge density over full membership; size-biased): 0.14
Nodes (41 total, 33 shown after stub filtering): S, expectedActualTypeError(), ConfigBacktrace, expectedActualTypeDiagnostic(), OrderedJson.JsonDict, parseArrayOfStrings(), parseBool(), parseConfigVersion() (+25 more)

### Community 22 - "Format Variable Expansion"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (41 total, 32 shown after stub filtering): AeroObj, app, .kind, monitor, window, workspace, Cell, InterVarExpansionError (+24 more)

### Community 23 - "Test Assertion Helpers"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (41 total, 19 shown after stub filtering): assertNil(), assertNotEquals(), assertNotNil(), failExpectedActual(), Any, StaticString, String, T (+11 more)

### Community 24 - "Focus State Management"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (39 total, 30 shown after stub filtering): Self, String, UInt32, getNextPrevWorkspace(), Bool, String, Workspace, checkOnFocusChangedCallbacks_nonCancellable() (+22 more)

### Community 25 - "Boolean Flag Parsers"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (39 total, 32 shown after stub filtering): CloseAllWindowsButCurrentCmdArgs, Self, StrArrSlice, CloseCmdArgs, Bool, Self, StrArrSlice, MoveNodeToWorkspaceCmdArgs (+24 more)

### Community 26 - "Format Interpolation Vars"
Cohesion (internal edge density over full membership; size-biased): 0.06
Nodes (39 total, 37 shown after stub filtering): AppFormatVar, appBundleId, appBundlePath, appExecPath, appName, appPid, Kind, formatVar (+29 more)

### Community 27 - "CLI Entry Point"
Cohesion (internal edge density over full membership; size-biased): 0.08
Nodes (37 total, 27 shown after stub filtering): Darwin, hasStdin(), Bool, Main, run(), runSubscribe(), Int32, StrArrSlice (+19 more)

### Community 28 - "MacWindow Lifecycle"
Cohesion (internal edge density over full membership; size-biased): 0.11
Nodes (37 total, 16 shown after stub filtering): MacWindow, .allWindows, .isHiddenInCorner, Bool, CGFloat, CGPoint, CGSize, Int (+8 more)

### Community 29 - "Format Command Tests"
Cohesion (internal edge density over full membership; size-biased): 0.11
Nodes (37 total, 11 shown after stub filtering): assertPrimitive(), FormatTest, StaticString, UInt, FormatVar, app, .kind, monitor (+3 more)

### Community 30 - "Specific Arg Parsing"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (36 total, 29 shown after stub filtering): ArgParserInput, PosArgParserInput, .arg, String, .isCliDashFlag, SubArgParserInput, .argOrNil, Bool (+21 more)

### Community 31 - "Broadcast Latch Async"
Cohesion (internal edge density over full membership; size-biased): 0.14
Nodes (35 total, 17 shown after stub filtering): CheckedContinuation, isolated, syncConfigFileWatcher(), AwaitableOneTimeBroadcastLatch, Error, Hasher, String, UniqueToken (+9 more)

### Community 32 - "AX Run Loop & Frames"
Cohesion (internal edge density over full membership; size-biased): 0.12
Nodes (35 total, 21 shown after stub filtering): NSObject, RunLoopAction, RunLoopJob, .isCancelled, Bool, escaping, Int32, Sendable (+13 more)

### Community 33 - "AeroAny & App Abstraction"
Cohesion (internal edge density over full membership; size-biased): 0.08
Nodes (34 total, 24 shown after stub filtering): AnyObject, AbstractApp, Hasher, Window, .macAppUnsafe, Int32, String, Window (+16 more)

### Community 34 - "Window Layout Primitives"
Cohesion (internal edge density over full membership; size-biased): 0.10
Nodes (34 total, 21 shown after stub filtering): .run, .cases, .nodeCases, Bool, CGFloat, CGPoint, CGSize, Hasher (+13 more)

### Community 35 - "Workspace Command Args"
Cohesion (internal edge density over full membership; size-biased): 0.08
Nodes (34 total, 26 shown after stub filtering): parseWorkspaces(), WorkspaceFilter, focused, name, visible, parseWorkspaceName(), SummonWorkspaceCmdArgs, Bool (+18 more)

### Community 36 - "Config Value Parsers"
Cohesion (internal edge density over full membership; size-biased): 0.06
Nodes (33 total, 31 shown after stub filtering): Any, tomlAnyToOrderedJsonRecursive(), OrderedJson, array, .asArrayOrNil, .asBoolOrNil, .asDictOrNil, .asInt64OrNil (+23 more)

### Community 37 - "Frozen Tree Types"
Cohesion (internal edge density over full membership; size-biased): 0.11
Nodes (31 total, 25 shown after stub filtering): cacheClosedWindowIfNeeded(), FrozenMonitor, FrozenWorkspace, resetClosedWindowsCache(), restoreClosedWindowsCacheIfNeeded(), restoreTreeRecursive(), Bool, CGPoint (+17 more)

### Community 38 - "Interpolated Arg Consumption"
Cohesion (internal edge density over full membership; size-biased): 0.07
Nodes (31 total, 24 shown after stub filtering): consumeWholeArrayOfInterpolatedPosArgs(), EchoCmdArgs, Bool, Self, StrArrSlice, consumeStrCliArg(), ModeCmdArgs, Self (+16 more)

### Community 39 - "Monitor Description Parsing"
Cohesion (internal edge density over full membership; size-biased): 0.10
Nodes (30 total, 21 shown after stub filtering): AnyRegexOutput, parseCasInsensitiveRegex(), ResOrConfigParseDiagnostic, parseMonitorDescription(), parseMonitorDescriptions(), parseWorkspaceToMonitorAssignment(), ResOrConfigParseDiagnostic, String (+13 more)

### Community 40 - "Key Mapping & Presets"
Cohesion (internal edge density over full membership; size-biased): 0.10
Nodes (30 total, 25 shown after stub filtering): Duplicate Boundaries Enum, HotKey, getKeysPreset(), NSEvent.ModifierFlags, String, isValidKeyNotation(), KeyMapping, parseKeyMapping() (+17 more)

### Community 41 - "JSON Model"
Cohesion (internal edge density over full membership; size-biased): 0.08
Nodes (30 total, 23 shown after stub filtering): Json, array, .asDictOrDie, .asDictOrNil, .asInt64OrNil, bool, dict, int (+15 more)

### Community 42 - "Monitor Target Args"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (30 total, 25 shown after stub filtering): FocusMonitorCmdArgs, MonitorTarget, .cases, .casesExceptPatterns, direction, .directionOrNil, .isPatterns, patterns (+17 more)

### Community 43 - "Unix Socket Connection"
Cohesion (internal edge density over full membership; size-biased): 0.15
Nodes (29 total, 18 shown after stub filtering): Network, NWError, newConnection(), startUnixSocketServer(), toggleReleaseServerIfDebug(), handleSubscribeAndWaitTillError(), Subscriber, InitConnectionError (+10 more)

### Community 44 - "Per-Monitor Gaps Config"
Cohesion (internal edge density over full membership; size-biased): 0.16
Nodes (28 total, 21 shown after stub filtering): Equatable, DynamicConfigValue, constant, perMonitor, parseDynamicValue(), parsePerMonitorValues(), PerMonitorValue, T (+13 more)

### Community 45 - "Focus Direction Args"
Cohesion (internal edge density over full membership; size-biased): 0.10
Nodes (27 total, 25 shown after stub filtering): FocusCmdArgs, .boundaries, .boundariesAction, .target, FocusCmdTarget, dfsIndex, dfsRelative, direction (+17 more)

### Community 46 - "Build & Dev Scripts"
Cohesion (internal edge density over full membership; size-biased): 0.14
Nodes (26 total, 17 shown after stub filtering): build-debug.sh script, bash >= 5 Requirement and PATH Nuking, Primary Dev Loop Scripts, Periphery Dead-Code Scan Skip (stale stated cause), swift-test.sh Silently Drops Arguments, format.sh script, Genuine Dead-Code Candidates, development.md Stale Script List (+9 more)

### Community 47 - "Fork Docs & Drift Audit"
Cohesion (internal edge density over full membership; size-biased): 0.10
Nodes (26 total, 25 shown after stub filtering): CLAUDE.md (fork architecture guide), AdrianLSY AeroSpace Fork (delta scope), Docs Site Deployment (Pages on tagged releases only), Tap Repo AdrianLSY/homebrew-tap (layout + HOMEBREW_TAP_PAT), Docs TOC Scroll-spy Script, Docs Index Redirect Page, FORK.md (fork overview), AdrianLSY/AeroSpace Distribution Fork (+17 more)

### Community 48 - "Client-Server Protocol"
Cohesion (internal edge density over full membership; size-biased): 0.13
Nodes (26 total, 14 shown after stub filtering): CodingKey, Decoder, ClientServerTest, ClientRequest, ClientRequestData, CodingKeys, stdin, windowId (+6 more)

### Community 49 - "Layout Command Args"
Cohesion (internal edge density over full membership; size-biased): 0.10
Nodes (26 total, 22 shown after stub filtering): Bool, LayoutCmdArgs, LayoutDescription, accordion, floating, h_accordion, h_tiles, horizontal (+14 more)

### Community 50 - "Tree Node Parent Cases"
Cohesion (internal edge density over full membership; size-biased): 0.08
Nodes (26 total, 24 shown after stub filtering): ConventionalWindowParentCases, floatingWindowsContainer, .floatingWindowsContainerOrNil, tilingContainer, .tilingContainerOrNil, TilingContainer, Window, Workspace (+16 more)

### Community 51 - "Config Parse Diagnostics"
Cohesion (internal edge density over full membership; size-biased): 0.12
Nodes (26 total, 22 shown after stub filtering): .description, .isRootKey, ConfigParseDiagnostic, ParseConfigResult, .allowReloadConfig, readConfig(), ReadConfigResult, Severity (+14 more)

### Community 52 - "CI Release Pipeline"
Cohesion (internal edge density over full membership; size-biased): 0.11
Nodes (25 total, 24 shown after stub filtering): Potential Bugs Discussion Template, GitHub Sponsors Link (nikitabobko), Issue Template Config (Upstream Contact Link), Upstream nikitabobko/AeroSpace Repository, Upstream Redirect Policy, Fork-Specific Bug Issue Template, Fork-Specific Feature Request Template, Upstream Redirect Issue Template (+16 more)

### Community 53 - "String Interpolation Tokens"
Cohesion (internal edge density over full membership; size-biased): 0.11
Nodes (25 total, 18 shown after stub filtering): Error, LocalizedError, RawStringInterToken, Array, InterpolationParserState, interpolationCharEncountered, interpolationVariable, stringLiteral (+10 more)

### Community 54 - "CLI Grammar Productions"
Cohesion (internal edge density over full membership; size-biased): 0.12
Nodes (25): Bug Report Routing (fork issues vs upstream discussions), Fix: completion offered flags the argument forbids, Fix: completion suggested mutually exclusive combinations, Fix: completion omitted real flags and mandatory args, Fix: completion never offered the -- separator, Fix: completion suggested nonexistent --window flag, Fix: move-workspace-to-display alias skipped arg validation, Fix: test-not --help printed test's usage (+17 more)

### Community 55 - "Hotkey Binding Config"
Cohesion (internal edge density over full membership; size-biased): 0.16
Nodes (25 total, 19 shown after stub filtering): HotkeyBinding, parseBinding(), parseBindings(), NSEvent, ResOrConfigParseDiagnostic, Shell, String, Key (+11 more)

### Community 56 - "Move Node Tests"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (25 total, 8 shown after stub filtering): MoveNodeToWorkspaceCommandTest, MoveNodeToWorkspaceCmdArgs, ParsedCmd, .cmdOrDie, .errorOrNil, Bool, String, T

### Community 57 - "Test Command Args"
Cohesion (internal edge density over full membership; size-biased): 0.14
Nodes (25 total, 17 shown after stub filtering): InfixOperator, equals, matchesRegex, parseTestCmdArgs(), parseTestInfixOperator(), parseTestLhs(), parseTestRhs(), ParsedCmd (+9 more)

### Community 58 - "Common Utility Extensions"
Cohesion (internal edge density over full membership; size-biased): 0.15
Nodes (25 total, 11 shown after stub filtering): Comparable, Sequence, .withIndex, Double, E, Int, ParsedCmd, R (+3 more)

### Community 59 - "Project Docs & Licensing"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (24 total, 22 shown after stub filtering): AX Dump Scenario: Firefox Google Meet Share Window, Single Private API Principle (_AXUIElementGetWindow only), Swift Strict Concurrency Convention, Entry Point Build Scripts, Self-signed Codesign Certificate (aerospace-codesign-certificate), Development Notes (build/install from sources), Deletions To Re-Verify After Each Rebase, label-incoming-prs.yml Deletion (would mark all fork PRs not-actionable) (+14 more)

### Community 60 - "Config Command Values"
Cohesion (internal edge density over full membership; size-biased): 0.13
Nodes (24 total, 18 shown after stub filtering): Encodable, <mode_id> / <binding> nonterminals (shell out to config --get mode), buildConfigMap(), ConfigMapValue, array, map, scalar, ConfigScalarValue (+10 more)

### Community 61 - "Result Extensions"
Cohesion (internal edge density over full membership; size-biased): 0.12
Nodes (24 total, 15 shown after stub filtering): [AeroObj], Bool, String, Result, .failureOrNil, .isSuccess, Bool, Failure (+7 more)

### Community 62 - "Rect Geometry"
Cohesion (internal edge density over full membership; size-biased): 0.12
Nodes (24 total, 18 shown after stub filtering): CGRect, Rect, .bottomLeftCorner, .bottomRightCorner, .center, .height, .maxX, .maxY (+10 more)

### Community 63 - "Test & Test-Not Commands"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (24 total, 8 shown after stub filtering): TestCommandTest, parseTestNotCmdArgs(), CmdArgsCommonState, CmdParser, ParsedCmd, Self, StrArrSlice, TestNotCmdArgs

### Community 64 - "OpenSpec Workflow Skills"
Cohesion (internal edge density over full membership; size-biased): 0.19
Nodes (23): OpenSpec CLI, OpenSpec Store Selection, OPSX Apply Command Workflow, Inline Sync Before Archive, OPSX Archive Command Workflow, Explore Mode Stance, OPSX Explore Command Workflow, Artifact Dependency Graph (+15 more)

### Community 65 - "Config Root Model"
Cohesion (internal edge density over full membership; size-biased): 0.11
Nodes (23 total, 21 shown after stub filtering): Existential Command Consumers, Mode, Config, ConfigVersion, _1, _2, .description, DefaultContainerOrientation (+13 more)

### Community 66 - "Grammar Test Parser"
Cohesion (internal edge density over full membership; size-biased): 0.20
Nodes (23 total, 10 shown after stub filtering): Sequence, Set, CompletionGrammarTest, Failure, Grammar, .url, String, StaticString (+2 more)

### Community 67 - "Format Primitives"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (23 total, 14 shown after stub filtering): Kind, bool, int, string, Primitive, bool, int, .kind (+6 more)

### Community 68 - "Exit Code Commands"
Cohesion (internal edge density over full membership; size-biased): 0.10
Nodes (23 total, 15 shown after stub filtering): FalseCommand, Bool, Bool, TrueCommand, succ, ConditionalExitCode, fail, _false (+7 more)

### Community 69 - "Tree Node Binding"
Cohesion (internal edge density over full membership; size-biased): 0.17
Nodes (23 total, 13 shown after stub filtering): BindingData, CGFloat, Int, getChildParentRelation(), getChildParentRelationOrNil(), illegalChildParentRelation(), NonLeafTreeNodeObject, .kind (+5 more)

### Community 70 - "Workspace Model"
Cohesion (internal edge density over full membership; size-biased): 0.15
Nodes (23 total, 16 shown after stub filtering): CGPoint, gcMonitors(), getStubWorkspace(), isValidAssignment(), .activeWorkspace, rearrangeWorkspacesOnMonitors(), Bool, CGPoint (+8 more)

### Community 71 - "Cross-File Import Hub"
Cohesion (internal edge density over full membership; size-biased): 0.10
Nodes (22 total, 10 shown after stub filtering): Foundation, runLightSession Call-Site Count (corrected: 13, not 12), Mouse Subsystem Structural Anonymity, Cancel-and-Replace Coalescing, balance(), TilingContainer, HotKey, .isEnabled (+2 more)

### Community 72 - "Window Detected Callbacks"
Cohesion (internal edge density over full membership; size-biased): 0.13
Nodes (22 total, 19 shown after stub filtering): LegacyWindowDetectedCallbackMatcher, .debugJson, parseMatcher(), parseOnWindowDetectedArray(), parseWindowDetectedCallback(), Bool, Sendable, Shell (+11 more)

### Community 73 - "Tiling Container Nodes"
Cohesion (internal edge density over full membership; size-biased): 0.13
Nodes (21 total, 14 shown after stub filtering): Layout, accordion, tiles, String, Bool, CGFloat, Int, TilingContainer (+6 more)

### Community 74 - "Fullscreen Command Args"
Cohesion (internal edge density over full membership; size-biased): 0.12
Nodes (21 total, 17 shown after stub filtering): FullscreenCmdArgs, parseFullscreenCmdArgs(), Bool, ParsedCmd, Self, StrArrSlice, MacosNativeFullscreenCmdArgs, parseMacosNativeFullscreenCmdArgs() (+9 more)

### Community 75 - "List Windows Args"
Cohesion (internal edge density over full membership; size-biased): 0.13
Nodes (21 total, 20 shown after stub filtering): AeroObjKind, app, monitor, window, workspace, FilteringOptions, formatParser(), .allCases (+12 more)

### Community 76 - "Server Event Types"
Cohesion (internal edge density over full membership; size-biased): 0.15
Nodes (20 total, 13 shown after stub filtering): Codable, ServerEvent, .eventType, Int, String, UInt32, ServerEventType, bindingTriggered (+5 more)

### Community 77 - "CGPoint Offset Helpers"
Cohesion (internal edge density over full membership; size-biased): 0.14
Nodes (20 total, 11 shown after stub filtering): .body, CGFloat, CGPoint, .monitorApproximation, .vectorLength, .withYAxisFlipped, CGFloat, ClosedRange (+3 more)

### Community 78 - "List Command Args"
Cohesion (internal edge density over full membership; size-biased): 0.13
Nodes (20 total, 16 shown after stub filtering): getErrorIfFormatIsIncompatibleWithJson(), ListAppsCmdArgs, .format, parseListAppsCmdArgs(), Bool, ParsedCmd, Self, StrArrSlice (+8 more)

### Community 79 - "Command Parse Results"
Cohesion (internal edge density over full membership; size-biased): 0.18
Nodes (20 total, 14 shown after stub filtering): ParsedCmd, cmd, .cmdOrNil, failure, help, Bool, Int32, R (+6 more)

### Community 80 - "AX Subscriptions & Threading"
Cohesion (internal edge density over full membership; size-biased): 0.16
Nodes (19 total, 12 shown after stub filtering): AXObserverCallback, HandlerToNotifKeyMapping, AXObserver, pid_t, AxSubscription, AXUIElement, Bool, String (+4 more)

### Community 81 - "Array Slice Collection"
Cohesion (internal edge density over full membership; size-biased): 0.17
Nodes (19 total, 12 shown after stub filtering): ExpressibleByArrayLiteral, RandomAccessCollection, Array, ArrSlice, .endIndex, .indices, .startIndex, ArrSliceIterator (+4 more)

### Community 82 - "App Termination Handling"
Cohesion (internal edge density over full membership; size-biased): 0.14
Nodes (19 total, 14 shown after stub filtering): os, bootstrapConfig_nonCancellable(), initAppBundle(), initServerArgs(), smartLayoutAtStartup(), AppServerTerminationHandler, checkCancellation(), initTerminationHandler() (+6 more)

### Community 83 - "Menu Bar Actions"
Cohesion (internal edge density over full membership; size-biased): 0.18
Nodes (19 total, 17 shown after stub filtering): ConfigFile, ambiguousConfigError, file, noCustomConfigExists, .urlOrNil, findCustomConfigUrl(), URL, getTextEditorToOpenConfig() (+9 more)

### Community 84 - "AX Accessibility Attributes"
Cohesion (internal edge density over full membership; size-biased): 0.18
Nodes (18 total, 17 shown after stub filtering): CFTypeRef, PrivateApi, Sendable, ServerArgs, Bool, String, Ax, castToAxUiElementMock() (+9 more)

### Community 85 - "Release Build Scripts"
Cohesion (internal edge density over full membership; size-biased): 0.17
Nodes (17 total, 13 shown after stub filtering): check-contains-hash(), check-universal-binary(), build-release.sh script, SPM vs Xcode Build Split, Upstream-Owned Dev Docs (byte-identical, known stale spots), Files That Stay Upstream-Shaped (do not rebrand), Ad-Hoc Signing Plus Quarantine-Strip Workaround, Fork Release Pipeline End to End (+5 more)

### Community 86 - "Layout Normalization"
Cohesion (internal edge density over full membership; size-biased): 0.16
Nodes (17 total, 13 shown after stub filtering): CoreGraphics, exitMacOsNativeUnconventionalState(), normalizeLayoutReason(), Window, Workspace, validateStillPopups(), getWindowLevel(), MacOsWindowLevel (+5 more)

### Community 87 - "Refresh Session Events"
Cohesion (internal edge density over full membership; size-biased): 0.12
Nodes (16): CustomStringConvertible, RefreshSessionEvent, ax, configAutoReload, .description, focusFollowsMouse, globalObserver, globalObserverLeftMouseUp (+8 more)

### Community 88 - "Monitor Info Impl"
Cohesion (internal edge density over full membership; size-biased): 0.20
Nodes (16 total, 14 shown after stub filtering): LazyMonitorInfo, .rect, .visibleRect, MonitorInfoImpl, .height, .width, NSScreen, .isMainScreen (+6 more)

### Community 89 - "Window Detected Tests"
Cohesion (internal edge density over full membership; size-biased): 0.14
Nodes (16 total, 6 shown after stub filtering): OnWindowDetectedTest, CGFloat, String, UInt32, TestWindow, .description

### Community 90 - "List Workspaces Args"
Cohesion (internal edge density over full membership; size-biased): 0.17
Nodes (16 total, 15 shown after stub filtering): FilteringOptions, ListWorkspacesCmdArgs, .format, MonitorId, all, focused, index, mouse (+7 more)

### Community 91 - "Volume Command Args"
Cohesion (internal edge density over full membership; size-biased): 0.14
Nodes (16 total, 14 shown after stub filtering): parseVolumeAction(), Bool, Int, Self, StrArrSlice, String, VolumeAction, down (+6 more)

### Community 92 - "Fork Release Workflow"
Cohesion (internal edge density over full membership; size-biased): 0.16
Nodes (15 total, 14 shown after stub filtering): Fork Contributing Guide, Fork vs Upstream Contribution Scope, Cutting A Release (tag, watch Actions, review tap PR), Fork-Owned Files (no upstream equivalent), Manual Release Fallback, Release Workflow (what fires on tag push), Release Tag Naming (SemVer pre-release chain), Fork Version Scheme (v<upstream>-Beta.adrianlsy.<n>) (+6 more)

### Community 93 - "Shared Parser Constraint"
Cohesion (internal edge density over full membership; size-biased): 0.13
Nodes (15 total, 13 shown after stub filtering): parseCommand Node Disambiguation (Test Helper vs Production), assertEquals Edge-Correctness Verdict, Cross-File INFERRED Downgrade (Swift Module-Scoped Visibility), Command Protocol Dual Fan-Out, Common Shared SPM Library Target, Import-Graph Bridge Artifact (Betweenness Inflation), Shared-Parser Constraint (Client Parse, Server Re-Parse), CmdArgs Protocol Bridge (+5 more)

### Community 94 - "Reload Config Command"
Cohesion (internal edge density over full membership; size-biased): 0.22
Nodes (15 total, 13 shown after stub filtering): failedToParseMsg(), parsedWithWarningsMsg(), reloadConfig_nonCancellable(), ReloadConfigResult, Bool, Int, String, URL (+5 more)

### Community 95 - "AX Dump Recursive"
Cohesion (internal edge density over full membership; size-biased): 0.19
Nodes (15 total, 13 shown after stub filtering): AXError, .repr, AxKind, app, button, window, AXUIElement, dumpAxRecursive() (+5 more)

### Community 96 - "Enable Command Args"
Cohesion (internal edge density over full membership; size-biased): 0.18
Nodes (15 total, 13 shown after stub filtering): EnableCmdArgs, parseEnableCmdArgs(), parseState(), State, off, on, toggle, Bool (+5 more)

### Community 97 - "Window Tree Diagram"
Cohesion (internal edge density over full membership; size-biased): 0.20
Nodes (14): Finder Window (active), h_tiles Layout (horizontal tiling), Horizontal Tiles Illustration (h_tiles.png), Terminal Window, Window Tree Model, Finder Window (Leaf), Google Chrome Window (Leaf), Horizontal Tiles (Root Node) (+6 more)

### Community 98 - "MRU Stack"
Cohesion (internal edge density over full membership; size-biased): 0.30
Nodes (14 total, 7 shown after stub filtering): IteratorProtocol, MruStack, .mostRecent, MruStackIterator, Node, Bool, T

### Community 99 - "Relative Monitor Resolution"
Cohesion (internal edge density over full membership; size-biased): 0.16
Nodes (14 total, 7 shown after stub filtering): Bool, Int, String, .monitorId_oneBased, Int, MonitorInfo, CGFloat

### Community 100 - "Recursive Layout Engine"
Cohesion (internal edge density over full membership; size-biased): 0.34
Nodes (14 total, 6 shown after stub filtering): LayoutContext, CGFloat, CGPoint, TilingContainer, Window, Workspace

### Community 101 - "Config Command Args"
Cohesion (internal edge density over full membership; size-biased): 0.16
Nodes (14 total, 13 shown after stub filtering): ConfigCmdArgs, .mode, Mode, allKeys, configPath, getKey, majorKeys, parseConfigCmdArgs() (+5 more)

### Community 102 - "Move Mouse Args"
Cohesion (internal edge density over full membership; size-biased): 0.19
Nodes (14 total, 12 shown after stub filtering): MouseTarget, monitorForceCenter, monitorLazyCenter, windowForceCenter, windowLazyCenter, MoveMouseCmdArgs, parseMouseTarget(), parseMoveMouseCmdArgs() (+4 more)

### Community 103 - "Command Pipeline & Rebase Docs"
Cohesion (internal edge density over full membership; size-biased): 0.17
Nodes (13 total, 11 shown after stub filtering): Client/Server Split (CLI client, app server over Unix socket), Command Pipeline (three-place command definition), Shared Arg-Parser Constraint (args re-parsed on server), Upstream Architecture Primer, Client/Server Interaction over Unix Socket, New Command Checklist, SPM Library + Xcode Launcher Infrastructure, move-workspace-to-display Validation Bypass (fixed in #5) (+3 more)

### Community 104 - "Good Monitor Arrangement"
Cohesion (internal edge density over full membership; size-biased): 0.27
Nodes (13): Monitor Arrangement 1 (Good) Diagram, Free Bottom-Corner Arrangement Rule, Good Left Corner (Free Bottom-Left Zone), Good Monitor Arrangement, Good Right Corner (Free Bottom-Right Zone), Hidden-Workspace Window Corner Stashing, Monitor 1, Monitor 2 (+5 more)

### Community 105 - "Volume HUD Panel"
Cohesion (internal edge density over full membership; size-biased): 0.18
Nodes (13 total, 10 shown after stub filtering): Float, Color, ColorScheme, String, VolumePanel, VolumeView, .barColor, .fontColor (+2 more)

### Community 106 - "CmdArgs Conformance Findings"
Cohesion (internal edge density over full membership; size-biased): 0.15
Nodes (13 total, 11 shown after stub filtering): CmdArgs Conformance Table (45 conformers), CmdArgs Node Fragmentation (patched; recurs after --force), Command Conformance Table (44 conformers), Extension-Scattering Pattern (Subsystem Verbs on Tree Nouns), implements-Edge Semantic Conflation, Three-Tier Behavior Organization, Command Pipeline Four-Place Consistency, exec-and-forget Grammar Exemption (+3 more)

### Community 107 - "Array Slice Utility"
Cohesion (internal edge density over full membership; size-biased): 0.31
Nodes (13 total, 8 shown after stub filtering): PartialRangeFrom, PartialRangeUpTo, .slice, Range<Int>, Bool, Int, Range, Self

### Community 108 - "Direction Enums"
Cohesion (internal edge density over full membership; size-biased): 0.18
Nodes (13 total, 10 shown after stub filtering): RawRepresentable, RawValue, CardinalOrDfsDirection, .allCases, dfsRelative, direction, .rawValue, DfsNextPrev (+2 more)

### Community 109 - "Layout Test DSL"
Cohesion (internal edge density over full membership; size-biased): 0.15
Nodes (13): LayoutDescription, floatingWindowsContainer, h_accordion, h_tiles, macosFullscreen, macosHiddeAppWindow, macosMinimized, macosPopupWindowsContainer (+5 more)

### Community 110 - "Run Callback Args"
Cohesion (internal edge density over full membership; size-biased): 0.19
Nodes (13 total, 11 shown after stub filtering): CallbackKind, onFocusChanged, onFocusedMonitorChanged, onWindowDetected, parseCallbackKind(), parseRunCallbackCmdArgs(), RunCallbackCmdArgs, Bool (+3 more)

### Community 111 - "Optional Extensions"
Cohesion (internal edge density over full membership; size-biased): 0.19
Nodes (13 total, 8 shown after stub filtering): Optional, .prettyDescription, F, Int, StaticString, String, T, Wrapped

### Community 112 - "Workspace To Monitor Args"
Cohesion (internal edge density over full membership; size-biased): 0.20
Nodes (12 total, 10 shown after stub filtering): Bool, Lateinit, MoveWorkspaceToMonitorCmdArgs, parseWorkspaceToMonitorCmdArgs(), CmdArgsCommonState, CmdParser, MonitorTarget, ParsedCmd (+2 more)

### Community 113 - "Code Generation Pipeline"
Cohesion (internal edge density over full membership; size-biased): 0.21
Nodes (12 total, 5 shown after stub filtering): Generated Code (must be committed, never hand-edited), Generated Files — Never Hand-Merge, generate.sh script, XCODEGEN_AEROSPACE_CODE_SIGN_IDENTITY, generate-cmd-help.sh script

### Community 114 - "Shell Test DSL"
Cohesion (internal edge density over full membership; size-biased): 0.24
Nodes (12 total, 6 shown after stub filtering): ExpressibleByExtendedGraphemeClusterLiteral, ExpressibleByStringLiteral, ExpressibleByUnicodeScalarLiteral, Shell, Self, String

### Community 115 - "Native Focus & Mouse Probes"
Cohesion (internal edge density over full membership; size-biased): 0.17
Nodes (12 total, 11 shown after stub filtering): isManipulatedWithMouse(), Bool, Window, movedObs(), AXUIElement, CFString, UnsafeMutableRawPointer, resizedObs() (+3 more)

### Community 116 - "Shared Arg Enums"
Cohesion (internal edge density over full membership; size-biased): 0.18
Nodes (12 total, 11 shown after stub filtering): Dimension, height, smart, smartOpposite, width, String, UInt, Units (+3 more)

### Community 117 - "Grammar & Rebase Protocol"
Cohesion (internal edge density over full membership; size-biased): 0.24
Nodes (11 total, 10 shown after stub filtering): build-shell-completion.sh script, Rebase, Don't Merge, Hand-Written Shell Lexer/Parser (ANTLR grammar retired), Expected Conflict Set, Post-Rebase Checks (test.sh + docs + completion not covered by CI), Rebase Protocol (fetch, rebase, test, force-with-lease), Upstream Sync Cadence (~20-commit rebase threshold), Rebase-Based Upstream Relationship (+2 more)

### Community 118 - "Tree Node Case Enums"
Cohesion (internal edge density over full membership; size-biased): 0.18
Nodes (11): ChildParentRelation, floatingWindow, macosNativeFullscreenWindow, macosNativeHiddenAppWindow, macosNativeMinimizedWindow, macosPopupWindow, rootTilingContainer, shimContainerRelation (+3 more)

### Community 119 - "Non-Leaf Node Kinds"
Cohesion (internal edge density over full membership; size-biased): 0.18
Nodes (11): NonLeafTreeNodeKind, floatingWindowsContainer, macosFullscreenWindowsContainer, macosHiddenAppsWindowsContainer, macosMinimizedWindowsContainer, macosPopupWindowsContainer, tilingContainer, workspace (+3 more)

### Community 120 - "Secure Input HUD"
Cohesion (internal edge density over full membership; size-biased): 0.25
Nodes (11 total, 8 shown after stub filtering): SecureInputPanel, SecureInputView, .body, .fontColor, Bool, Color, ColorScheme, close

### Community 121 - "AX Element Attributes"
Cohesion (internal edge density over full membership; size-biased): 0.20
Nodes (11 total, 8 shown after stub filtering): AXUIElement, Any, Attr, AxUiElementMock, Bool, CGWindowID, windowOrNil(), WindowIdAndAxUiElementMock

### Community 122 - "AX Dump Fixtures"
Cohesion (internal edge density over full membership; size-biased): 0.20
Nodes (10 total, 8 shown after stub filtering): AxUiElementMock, [String: Json], .isSynthetic, Attr, Bool, CGWindowID, URL, .isDirectory

### Community 123 - "Docs & Completion Build Scripts"
Cohesion (internal edge density over full membership; size-biased): 0.36
Nodes (10 total, 7 shown after stub filtering): build-man(), build-site(), cp-docs(), build-docs.sh script, create-marker(), lazy-download-zip-and-link-bin(), install-dep.sh script

### Community 124 - "Appearance & SwiftUI Views"
Cohesion (internal edge density over full membership; size-biased): 0.20
Nodes (10 total, 6 shown after stub filtering): Carbon, AppearanceTheme, .current, dark, light, SwiftUI

### Community 125 - "Frozen Tree Snapshots"
Cohesion (internal edge density over full membership; size-biased): 0.38
Nodes (10 total, 8 shown after stub filtering): CGPoint, moveFloatingWindow(), moveTilingWindow(), moveWithMouse(), swapWindows(), Bool, TilingContainer, Window

### Community 127 - "Array Extensions"
Cohesion (internal edge density over full membership; size-biased): 0.22
Nodes (10 total, 5 shown after stub filtering): Array, Bool, Int, Self, T

### Community 128 - "App Icon Design"
Cohesion (internal edge density over full membership; size-biased): 0.28
Nodes (9): AeroSpace App Icon, AeroSpace Docs Site Branding, macOS Traffic-Light Window Controls Motif, macOS Big Sur Squircle Icon Style, Window Management Operation Symbolism (close/minimize/zoom), AeroSpace App Icon, Icon Design Rationale: Window Controls Signal a Window Manager, macOS Big Sur Squircle Icon Convention (+1 more)

### Community 129 - "Bad Monitor Arrangement"
Cohesion (internal edge density over full membership; size-biased): 0.44
Nodes (9): Bad Left Corner (red, Monitor 2 bottom-left blocked by Monitor 1), Bad Monitor Arrangement Diagram (variant 1), Bad Right Corner (red, Monitor 2 bottom-right blocked by Monitor 3), Free Bottom-Corner Space Requirement (every monitor needs a free bottom corner to hide windows in), Good Left Corner (green, free space at Monitor 1 bottom-left), Good Right Corner (green, free space at Monitor 3 bottom-right), Monitor 1 (left monitor), Monitor 2 (center monitor with blocked corners) (+1 more)

### Community 130 - "Debug Windows Recording"
Cohesion (internal edge density over full membership; size-biased): 0.28
Nodes (9 total, 8 shown after stub filtering): debugWindowsIfRecording(), DebugWindowsState, notRecording, recording, recordingAborted, dumpWindowDebugInfo(), String, Window

### Community 131 - "Move Workspace Tests"
Cohesion (internal edge density over full membership; size-biased): 0.28
Nodes (9 total, 4 shown after stub filtering): MoveWorkspaceToMonitorCommandTest, parseMoveWorkspaceToMonitorTarget(), MonitorTarget, String

### Community 132 - "Subscribe Args Tests"
Cohesion (internal edge density over full membership; size-biased): 0.36
Nodes (9 total, 3 shown after stub filtering): SubscribeCmdArgsTest, parseSubscribeCmdArgs(), ParsedCmd

### Community 133 - "String Logical Segments"
Cohesion (internal edge density over full membership; size-biased): 0.25
Nodes (9 total, 7 shown after stub filtering): String, StringLogicalSegment, number, string, StringLogicalSegments, Int, String

### Community 134 - "Stacked Monitor Pitfall"
Cohesion (internal edge density over full membership; size-biased): 0.50
Nodes (8): Bad Left Corner Placement (red, blocks Monitor 1 bottom-left), Bad Right Corner Placement (red, blocks Monitor 1 bottom-right), Bad Monitor Arrangement 2 Diagram, Free Bottom Corner Requirement for Window Hiding, Good Right Corner Placement (green, bottom-aligned with Monitor 2), Monitor 1 (top stacked monitor), Monitor 2 (bottom stacked monitor), Proper Monitor Arrangement (guide.adoc section)

### Community 135 - "Collection Extensions"
Cohesion (internal edge density over full membership; size-biased): 0.32
Nodes (8 total, 4 shown after stub filtering): Index, Collection, Element, Int

### Community 136 - "Move Node Commands"
Cohesion (internal edge density over full membership; size-biased): 0.29
Nodes (8 total, 7 shown after stub filtering): MoveNodeToWorkspaceCmdArgs, MoveNodeToWorkspaceCommand, moveWindowToWorkspace(), Bool, Int, Window, Workspace

### Community 137 - "Sequence Patterns"
Cohesion (internal edge density over full membership; size-biased): 0.25
Nodes (8 total, 7 shown after stub filtering): OrderedCollections, Seq, SequencePattern, empty, many, one, two

### Community 138 - "Server Enablement Checks"
Cohesion (internal edge density over full membership; size-biased): 0.21
Nodes (8 total, 6 shown after stub filtering): Int, StaticString, String, NSApplication.ActivationPolicy, NSApplication, String

### Community 139 - "List Modes Args"
Cohesion (internal edge density over full membership; size-biased): 0.32
Nodes (8 total, 6 shown after stub filtering): ListModesCmdArgs, parseListModesCmdArgs(), Bool, ParsedCmd, Self, StrArrSlice

### Community 140 - "Split Command Args"
Cohesion (internal edge density over full membership; size-biased): 0.36
Nodes (8 total, 6 shown after stub filtering): parseSplitArg(), parseSplitCmdArgs(), SplitCmdArgs, ParsedCmd, Self, StrArrSlice

### Community 141 - "Swap Command Args"
Cohesion (internal edge density over full membership; size-biased): 0.32
Nodes (8 total, 6 shown after stub filtering): parseSwapCmdArgs(), SwapCmdArgs, Bool, ParsedCmd, Self, StrArrSlice

### Community 142 - "Subcommand Parser Registry"
Cohesion (internal edge density over full membership; size-biased): 0.36
Nodes (8 total, 5 shown after stub filtering): SubCommandParser, SubCommandParserProtocol, ParsedCmd, StrArrSlice, T

### Community 143 - "Nullable Wrapper"
Cohesion (internal edge density over full membership; size-biased): 0.25
Nodes (8 total, 7 shown after stub filtering): Nullable, .isNull, just, null, .valueOrNil, Bool, T

### Community 144 - "Config File Watcher"
Cohesion (internal edge density over full membership; size-biased): 0.29
Nodes (7 total, 5 shown after stub filtering): DispatchSourceFileSystemObject, ConfigFileWatcher, Int32, MainActor, URL

### Community 145 - "AX Thread Guard Findings"
Cohesion (internal edge density over full membership; size-biased): 0.29
Nodes (7 total, 4 shown after stub filtering): AX Threading Backbone (MacApp + RunLoopJob), Task.init Ban in Favor of Task.startUnstructured, Task-Local Token Guard Weakness, destroy()

### Community 146 - "Lazy Sequence Filters"
Cohesion (internal edge density over full membership; size-biased): 0.29
Nodes (7 total, 5 shown after stub filtering): LazyFilterSequence, LazyMapSequence, LazySequenceProtocol, Self, Unwrapped

### Community 147 - "Exec Env Config"
Cohesion (internal edge density over full membership; size-biased): 0.57
Nodes (7 total, 5 shown after stub filtering): ExecConfig, parseEnvVariables(), parseExecConfig(), RawExecConfig, String

### Community 148 - "App Entry Point"
Cohesion (internal edge density over full membership; size-biased): 0.33
Nodes (6 total, 5 shown after stub filtering): App, OpenWindowAction, AeroSpaceApp, .body, Scene

### Community 149 - "Completable Future"
Cohesion (internal edge density over full membership; size-biased): 0.47
Nodes (6 total, 3 shown after stub filtering): Dispatch, CompletableFuture, T

### Community 150 - "Collection Grouping Helpers"
Cohesion (internal edge density over full membership; size-biased): 0.33
Nodes (6 total, 3 shown after stub filtering): Group, Element, OrderedSet

### Community 151 - "JSON Encoder Defaults"
Cohesion (internal edge density over full membership; size-biased): 0.33
Nodes (6 total, 4 shown after stub filtering): JSONEncoder, .aeroSpaceDefault, Encodable, String

### Community 152 - "MainActor Isolation Checks"
Cohesion (internal edge density over full membership; size-biased): 0.33
Nodes (6 total, 4 shown after stub filtering): MainActor, StaticString, T, UInt

### Community 154 - "Env Variable Tests"
Cohesion (internal edge density over full membership; size-biased): 0.60
Nodes (5 total, 3 shown after stub filtering): String, testFailInterpolation(), testSucInterpolation()

### Community 157 - "Horizontal Accordion Diagram"
Cohesion (internal edge density over full membership; size-biased): 0.67
Nodes (4): Accordion Padding (Edge Slivers of Adjacent Windows), Focused Window Centered Between Accordion Neighbors, Horizontal Accordion Layout, Horizontal Accordion Layout Screenshot (htop in Alacritty)

### Community 158 - "Vertical Accordion Diagram"
Cohesion (internal edge density over full membership; size-biased): 0.83
Nodes (4): Accordion Padding (peeking edges of adjacent windows), Focused Window Prominence (focused window fills most of the screen), Vertical Accordion Screenshot (htop in terminal, macOS), Vertical Accordion Layout

### Community 159 - "TreeNode Bridge Findings"
Cohesion (internal edge density over full membership; size-biased): 0.50
Nodes (4): Distributed Class Body via Swift Extensions, Frozen Tree Snapshot Dependency, TreeNode Three Bridge Mechanisms, Centralized Contract vs Smeared Class Body

### Community 161 - "Start At Login"
Cohesion (internal edge density over full membership; size-biased): 0.67
Nodes (4 total, 3 shown after stub filtering): ServiceManagement, cleanupPlistFromPrevVersions(), syncStartAtLogin()

### Community 162 - "AX Element Mock"
Cohesion (internal edge density over full membership; size-biased): 0.50
Nodes (4 total, 3 shown after stub filtering): AxUiElementMock, .cast, AXUIElement

### Community 163 - "Activation Policy Helper"
Cohesion (internal edge density over full membership; size-biased): 0.50
Nodes (4 total, 3 shown after stub filtering): NSApplication.ActivationPolicy, .prettyDescription, String

### Community 164 - "Range Extensions"
Cohesion (internal edge density over full membership; size-biased): 0.50
Nodes (4 total, 3 shown after stub filtering): ClosedRange, Range, Self

### Community 166 - "Window Tree Membership"
Cohesion (internal edge density over full membership; size-biased): 0.67
Nodes (3): String, Window, windowIsntPartOfTree()

## Knowledge Gaps
- **656 isolated node(s):** `.workspace`, `.description`, `.failExitCode`, `.info`, `.windowId` (+651 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **22 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `Common` connect `Command Module Imports` to `Debug Windows Recording`, `Tray Menu & Status UI`, `Move Workspace Tests`, `Shell Lexer & Parser`, `Command Execution Core`, `Move Node Commands`, `Shell Execution & IO`, `Refresh Session Engine`, `Tree Node Containers`, `AX Thread Guard Findings`, `Cardinal Direction Moves`, `Exec Env Config`, `Config Parsing & Diagnostics`, `Format Variable Expansion`, `Test Assertion Helpers`, `Focus State Management`, `Test Suite Imports`, `Env Variable Tests`, `CLI Entry Point`, `MacWindow Lifecycle`, `Format Command Tests`, `AX Run Loop & Frames`, `Start At Login`, `AeroAny & App Abstraction`, `AX Element Mock`, `Frozen Tree Types`, `Monitor Description Parsing`, `Key Mapping & Presets`, `Unix Socket Connection`, `Per-Monitor Gaps Config`, `Hotkey Binding Config`, `Move Node Tests`, `Config Command Values`, `Config Root Model`, `Tree Node Binding`, `Workspace Model`, `Cross-File Import Hub`, `Window Detected Callbacks`, `Server Event Types`, `App Termination Handling`, `Menu Bar Actions`, `AX Accessibility Attributes`, `Shared Parser Constraint`, `Reload Config Command`, `AX Dump Recursive`, `Command Pipeline & Rebase Docs`, `CmdArgs Conformance Findings`, `Appearance & SwiftUI Views`, `Frozen Tree Snapshots`?**
  _High betweenness centrality (0.162) - this node is a cross-community bridge._
- **Why does `CmdArgs` connect `CmdArgs Protocol Core` to `Command Execution Core`, `Command Dispatch & Shell`, `List Modes Args`, `Arg Parser Framework`, `Split Command Args`, `Swap Command Args`, `Subcommand Parser Registry`, `Test Assertion Helpers`, `Boolean Flag Parsers`, `Specific Arg Parsing`, `AeroAny & App Abstraction`, `Workspace Command Args`, `Interpolated Arg Consumption`, `Monitor Target Args`, `Per-Monitor Gaps Config`, `Focus Direction Args`, `Layout Command Args`, `Test Command Args`, `Test & Test-Not Commands`, `Window Detected Callbacks`, `Fullscreen Command Args`, `List Windows Args`, `List Command Args`, `AX Accessibility Attributes`, `Refresh Session Events`, `List Workspaces Args`, `Volume Command Args`, `Shared Parser Constraint`, `Enable Command Args`, `Config Command Args`, `Move Mouse Args`, `Command Pipeline & Rebase Docs`, `CmdArgs Conformance Findings`, `Run Callback Args`, `Workspace To Monitor Args`?**
  _High betweenness centrality (0.097) - this node is a cross-community bridge._
- **Why does `Command` connect `Command Dispatch & Shell` to `Command Test Fixtures`, `CmdArgs Protocol Core`, `AeroAny & App Abstraction`, `Config Root Model`, `Exit Code Commands`, `Command Execution Core`, `Command Module Imports`, `Move Node Commands`, `Window Detected Callbacks`, `Per-Monitor Gaps Config`, `Shell Execution & IO`, `Refresh Session Engine`, `Cardinal Direction Moves`, `AX Accessibility Attributes`, `Config Parsing & Diagnostics`, `Hotkey Binding Config`, `Shared Parser Constraint`?**
  _High betweenness centrality (0.051) - this node is a cross-community bridge._
- **Are the 268 inferred relationships involving `assertEquals()` (e.g. with `checkAxDumpsRecursive()` and `.testBalanceSizesCommand()`) actually correct?**
  _`assertEquals()` has 268 INFERRED edges - model-reasoned connections that need verification._
- **Are the 207 inferred relationships involving `parseCommand()` (e.g. with `testParseCommandHelp()` and `testParseSingleCommandSucc()`) actually correct?**
  _`parseCommand()` has 207 INFERRED edges - model-reasoned connections that need verification._
- **What connects `.workspace`, `.description`, `.failExitCode` to the rest of the system?**
  _656 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Command Test Fixtures` be split into smaller, more focused modules?**
  _Cohesion score 0.04655113829425756 - nodes in this community are weakly interconnected._