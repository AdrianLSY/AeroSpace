# Graph Report - AeroSpace  (2026-08-20)

## Corpus Check
- 379 files · ~342,285 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 3611 nodes · 8497 edges · 191 communities (170 shown, 21 thin omitted)
- Extraction: 81% EXTRACTED · 19% INFERRED · 0% AMBIGUOUS · INFERRED: 1614 edges (avg confidence: 0.8)
- Token cost: 829,560 input · 38,130 output

## Community Hubs (Navigation)
- Command Test Fixtures
- Test Harness Setup
- List Command Args
- Layout Test DSL
- Optional Extensions
- Shell Test DSL
- Relative Monitor Resolution
- Window Frame Setting
- Thread Guarded Values
- Subscribe Args Tests
- AeroAny Type Erasure
- AX Dump Fixtures
- Echo Command Tests
- Move Node Args
- Array Extensions
- Debug Windows Recording
- Window Detection Binding
- List Windows Args
- Move Mouse Args
- Run Callback Args
- Trigger Binding Args
- String Logical Segments
- Collection Extensions
- Appearance Theme
- Node To Monitor
- Non-Leaf Node Kinds
- List Modes Args
- Workspace To Monitor
- Split Command Args
- Client-Server Protocol
- Swap Command Args
- Nullable Wrapper
- Lazy Sequence Filters
- Run Session Guard
- Completable Future
- Config File Watcher
- Sequence Patterns
- Move Mouse Command
- Test Commands
- AX Window Kind Tests
- Focus Monitor Tests
- Move Workspace Tests
- Split Command Tests
- Monitor Id Enum
- JSON Encoder Defaults
- MainActor Isolation Checks
- TreeNode Base Class
- Tiling Node Cases
- Container Auto-Flatten
- NonCopyable Wrapper
- Command Kind Registry
- Activation Policy Helper
- Activation Policy Tests
- Parsed Cmd Test Utils
- Emoji Detection
- AX Element Mock
- Join Args Helper
- Tree Node Containers
- Layout Parsing
- Argument Parser Combinators
- Command Execution Core
- Boolean Flag Parsers
- Shared Arg Enums
- MacApp AX Threading
- Shell Parser Tests
- Command Parse Results
- Format Command Tests
- Focus State Management
- Format Interpolation Vars
- Common Utility Extensions
- Window Layout Primitives
- Command Argument Structs
- Known Bundle IDs
- Frozen Tree Snapshots
- Shell Execution Env
- Refresh Session Engine
- Ordered JSON Model
- Format Variable Expansion
- Array Slice Utility
- CLI Entry Point
- Monitor Description Parsing
- Unix Socket Connection
- Config Parsing Tests
- Exit Code Commands
- Workspace Command Args
- MacWindow Lifecycle
- Broadcast Latch Async
- Config Command Values
- Cardinal Direction Moves
- Per-Monitor Gaps Config
- Tree Node Case Enums
- Command Parser Inputs
- Misc Command Args
- Shell Lexer & Parser
- Config Root Model
- Workspace Model
- Monitor Target Args
- AX Accessibility Attributes
- String Interpolation Tokens
- Format Primitives
- AX Subscriptions
- Menu Bar Actions
- Config Parse Diagnostics
- Refresh Session Events
- Window Detected Callbacks
- Rect Geometry
- Run Loop Jobs
- JSON Model
- Focus Command Args
- Message HUD View
- Result Extensions
- Non-Leaf Node Cases
- Fullscreen Command Args
- Hotkey Binding Config
- Move Node Tests
- Experimental UI Settings
- Resize Args Parsing
- Volume HUD Panel
- Tray Menu Model
- Move To Workspace
- Tiling Container Model
- CGPoint Offset Helpers
- Window Level Normalization
- Enum Table Parsing
- App Bundle Init
- Monitor Info Impl
- CLI Args Static Info
- Secure Input HUD
- Focus Command Logic
- Frozen Tree Types
- Volume Command Args
- Abstract App Model
- Menu Bar Label
- Test Command Results
- Command Stdin Tests
- AX Dump Recursive
- Enable Command Args
- Test Util Imports
- MRU Stack
- App Termination Handling
- Recursive Layout Engine
- Config Command Args
- DFS Direction Parsing
- Window Type Heuristics
- Tree Node Binding
- Scope Function Helpers
- Native Focus Mouse
- Focus Follows Mouse
- Env Variable Tests
- Start At Login
- Range Extensions
- Int Type Aliases
- GUI Message Dialog
- Test Assertions
- Build & Dev Scripts
- Test Suite Imports
- AX Trust Prompt
- Xcode Runner Selection
- SPM Package Manifest
- Clean Project Script
- Clean Xcode Script
- Publish Release Script
- Fork Publish Script
- Command Framework Imports
- Reset AX Permission
- ISSoundAdditions License
- Fork Docs & Guidance
- HotKey License
- TOMLDecoder License
- OpenSpec Workflow Skills
- Bad Monitor Arrangement
- Good Monitor Arrangement
- Window Tree Diagram
- Stacked Monitor Pitfall
- Horizontal Tiles Diagram
- Diagonal Monitor Arrangement
- Docs Site Icon
- App Icon Design
- Horizontal Accordion Diagram
- Vertical Accordion Diagram
- swift-collections License
- CI Release Pipeline

## God Nodes (most connected - your core abstractions)
1. `assertEquals()` - 291 edges
2. `parseCommand()` - 226 edges
3. `Common` - 158 edges
4. `TreeNode` - 75 edges
5. `CmdIo` - 74 edges
6. `CmdArgs` - 73 edges
7. `Command` - 69 edges
8. `OrderedJson` - 68 edges
9. `CmdEnv` - 64 edges
10. `assertTrue()` - 62 edges

## Surprising Connections (you probably didn't know these)
- `eval` --references--> `AeroSpace (i3-like tiling window manager for macOS)`  [EXTRACTED]
  Sources/Common/cmdArgs/cmdArgsManifest.swift → README.md
- `ConfigFileWatcher` --references--> `CLAUDE.md Project Guidance`  [EXTRACTED]
  Sources/AppBundle/config/ConfigFileWatcher.swift → CLAUDE.md
- `TreeNode` --references--> `CLAUDE.md Project Guidance`  [EXTRACTED]
  Sources/AppBundle/tree/TreeNode.swift → CLAUDE.md
- `CmdKind` --references--> `CLAUDE.md Project Guidance`  [EXTRACTED]
  Sources/Common/cmdArgs/cmdArgsManifest.swift → CLAUDE.md
- `Command` --references--> `CLAUDE.md Project Guidance`  [EXTRACTED]
  Sources/AppBundle/command/Command.swift → CLAUDE.md

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Bundled Dependencies with Permissive Licenses** — legal_readme_bundled_dependencies, legal_readme_hotkey, legal_readme_tomldecoder, legal_readme_swift_collections, legal_readme_issoundadditions [EXTRACTED 1.00]
- **Adding a CLI Command (all places that must change)** — claude_command_pipeline, dev_docs_architecture_command_checklist, grammar_commands_bnf_grammar_cli_grammar [EXTRACTED 1.00]
- **AeroSpace Window Tree Hierarchy** — docs_assets_tree_horizontal_tiles_root_node, docs_assets_tree_vertical_tiles_container, docs_assets_tree_sublime_text_window, docs_assets_tree_google_chrome_window, docs_assets_tree_finder_window, docs_assets_tree_terminal_active_window [EXTRACTED 1.00]
- **Fork Release Pipeline (tag to Homebrew tap)** — _github_workflows_release_adrianlsy_release, _github_workflows_release_adrianlsy_fork_tag_format, github_workflows_build_release_script, script_build_brew_cask_script, _github_workflows_release_adrianlsy_aerospace_adrianlsy_cask, _github_workflows_release_adrianlsy_homebrew_tap_repo [EXTRACTED 1.00]
- **Fork Release Pipeline (tag to tap and Pages)** — fork_version_scheme, dev_docs_fork_maintenance_tag_naming, dev_docs_fork_maintenance_release_workflow, dev_docs_fork_maintenance_tap_repo, dev_docs_fork_maintenance_docs_site_deployment [EXTRACTED 1.00]
- **Good Diagonal Monitor Arrangement Example** — docs_assets_monitor_arrangement_2_good_monitor_1, docs_assets_monitor_arrangement_2_good_monitor_2, docs_assets_monitor_arrangement_2_good_good_left_corner, docs_assets_monitor_arrangement_2_good_good_right_corner [EXTRACTED 1.00]
- **Three Monitors Arranged with Free Bottom Corners** — docs_assets_monitor_arrangement_1_good_monitor_1, docs_assets_monitor_arrangement_1_good_monitor_2, docs_assets_monitor_arrangement_1_good_monitor_3, docs_assets_monitor_arrangement_1_good_good_left_corner, docs_assets_monitor_arrangement_1_good_good_right_corner [EXTRACTED 1.00]
- **Horizontal Tiles Window Tree Example** — docs_assets_h_tiles_horizontal_tiles_root_node, docs_assets_h_tiles_finder_window, docs_assets_h_tiles_terminal_window [EXTRACTED 1.00]
- **Stacked Monitors with Corner Placement Annotations** — docs_assets_monitor_arrangement_2_bad_monitor_1, docs_assets_monitor_arrangement_2_bad_monitor_2, docs_assets_monitor_arrangement_2_bad_bad_left_corner, docs_assets_monitor_arrangement_2_bad_bad_right_corner, docs_assets_monitor_arrangement_2_bad_good_right_corner [EXTRACTED 1.00]
- **Store-Aware OpenSpec CLI Workflows** — _claude_commands_opsx_apply_workflow, _claude_commands_opsx_archive_workflow, _claude_commands_opsx_explore_workflow, _claude_commands_opsx_propose_workflow, _claude_commands_opsx_sync_workflow, _claude_commands_opsx_update_workflow, _claude_skills_openspec_apply_change_skill_workflow, _claude_skills_openspec_archive_change_skill_workflow, _claude_skills_openspec_explore_skill_workflow, _claude_skills_openspec_propose_skill_workflow, _claude_skills_openspec_sync_specs_skill_workflow, _claude_skills_openspec_update_change_skill_workflow, _claude_commands_opsx_apply_openspec_cli, _claude_commands_opsx_apply_store_selection [EXTRACTED 1.00]
- **Traffic-Light Colored Circles with Window-Operation Glyphs on a Squircle** — resources_assets_xcassets_appicon_appiconset_icon_app_icon, resources_assets_xcassets_appicon_appiconset_icon_traffic_light_motif, resources_assets_xcassets_appicon_appiconset_icon_window_management_semantics, resources_assets_xcassets_appicon_appiconset_icon_macos_squircle_convention [INFERRED 0.75]
- **Horizontal Accordion Layout Demonstration** — docs_assets_h_accordion_screenshot, docs_assets_h_accordion_horizontal_accordion_layout, docs_assets_h_accordion_accordion_padding, docs_assets_h_accordion_focused_window_centering [INFERRED 0.75]
- **macOS Window Controls Visual Metaphor** — docs_assets_icon_aerospace_app_icon, docs_assets_icon_macos_traffic_light_motif, docs_assets_icon_window_management_symbolism [INFERRED 0.75]
- **Monitor 2 Blocked Bottom Corners (bad arrangement scenario)** — docs_assets_monitor_arrangement_1_bad_monitor_1, docs_assets_monitor_arrangement_1_bad_monitor_2, docs_assets_monitor_arrangement_1_bad_monitor_3, docs_assets_monitor_arrangement_1_bad_bad_left_corner, docs_assets_monitor_arrangement_1_bad_bad_right_corner [INFERRED 0.75]
- **Vertical Accordion Layout Demonstration** — docs_assets_v_accordion_screenshot, docs_assets_v_accordion_vertical_accordion_layout, docs_assets_v_accordion_accordion_padding, docs_assets_v_accordion_focused_window_prominence [INFERRED 0.75]
- **Placements Illustrating the Free Bottom Corner Rule** — docs_assets_monitor_arrangement_2_bad_free_bottom_corner_requirement, docs_assets_monitor_arrangement_2_bad_bad_left_corner, docs_assets_monitor_arrangement_2_bad_bad_right_corner, docs_assets_monitor_arrangement_2_bad_good_right_corner [INFERRED 0.85]
- **Fork Issue Routing System** — _github_issue_template_config_contact_links, _github_issue_template_fork_bug_template, _github_issue_template_fork_feature_template, _github_issue_template_upstream_redirect_template, _github_issue_template_config_upstream_redirect_policy, _github_issue_template_config_upstream_aerospace_repo [INFERRED 0.95]

## Communities (191 total, 21 thin omitted)

### Community 0 - "Command Test Fixtures"
Cohesion (internal edge density over full membership; size-biased): 0.04
Nodes (117 total, 14 shown after stub filtering): FocusCommandTest, LayoutCommandTest, ListWindowsTest, ListWorkspacesTest, MoveCommandTest, ResizeCommandTest, SwapCommandTest, OnWindowDetectedTest (+6 more)

### Community 1 - "Test Harness Setup"
Cohesion (internal edge density over full membership; size-biased): 0.03
Nodes (86 total, 26 shown after stub filtering): BalanceSizesCommandTest, CloseCommandTest, ExecCommandTest, FalseCommandTest, FlattenWorkspaceTreeCommandTest, JoinWithCommandTest, ListAppsTest, ListModesTest (+18 more)

### Community 10 - "List Command Args"
Cohesion (internal edge density over full membership; size-biased): 0.06
Nodes (49 total, 44 shown after stub filtering): ListAppsCmdArgs, ListMonitorsCmdArgs, ListWindowsCmdArgs, FilteringOptions, ListWorkspacesCmdArgs, InterToken, getErrorIfFormatIsIncompatibleWithJson(), parseListAppsCmdArgs() (+36 more)

### Community 100 - "Layout Test DSL"
Cohesion (internal edge density over full membership; size-biased): 0.15
Nodes (13): LayoutDescription, floatingWindowsContainer, h_accordion, h_tiles, macosFullscreen, macosHiddeAppWindow, macosMinimized, macosPopupWindowsContainer (+5 more)

### Community 101 - "Optional Extensions"
Cohesion (internal edge density over full membership; size-biased): 0.19
Nodes (13 total, 8 shown after stub filtering): Optional, .prettyDescription, F, Int, StaticString, String, T, Wrapped

### Community 102 - "Shell Test DSL"
Cohesion (internal edge density over full membership; size-biased): 0.24
Nodes (12 total, 6 shown after stub filtering): Shell, ExpressibleByExtendedGraphemeClusterLiteral, ExpressibleByStringLiteral, ExpressibleByUnicodeScalarLiteral, Self, String

### Community 103 - "Relative Monitor Resolution"
Cohesion (internal edge density over full membership; size-biased): 0.22
Nodes (11 total, 6 shown after stub filtering): MonitorInfo, Bool, Int, String, .monitorId_oneBased, Int

### Community 104 - "Window Frame Setting"
Cohesion (internal edge density over full membership; size-biased): 0.33
Nodes (11 total, 7 shown after stub filtering): [UInt32: AxWindow], disableAnimations(), getAxRect(), setFrame(), CGPoint, CGSize, T

### Community 105 - "Thread Guarded Values"
Cohesion (internal edge density over full membership; size-biased): 0.24
Nodes (11 total, 7 shown after stub filtering): ThreadGuardedValue, AxAppThreadToken, destroy(), Value, .description, pid_t, String

### Community 106 - "Subscribe Args Tests"
Cohesion (internal edge density over full membership; size-biased): 0.27
Nodes (11 total, 4 shown after stub filtering): SubscribeCmdArgsTest, parseSubscribeCmdArgs(), ParsedCmd, StrArrSlice

### Community 107 - "AeroAny Type Erasure"
Cohesion (internal edge density over full membership; size-biased): 0.33
Nodes (11 total, 10 shown after stub filtering): AeroAny, Array, AXUIElement, CGFloat, CGPoint, Character, Int, String (+2 more)

### Community 108 - "AX Dump Fixtures"
Cohesion (internal edge density over full membership; size-biased): 0.20
Nodes (10 total, 8 shown after stub filtering): [String: Json], URL, AxUiElementMock, .isSynthetic, Attr, Bool, CGWindowID, .isDirectory

### Community 110 - "Move Node Args"
Cohesion (internal edge density over full membership; size-biased): 0.24
Nodes (10 total, 8 shown after stub filtering): MoveNodeToWorkspaceCmdArgs, parseMoveNodeToWorkspaceCmdArgs(), .useStdin, .wrapAround, Bool, ParsedCmd, Self, StrArrSlice

### Community 111 - "Array Extensions"
Cohesion (internal edge density over full membership; size-biased): 0.22
Nodes (10 total, 5 shown after stub filtering): Array, Bool, Int, Self, T

### Community 115 - "Debug Windows Recording"
Cohesion (internal edge density over full membership; size-biased): 0.28
Nodes (9 total, 8 shown after stub filtering): DebugWindowsState, debugWindowsIfRecording(), dumpWindowDebugInfo(), notRecording, recording, recordingAborted, String, Window

### Community 116 - "Window Detection Binding"
Cohesion (internal edge density over full membership; size-biased): 0.50
Nodes (9 total, 6 shown after stub filtering): Window, onWindowDetected(), tryOnWindowDetected(), unbindAndGetBindingDataForNewTilingWindow(), unbindAndGetBindingDataForNewWindow(), Workspace

### Community 117 - "List Windows Args"
Cohesion (internal edge density over full membership; size-biased): 0.25
Nodes (9 total, 8 shown after stub filtering): AeroObjKind, getAvailableInterVars(), parseWorkspaces(), app, monitor, window, workspace, .allCases

### Community 118 - "Move Mouse Args"
Cohesion (internal edge density over full membership; size-biased): 0.28
Nodes (9 total, 7 shown after stub filtering): MoveMouseCmdArgs, parseMouseTarget(), parseMoveMouseCmdArgs(), Bool, ParsedCmd, Self, StrArrSlice

### Community 119 - "Run Callback Args"
Cohesion (internal edge density over full membership; size-biased): 0.31
Nodes (9 total, 7 shown after stub filtering): RunCallbackCmdArgs, parseCallbackKind(), parseRunCallbackCmdArgs(), Bool, ParsedCmd, Self, StrArrSlice

### Community 120 - "Trigger Binding Args"
Cohesion (internal edge density over full membership; size-biased): 0.28
Nodes (9 total, 7 shown after stub filtering): TriggerBindingCmdArgs, parseTriggerBindingCmdArgs(), ParsedCmd, Self, StrArrSlice, String, .mode

### Community 121 - "String Logical Segments"
Cohesion (internal edge density over full membership; size-biased): 0.25
Nodes (9 total, 7 shown after stub filtering): String, StringLogicalSegment, StringLogicalSegments, number, string, Int, String

### Community 123 - "Collection Extensions"
Cohesion (internal edge density over full membership; size-biased): 0.32
Nodes (8 total, 4 shown after stub filtering): Collection, Index, Element, Int

### Community 124 - "Appearance Theme"
Cohesion (internal edge density over full membership; size-biased): 0.25
Nodes (8 total, 5 shown after stub filtering): AppearanceTheme, .current, dark, light, SwiftUI

### Community 125 - "Node To Monitor"
Cohesion (internal edge density over full membership; size-biased): 0.29
Nodes (8 total, 5 shown after stub filtering): MacosNativeFullscreenCommand, MoveNodeToMonitorCommand, windowIsntPartOfTree(), String, Window

### Community 126 - "Non-Leaf Node Kinds"
Cohesion (internal edge density over full membership; size-biased): 0.25
Nodes (8): NonLeafTreeNodeKind, floatingWindowsContainer, macosFullscreenWindowsContainer, macosHiddenAppsWindowsContainer, macosMinimizedWindowsContainer, macosPopupWindowsContainer, tilingContainer, workspace

### Community 127 - "List Modes Args"
Cohesion (internal edge density over full membership; size-biased): 0.32
Nodes (8 total, 6 shown after stub filtering): ListModesCmdArgs, parseListModesCmdArgs(), Bool, ParsedCmd, Self, StrArrSlice

### Community 128 - "Workspace To Monitor"
Cohesion (internal edge density over full membership; size-biased): 0.32
Nodes (8 total, 6 shown after stub filtering): MoveWorkspaceToMonitorCmdArgs, parseWorkspaceToMonitorCmdArgs(), Bool, ParsedCmd, Self, StrArrSlice

### Community 129 - "Split Command Args"
Cohesion (internal edge density over full membership; size-biased): 0.36
Nodes (8 total, 6 shown after stub filtering): SplitCmdArgs, parseSplitArg(), parseSplitCmdArgs(), ParsedCmd, Self, StrArrSlice

### Community 13 - "Client-Server Protocol"
Cohesion (internal edge density over full membership; size-biased): 0.07
Nodes (46 total, 27 shown after stub filtering): ServerEvent, ClientServerTest, ServerEventType, ClientRequest, ClientRequestData, CodingKeys, ServerAnswer, Codable (+19 more)

### Community 130 - "Swap Command Args"
Cohesion (internal edge density over full membership; size-biased): 0.32
Nodes (8 total, 6 shown after stub filtering): SwapCmdArgs, parseSwapCmdArgs(), Bool, ParsedCmd, Self, StrArrSlice

### Community 132 - "Nullable Wrapper"
Cohesion (internal edge density over full membership; size-biased): 0.25
Nodes (8 total, 7 shown after stub filtering): Nullable, .isNull, just, null, .valueOrNil, Bool, T

### Community 133 - "Lazy Sequence Filters"
Cohesion (internal edge density over full membership; size-biased): 0.29
Nodes (7 total, 5 shown after stub filtering): LazySequenceProtocol, LazyFilterSequence, LazyMapSequence, Self, Unwrapped

### Community 134 - "Run Session Guard"
Cohesion (internal edge density over full membership; size-biased): 0.29
Nodes (7 total, 5 shown after stub filtering): RunSessionGuard, .isServerEnabled, Int, StaticString, String

### Community 135 - "Completable Future"
Cohesion (internal edge density over full membership; size-biased): 0.47
Nodes (6 total, 3 shown after stub filtering): CompletableFuture, Dispatch, T

### Community 136 - "Config File Watcher"
Cohesion (internal edge density over full membership; size-biased): 0.40
Nodes (6 total, 4 shown after stub filtering): ConfigFileWatcher, syncConfigFileWatcher(), DispatchSourceFileSystemObject, Int32

### Community 139 - "Sequence Patterns"
Cohesion (internal edge density over full membership; size-biased): 0.33
Nodes (6): SequencePattern, Seq, empty, many, one, two

### Community 140 - "Move Mouse Command"
Cohesion (internal edge density over full membership; size-biased): 0.47
Nodes (6 total, 4 shown after stub filtering): MoveMouseCommand, moveMouse(), windowSubjectRectOrReportError(), CGPoint

### Community 141 - "Test Commands"
Cohesion (internal edge density over full membership; size-biased): 0.33
Nodes (6 total, 4 shown after stub filtering): TestCommand, TestNotCommand, Bool, Bool

### Community 143 - "AX Window Kind Tests"
Cohesion (internal edge density over full membership; size-biased): 0.33
Nodes (6 total, 3 shown after stub filtering): AxWindowKindTest, checkAxDumpsRecursive(), URL

### Community 144 - "Focus Monitor Tests"
Cohesion (internal edge density over full membership; size-biased): 0.40
Nodes (6 total, 3 shown after stub filtering): FocusMonitorCommandTest, parseFocusMonitorTarget(), String

### Community 145 - "Move Workspace Tests"
Cohesion (internal edge density over full membership; size-biased): 0.40
Nodes (6 total, 3 shown after stub filtering): MoveWorkspaceToMonitorCommandTest, parseMoveWorkspaceToMonitorTarget(), String

### Community 147 - "Monitor Id Enum"
Cohesion (internal edge density over full membership; size-biased): 0.33
Nodes (6): MonitorId, all, focused, index, mouse, Int

### Community 148 - "JSON Encoder Defaults"
Cohesion (internal edge density over full membership; size-biased): 0.33
Nodes (6 total, 4 shown after stub filtering): JSONEncoder, .aeroSpaceDefault, Encodable, String

### Community 149 - "MainActor Isolation Checks"
Cohesion (internal edge density over full membership; size-biased): 0.33
Nodes (6 total, 4 shown after stub filtering): MainActor, StaticString, T, UInt

### Community 15 - "TreeNode Base Class"
Cohesion (internal edge density over full membership; size-biased): 0.06
Nodes (44 total, 34 shown after stub filtering): NilTreeNode, TreeNode, TreeNodeUserDataKey, CGFloat, Any, Bool, String, T (+26 more)

### Community 152 - "Tiling Node Cases"
Cohesion (internal edge density over full membership; size-biased): 0.40
Nodes (5 total, 4 shown after stub filtering): TilingTreeNodeCases, Window, tilingContainer, window

### Community 16 - "Command Kind Registry"
Cohesion (internal edge density over full membership; size-biased): 0.05
Nodes (44): CmdKind, balanceSizes, closeAllWindowsButCurrent, config, debugWindows, echo, enable, eval (+36 more)

### Community 160 - "Activation Policy Helper"
Cohesion (internal edge density over full membership; size-biased): 0.50
Nodes (4 total, 3 shown after stub filtering): NSApplication.ActivationPolicy, .prettyDescription, String

### Community 161 - "Activation Policy Tests"
Cohesion (internal edge density over full membership; size-biased): 0.50
Nodes (4 total, 3 shown after stub filtering): NSApplication.ActivationPolicy, NSApplication, String

### Community 162 - "Parsed Cmd Test Utils"
Cohesion (internal edge density over full membership; size-biased): 0.50
Nodes (4): ParsedCmd, .cmdOrDie, .errorOrNil, T

### Community 166 - "AX Element Mock"
Cohesion (internal edge density over full membership; size-biased): 0.67
Nodes (3): AxUiElementMock, .cast, AXUIElement

### Community 17 - "Tree Node Containers"
Cohesion (internal edge density over full membership; size-biased): 0.07
Nodes (43 total, 35 shown after stub filtering): FloatingWindowsContainer, MacosFullscreenWindowsContainer, MacosHiddenAppsWindowsContainer, MacosMinimizedWindowsContainer, MacosPopupWindowsContainer, TreeNodeCases, Window, WindowParentCases (+27 more)

### Community 19 - "Argument Parser Combinators"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (42 total, 36 shown after stub filtering): ArgParser, PosArgParserContext, EvalCmdArgs, MoveCmdArgs, dashDashArg(), newMandatoryPosArgParser(), parseCardinalDirectionArg(), parseCardinalOrDfsDirection() (+28 more)

### Community 2 - "Command Execution Core"
Cohesion (internal edge density over full membership; size-biased): 0.05
Nodes (84 total, 41 shown after stub filtering): CmdIo, CmdIoForwardingStdin, CmdIoImpl, Command, BalanceSizesCommand, CloseAllWindowsButCurrentCommand, CloseCommand, DebugWindowsCommand (+33 more)

### Community 20 - "Boolean Flag Parsers"
Cohesion (internal edge density over full membership; size-biased): 0.08
Nodes (42 total, 34 shown after stub filtering): CloseAllWindowsButCurrentCmdArgs, CloseCmdArgs, LayoutCmdArgs, String, parseLayoutCmdArgs(), parseToggleBetween(), boolFlag(), constSubArgParserFun() (+26 more)

### Community 21 - "Shared Arg Enums"
Cohesion (internal edge density over full membership; size-biased): 0.06
Nodes (41 total, 36 shown after stub filtering): ExecConfig, RawExecConfig, LayoutDescription, FilteringOptions, WorkspaceFilter, Dimension, Units, EquatableNoop (+28 more)

### Community 22 - "MacApp AX Threading"
Cohesion (internal edge density over full membership; size-biased): 0.12
Nodes (41 total, 18 shown after stub filtering): MacApp, CancellationMode, .bundlePath, .execPath, .name, Bool, escaping, Int (+10 more)

### Community 23 - "Shell Parser Tests"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (41 total, 5 shown after stub filtering): ShellLexerTest, ShellParserTest, assertFail(), assertSucc(), F

### Community 24 - "Command Parse Results"
Cohesion (internal edge density over full membership; size-biased): 0.08
Nodes (37 total, 25 shown after stub filtering): ParsedCmd, CmdParsingFailure, SubCommandParser, SubCommandParserProtocol, initSubcommands(), failure, isResizeNegativeUnitsArg(), cmd (+17 more)

### Community 25 - "Format Command Tests"
Cohesion (internal edge density over full membership; size-biased): 0.10
Nodes (38 total, 11 shown after stub filtering): FormatTest, FormatVar, assertPrimitive(), StaticString, UInt, app, .kind, monitor (+3 more)

### Community 26 - "Focus State Management"
Cohesion (internal edge density over full membership; size-biased): 0.10
Nodes (36 total, 26 shown after stub filtering): Window, EffectiveLeaf, FrozenFocus, LiveFocus, Window, Workspace, checkOnFocusChangedCallbacks_nonCancellable(), onFocusChanged() (+18 more)

### Community 27 - "Format Interpolation Vars"
Cohesion (internal edge density over full membership; size-biased): 0.07
Nodes (36 total, 33 shown after stub filtering): AppFormatVar, InterVar, MonitorFormatVar, PlainInterVar, WindowFormatVar, WorkspaceFormatVar, appBundleId, appBundlePath (+25 more)

### Community 28 - "Common Utility Extensions"
Cohesion (internal edge density over full membership; size-biased): 0.10
Nodes (35 total, 17 shown after stub filtering): MainActor, Comparable, Sequence, dieT(), Group, .run, .withIndex, Double (+9 more)

### Community 29 - "Window Layout Primitives"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (35 total, 22 shown after stub filtering): LayoutReason, Window, getDefaultConfigUrlFromProject(), check(), die(), URL, .cases, macos (+14 more)

### Community 3 - "Command Argument Structs"
Cohesion (internal edge density over full membership; size-biased): 0.03
Nodes (75 total, 49 shown after stub filtering): BalanceSizesCmdArgs, DebugWindowsCmdArgs, ExecAndForgetCmdArgs, FalseCmdArgs, FlattenWorkspaceTreeCmdArgs, FocusBackAndForthCmdArgs, ListExecEnvVarsCmdArgs, MacosNativeMinimizeCmdArgs (+41 more)

### Community 30 - "Known Bundle IDs"
Cohesion (internal edge density over full membership; size-biased): 0.06
Nodes (35 total, 34 shown after stub filtering): KnownBundleId, _1password, activityMonitor, alacritty, braveBrowser, chrome, cleanshotx, codex (+26 more)

### Community 31 - "Frozen Tree Snapshots"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (35 total, 29 shown after stub filtering): CGPoint, FrozenMonitor, FrozenWorkspace, FrozenWorld, movedObs(), moveFloatingWindow(), moveTilingWindow(), moveWithMouse() (+21 more)

### Community 32 - "Shell Execution Env"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (34 total, 26 shown after stub filtering): CmdEnv, Shell, runShellAnd(), runShellOr(), runShellPipe(), runShellSeq(), zipIfCountsAreEqual(), C1 (+18 more)

### Community 33 - "Refresh Session Engine"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (34 total, 26 shown after stub filtering): GlobalObserver, OptimalHideCorner, updateFocusCache(), layoutWorkspaces(), normalizeContainers(), refreshModel_nonCancellable(), refreshObs(), runHeavyCompleteRefreshSession() (+18 more)

### Community 34 - "Ordered JSON Model"
Cohesion (internal edge density over full membership; size-biased): 0.06
Nodes (34 total, 30 shown after stub filtering): OrderedJson, TomlType, OrderedCollections, array, .asArrayOrNil, .asBoolOrNil, .asDictOrNil, .asInt64OrNil (+22 more)

### Community 35 - "Format Variable Expansion"
Cohesion (internal edge density over full membership; size-biased): 0.11
Nodes (34 total, 26 shown after stub filtering): AeroObj, Cell, InterVarExpansionError, WindowWithPrefetchedTitle, toLayoutResult(), toLayoutString(), unknownInterpolationVariable(), app (+18 more)

### Community 36 - "Array Slice Utility"
Cohesion (internal edge density over full membership; size-biased): 0.14
Nodes (32 total, 20 shown after stub filtering): Array, ArrSlice, ArrSliceIterator, Range<Int>, .slice, ExpressibleByArrayLiteral, PartialRangeFrom, PartialRangeUpTo (+12 more)

### Community 37 - "CLI Entry Point"
Cohesion (internal edge density over full membership; size-biased): 0.11
Nodes (31 total, 24 shown after stub filtering): Main, Bool, Int, [String], URL, hasStdin(), run(), runSubscribe() (+16 more)

### Community 38 - "Monitor Description Parsing"
Cohesion (internal edge density over full membership; size-biased): 0.10
Nodes (30 total, 21 shown after stub filtering): MonitorDescription, Regex, CaseInsensitiveRegex, String, parseCasInsensitiveRegex(), parseMonitorDescription(), parseMonitorDescriptions(), parseWorkspaceToMonitorAssignment() (+13 more)

### Community 39 - "Unix Socket Connection"
Cohesion (internal edge density over full membership; size-biased): 0.15
Nodes (29 total, 18 shown after stub filtering): Subscriber, InitConnectionError, IsDone, NWConnection, newConnection(), startUnixSocketServer(), toggleReleaseServerIfDebug(), handleSubscribeAndWaitTillError() (+10 more)

### Community 4 - "Config Parsing Tests"
Cohesion (internal edge density over full membership; size-biased): 0.08
Nodes (64 total, 5 shown after stub filtering): ConfigCommandTest, ConfigTest, ParseEnvVariablesTest, parseConfig(), assertEquals()

### Community 40 - "Exit Code Commands"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (29 total, 20 shown after stub filtering): ExecAndForgetCommand, FalseCommand, FlattenWorkspaceTreeCommand, TrueCommand, BinaryExitCode, ConditionalExitCode, ExitCode, IoSideEffect (+12 more)

### Community 41 - "Workspace Command Args"
Cohesion (internal edge density over full membership; size-biased): 0.10
Nodes (29 total, 21 shown after stub filtering): SummonWorkspaceCmdArgs, WorkspaceCmdArgs, WorkspaceTarget, WorkspaceName, parseWorkspaceName(), parseWorkspaceCmdArgs(), parseWorkspaceTarget(), Bool (+13 more)

### Community 42 - "MacWindow Lifecycle"
Cohesion (internal edge density over full membership; size-biased): 0.13
Nodes (28 total, 11 shown after stub filtering): MacWindow, refresh(), .allWindows, .isHiddenInCorner, Bool, CGFloat, CGPoint, CGSize (+3 more)

### Community 43 - "Broadcast Latch Async"
Cohesion (internal edge density over full membership; size-biased): 0.19
Nodes (27 total, 12 shown after stub filtering): AwaitableOneTimeBroadcastLatch, AwaitableOneTimeBroadcastLatchTest, Task, CheckedContinuation, isolated, Error, Error, StaticString (+4 more)

### Community 44 - "Config Command Values"
Cohesion (internal edge density over full membership; size-biased): 0.12
Nodes (27 total, 19 shown after stub filtering): ConfigCommand, ConfigMapValue, ConfigScalarValue, Shell<any Command>, String, buildConfigMap(), getKey(), Encodable (+11 more)

### Community 45 - "Cardinal Direction Moves"
Cohesion (internal edge density over full membership; size-biased): 0.14
Nodes (27 total, 24 shown after stub filtering): MoveCommand, CardinalDirection, createImplicitContainerAndMoveWindow(), deepMoveIn(), hitAllMonitorsOuterFrameBoundaries(), hitWorkspaceBoundaries(), moveOut(), shouldFailBecauseFullscreen_nonCancellable() (+16 more)

### Community 46 - "Per-Monitor Gaps Config"
Cohesion (internal edge density over full membership; size-biased): 0.16
Nodes (27 total, 20 shown after stub filtering): DynamicConfigValue, PerMonitorValue, ConfigParserContext, Gaps, Inner, Outer, ResolvedGaps, parseDynamicValue() (+12 more)

### Community 47 - "Tree Node Case Enums"
Cohesion (internal edge density over full membership; size-biased): 0.10
Nodes (27 total, 22 shown after stub filtering): ChildParentRelation, NonLeafTreeNodeObject, TilingContainer, TilingContainer, getChildParentRelation(), getChildParentRelationOrNil(), illegalChildParentRelation(), floatingWindow (+14 more)

### Community 48 - "Command Parser Inputs"
Cohesion (internal edge density over full membership; size-biased): 0.14
Nodes (27 total, 19 shown after stub filtering): Set, ArgParserProtocol, ArgParserInput, PosArgParserInput, String, SubArgParserInput, SubscribeCmdArgs, CmdParser (+11 more)

### Community 49 - "Misc Command Args"
Cohesion (internal edge density over full membership; size-biased): 0.08
Nodes (27 total, 20 shown after stub filtering): EchoCmdArgs, JoinWithCmdArgs, ModeCmdArgs, Lateinit, consumeWholeArrayOfInterpolatedPosArgs(), consumeStrCliArg(), Bool, Self (+12 more)

### Community 5 - "Shell Lexer & Parser"
Cohesion (internal edge density over full membership; size-biased): 0.07
Nodes (63 total, 48 shown after stub filtering): Char, Character, LexerToken, Location, Payload, State, String, WordKind (+40 more)

### Community 50 - "Config Root Model"
Cohesion (internal edge density over full membership; size-biased): 0.10
Nodes (26 total, 22 shown after stub filtering): Config, ConfigVersion, DefaultContainerOrientation, FocusFollowsMouse, ConvenienceMutable, parseFocusFollowsMouse(), Mode, _1 (+14 more)

### Community 51 - "Workspace Model"
Cohesion (internal edge density over full membership; size-biased): 0.13
Nodes (26 total, 17 shown after stub filtering): CGPoint, Workspace, gcMonitors(), getStubWorkspace(), isValidAssignment(), rearrangeWorkspacesOnMonitors(), .activeWorkspace, Bool (+9 more)

### Community 52 - "Monitor Target Args"
Cohesion (internal edge density over full membership; size-biased): 0.10
Nodes (26 total, 22 shown after stub filtering): FocusMonitorCmdArgs, MonitorTarget, MoveNodeToMonitorCmdArgs, parseFocusMonitorCmdArgs(), parseMonitorTarget(), parseMoveNodeToMonitorCmdArgs(), .cases, .casesExceptPatterns (+14 more)

### Community 53 - "AX Accessibility Attributes"
Cohesion (internal edge density over full membership; size-biased): 0.12
Nodes (25 total, 21 shown after stub filtering): Ax, AXUIElement, ReadableAttr, ReadableAttrImpl, WritableAttr, WritableAttrImpl, castToAxUiElementMock(), resetAccessibility() (+13 more)

### Community 54 - "String Interpolation Tokens"
Cohesion (internal edge density over full membership; size-biased): 0.10
Nodes (25 total, 16 shown after stub filtering): Array, InterpolationParserState, String, Error, LocalizedError, RawStringInterToken, split, interpolationCharEncountered (+8 more)

### Community 55 - "Format Primitives"
Cohesion (internal edge density over full membership; size-biased): 0.08
Nodes (25 total, 14 shown after stub filtering): Kind, Primitive, int, bool, int, string, bool, .kind (+6 more)

### Community 57 - "AX Subscriptions"
Cohesion (internal edge density over full membership; size-biased): 0.14
Nodes (24 total, 13 shown after stub filtering): AxWindow, AXObserver, AxSubscription, NSRunningApplication, AXObserverCallback, HandlerToNotifKeyMapping, AXUIElement, pid_t (+5 more)

### Community 58 - "Menu Bar Actions"
Cohesion (internal edge density over full membership; size-biased): 0.13
Nodes (24 total, 21 shown after stub filtering): ConfigFile, ReloadConfigCmdArgs, findCustomConfigUrl(), getTextEditorToOpenConfig(), menuBar(), openConfigButton(), reloadConfigButton(), shortcutGroup() (+13 more)

### Community 6 - "Config Parse Diagnostics"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (58 total, 49 shown after stub filtering): ConfigBacktrace, ConfigParseDiagnostic, ParseConfigResult, ParsedCmd, ReadConfigResult, ResOrStr, Severity, TomlBacktraceItem (+41 more)

### Community 60 - "Refresh Session Events"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (22 total, 20 shown after stub filtering): UniqueToken, RefreshSessionEvent, CustomStringConvertible, Hasher, String, .description, ax, configAutoReload (+12 more)

### Community 61 - "Window Detected Callbacks"
Cohesion (internal edge density over full membership; size-biased): 0.13
Nodes (23 total, 21 shown after stub filtering): LegacyWindowDetectedCallbackMatcher, WindowDetectedCallback, WindowDetectedCallbackMatcher, expectedActualTypeError(), parseCommand(), parseMatcher(), parseOnWindowDetectedArray(), parseWindowDetectedCallback() (+13 more)

### Community 62 - "Rect Geometry"
Cohesion (internal edge density over full membership; size-biased): 0.13
Nodes (23 total, 17 shown after stub filtering): CGRect, Rect, .bottomLeftCorner, .bottomRightCorner, .center, .height, .maxX, .maxY (+9 more)

### Community 63 - "Run Loop Jobs"
Cohesion (internal edge density over full membership; size-biased): 0.18
Nodes (22 total, 11 shown after stub filtering): RunLoopAction, RunLoopJob, Thread, NSObject, .isCancelled, Bool, escaping, Int32 (+3 more)

### Community 64 - "JSON Model"
Cohesion (internal edge density over full membership; size-biased): 0.11
Nodes (22 total, 17 shown after stub filtering): Json, array, .asDictOrDie, .asDictOrNil, .asInt64OrNil, bool, dict, null (+9 more)

### Community 65 - "Focus Command Args"
Cohesion (internal edge density over full membership; size-biased): 0.13
Nodes (22 total, 20 shown after stub filtering): FocusCmdArgs, FocusCmdTarget, parseBoundaries(), parseBoundariesAction(), parseFocusCmdArgs(), .boundaries, .boundariesAction, .target (+12 more)

### Community 66 - "Message HUD View"
Cohesion (internal edge density over full membership; size-biased): 0.14
Nodes (21 total, 16 shown after stub filtering): AeroSpaceApp, Message, MessageModel, MessageType, MessageView, getMessageWindow(), App, DismissAction (+8 more)

### Community 67 - "Result Extensions"
Cohesion (internal edge density over full membership; size-biased): 0.14
Nodes (21 total, 13 shown after stub filtering): [AeroObj], Result, Bool, String, .failureOrNil, .isSuccess, Bool, Failure (+5 more)

### Community 68 - "Non-Leaf Node Cases"
Cohesion (internal edge density over full membership; size-biased): 0.10
Nodes (21 total, 20 shown after stub filtering): ConventionalWindowParentCases, NonLeafTreeNodeCases, TilingContainerParentCases, Bool, floatingWindowsContainer, .floatingWindowsContainerOrNil, tilingContainer, .tilingContainerOrNil (+12 more)

### Community 69 - "Fullscreen Command Args"
Cohesion (internal edge density over full membership; size-biased): 0.12
Nodes (21 total, 17 shown after stub filtering): FullscreenCmdArgs, MacosNativeFullscreenCmdArgs, ToggleEnum, parseFullscreenCmdArgs(), parseMacosNativeFullscreenCmdArgs(), parseToggleEnum(), Bool, ParsedCmd (+9 more)

### Community 7 - "Hotkey Binding Config"
Cohesion (internal edge density over full membership; size-biased): 0.07
Nodes (52 total, 40 shown after stub filtering): HotKey, HotkeyBinding, Key, NSEvent.ModifierFlags, Mode, KeyMapping, Preset, Dictionary (+32 more)

### Community 70 - "Move Node Tests"
Cohesion (internal edge density over full membership; size-biased): 0.11
Nodes (20 total, 4 shown after stub filtering): MoveNodeToWorkspaceCommandTest, MoveNodeToWorkspaceCmdArgs, Bool, String

### Community 71 - "Experimental UI Settings"
Cohesion (internal edge density over full membership; size-biased): 0.13
Nodes (19 total, 18 shown after stub filtering): ExperimentalUISettings, ExperimentalUISettingsItems, MenuBarStyle, MenuBarStyleButton, getExperimentalUISettingsMenu(), Identifiable, .displayStyle, displayStyle (+10 more)

### Community 73 - "Resize Args Parsing"
Cohesion (internal edge density over full membership; size-biased): 0.19
Nodes (19 total, 12 shown after stub filtering): ResizeCmdArgs, ParsedCliArgs, parseDimension(), parseResizeCmdArgs(), parseUnits(), ParsedCmd, Self, StrArrSlice (+4 more)

### Community 74 - "Volume HUD Panel"
Cohesion (internal edge density over full membership; size-biased): 0.13
Nodes (18 total, 12 shown after stub filtering): NSPanelHud, VolumePanel, VolumeView, Float, NSPanel, Color, ColorScheme, String (+4 more)

### Community 75 - "Tray Menu Model"
Cohesion (internal edge density over full membership; size-biased): 0.20
Nodes (18 total, 16 shown after stub filtering): AxPermissionStatus, TrayItem, TrayItemType, TrayMenuModel, WorkspaceViewModel, updateTrayText(), Hashable, granted (+8 more)

### Community 76 - "Move To Workspace"
Cohesion (internal edge density over full membership; size-biased): 0.12
Nodes (18 total, 14 shown after stub filtering): MoveNodeToWorkspaceCommand, WorkspaceBackAndForthCommand, WorkspaceCommand, moveWindowToWorkspace(), getNextPrevWorkspace(), MoveNodeToWorkspaceCmdArgs, Bool, Int (+6 more)

### Community 77 - "Tiling Container Model"
Cohesion (internal edge density over full membership; size-biased): 0.15
Nodes (18 total, 11 shown after stub filtering): TilingContainer, Orientation, Bool, CGFloat, Int, .isRootContainer, .orientation, Double (+3 more)

### Community 78 - "CGPoint Offset Helpers"
Cohesion (internal edge density over full membership; size-biased): 0.16
Nodes (18 total, 10 shown after stub filtering): CGFloat, CGPoint, .body, .monitorApproximation, .vectorLength, .withYAxisFlipped, CGFloat, ClosedRange (+2 more)

### Community 79 - "Window Level Normalization"
Cohesion (internal edge density over full membership; size-biased): 0.16
Nodes (17 total, 13 shown after stub filtering): MacOsWindowLevel, exitMacOsNativeUnconventionalState(), normalizeLayoutReason(), validateStillPopups(), getWindowLevel(), CoreGraphics, Window, Workspace (+5 more)

### Community 8 - "Enum Table Parsing"
Cohesion (internal edge density over full membership; size-biased): 0.05
Nodes (52 total, 48 shown after stub filtering): OrderedJson.JsonDict, Parser, ParserProtocol, Boundaries, WhenBoundariesCrossed, Kind, Boundaries, WhenBoundariesCrossed (+40 more)

### Community 80 - "App Bundle Init"
Cohesion (internal edge density over full membership; size-biased): 0.21
Nodes (17 total, 15 shown after stub filtering): ReloadConfigResult, ServerArgs, failedToParseMsg(), parsedWithWarningsMsg(), reloadConfig_nonCancellable(), bootstrapConfig_nonCancellable(), initAppBundle(), initServerArgs() (+7 more)

### Community 81 - "Monitor Info Impl"
Cohesion (internal edge density over full membership; size-biased): 0.20
Nodes (17 total, 14 shown after stub filtering): LazyMonitorInfo, MonitorInfoImpl, NSScreen, .rect, .visibleRect, .height, .width, .isMainScreen (+6 more)

### Community 82 - "CLI Args Static Info"
Cohesion (internal edge density over full membership; size-biased): 0.16
Nodes (16 total, 13 shown after stub filtering): CmdArgs, CmdStaticInfo, parseCmdArgs(), .description, .failExitCode, .info, .windowId, .workspaceName (+5 more)

### Community 83 - "Secure Input HUD"
Cohesion (internal edge density over full membership; size-biased): 0.17
Nodes (16 total, 11 shown after stub filtering): SecureInputPanel, SecureInputView, Carbon, MainActor, URL, .body, .fontColor, Bool (+3 more)

### Community 84 - "Focus Command Logic"
Cohesion (internal edge density over full membership; size-biased): 0.23
Nodes (16 total, 13 shown after stub filtering): FloatingWindowData, FocusCommand, hitAllMonitorsOuterFrameBoundaries(), hitWorkspaceBoundaries(), makeFloatingWindowsSeenAsTiling(), restoreFloatingWindows(), wrapAroundTheWorkspace(), CGFloat (+5 more)

### Community 85 - "Frozen Tree Types"
Cohesion (internal edge density over full membership; size-biased): 0.18
Nodes (16 total, 13 shown after stub filtering): FrozenContainer, FrozenTreeNode, FrozenWindow, Layout, getWeightOrNil(), container, window, CGFloat (+5 more)

### Community 86 - "Volume Command Args"
Cohesion (internal edge density over full membership; size-biased): 0.14
Nodes (16 total, 14 shown after stub filtering): VolumeAction, VolumeCmdArgs, parseVolumeAction(), Bool, Int, Self, StrArrSlice, String (+6 more)

### Community 87 - "Abstract App Model"
Cohesion (internal edge density over full membership; size-biased): 0.14
Nodes (15 total, 11 shown after stub filtering): AbstractApp, Window, TestApp, AnyObject, Hasher, .macAppUnsafe, Int32, String (+3 more)

### Community 88 - "Menu Bar Label"
Cohesion (internal edge density over full membership; size-biased): 0.28
Nodes (15 total, 9 shown after stub filtering): MenuBarLabel, Font, .body, .finalColor, .menuBarContent, .squares, Color, ColorScheme (+1 more)

### Community 89 - "Test Command Results"
Cohesion (internal edge density over full membership; size-biased): 0.31
Nodes (15 total, 3 shown after stub filtering): CmdResult, TestCommandTest, Int32ExitCode

### Community 9 - "Command Stdin Tests"
Cohesion (internal edge density over full membership; size-biased): 0.07
Nodes (50 total, 6 shown after stub filtering): CmdStdin, EvalCommandTest, WorkspaceCommandTest, ShellRunTest, assertTrue(), .emptyStdin

### Community 90 - "AX Dump Recursive"
Cohesion (internal edge density over full membership; size-biased): 0.19
Nodes (15 total, 13 shown after stub filtering): AXError, AxKind, AXUIElement, dumpAxRecursive(), prettyValue(), .repr, app, button (+5 more)

### Community 91 - "Enable Command Args"
Cohesion (internal edge density over full membership; size-biased): 0.18
Nodes (15 total, 13 shown after stub filtering): EnableCmdArgs, State, parseEnableCmdArgs(), parseState(), off, on, toggle, Bool (+5 more)

### Community 92 - "Test Util Imports"
Cohesion (internal edge density over full membership; size-biased): 0.14
Nodes (14 total, 4 shown after stub filtering): Bool, balance(), Foundation, TilingContainer

### Community 93 - "MRU Stack"
Cohesion (internal edge density over full membership; size-biased): 0.30
Nodes (14 total, 7 shown after stub filtering): MruStack, MruStackIterator, Node, IteratorProtocol, .mostRecent, Bool, T

### Community 94 - "App Termination Handling"
Cohesion (internal edge density over full membership; size-biased): 0.16
Nodes (14 total, 10 shown after stub filtering): AppServerTerminationHandler, String, TerminationHandler, checkCancellation(), initTerminationHandler(), interceptTermination(), terminateApp(), os (+2 more)

### Community 95 - "Recursive Layout Engine"
Cohesion (internal edge density over full membership; size-biased): 0.34
Nodes (14 total, 6 shown after stub filtering): LayoutContext, TilingContainer, Window, Workspace, CGFloat, CGPoint

### Community 96 - "Config Command Args"
Cohesion (internal edge density over full membership; size-biased): 0.16
Nodes (14 total, 13 shown after stub filtering): ConfigCmdArgs, Mode, parseConfigCmdArgs(), .mode, allKeys, configPath, getKey, majorKeys (+5 more)

### Community 97 - "DFS Direction Parsing"
Cohesion (internal edge density over full membership; size-biased): 0.18
Nodes (13 total, 10 shown after stub filtering): CardinalOrDfsDirection, DfsNextPrev, RawRepresentable, RawValue, .allCases, dfsRelative, direction, .rawValue (+2 more)

### Community 98 - "Window Type Heuristics"
Cohesion (internal edge density over full membership; size-biased): 0.26
Nodes (13 total, 7 shown after stub filtering): AxUiElementMock, AxUiElementWindowType, dialog, popup, window, Bool, NSApplication

### Community 99 - "Tree Node Binding"
Cohesion (internal edge density over full membership; size-biased): 0.26
Nodes (13 total, 4 shown after stub filtering): BindingData, CGFloat, Int, Workspace

### Community 131 - "Scope Function Helpers"
Cohesion (internal edge density over full membership; size-biased): 0.29
Nodes (8 total, 4 shown after stub filtering): Bool, R, Self, Void

### Community 142 - "Native Focus Mouse"
Cohesion (internal edge density over full membership; size-biased): 0.33
Nodes (6 total, 5 shown after stub filtering): getNativeFocusedWindow(), isManipulatedWithMouse(), Window, Bool, Window

### Community 153 - "Focus Follows Mouse"
Cohesion (internal edge density over full membership; size-biased): 0.50
Nodes (5 total, 4 shown after stub filtering): isAxWindowUnderMouse(), syncFocusFollowsMouse(), Bool, CGPoint

### Community 155 - "Env Variable Tests"
Cohesion (internal edge density over full membership; size-biased): 0.60
Nodes (5 total, 3 shown after stub filtering): testFailInterpolation(), testSucInterpolation(), String

### Community 159 - "Start At Login"
Cohesion (internal edge density over full membership; size-biased): 0.67
Nodes (4 total, 3 shown after stub filtering): cleanupPlistFromPrevVersions(), syncStartAtLogin(), ServiceManagement

### Community 163 - "Range Extensions"
Cohesion (internal edge density over full membership; size-biased): 0.50
Nodes (4 total, 3 shown after stub filtering): ClosedRange, Range, Self

### Community 164 - "Int Type Aliases"
Cohesion (internal edge density over full membership; size-biased): 0.67
Nodes (3): int, Int, UInt32

### Community 72 - "Test Assertions"
Cohesion (internal edge density over full membership; size-biased): 0.19
Nodes (19 total, 10 shown after stub filtering): assertFalse(), assertNil(), assertNotEquals(), assertNotNil(), failExpectedActual(), Any, Bool, StaticString (+2 more)

### Community 12 - "Build & Dev Scripts"
Cohesion (internal edge density over full membership; size-biased): 0.07
Nodes (47 total, 28 shown after stub filtering): build-debug.sh script, build-man(), build-site(), cp-docs(), build-docs.sh script, check-contains-hash(), check-universal-binary(), build-release.sh script (+20 more)

### Community 18 - "Command Framework Imports"
Cohesion (internal edge density over full membership; size-biased): 0.09
Nodes (42 total, 3 shown after stub filtering): AppKit, Common, ISSoundAdditions

### Community 11 - "Fork Docs & Guidance"
Cohesion (internal edge density over full membership; size-biased): 0.06
Nodes (47): tomlplusplus MIT License (Mark Gillard), MIT License (legal/LICENSE.txt, Nikita Bobko 2023), MIT License (root LICENSE.txt, Nikita Bobko 2023), SwiftLint Configuration (opt-in rule set, strict), Docs TOC Scroll-spy Script, Docs Index Redirect Page, aerospace CLI EBNF Grammar (complgen), AeroSpace App Target (XcodeGen project.yml) (+39 more)

### Community 59 - "OpenSpec Workflow Skills"
Cohesion (internal edge density over full membership; size-biased): 0.19
Nodes (23): openspec-apply-change Skill, openspec-archive-change Skill, openspec-explore Skill, openspec-propose Skill, openspec-sync-specs Skill, openspec-update-change Skill, OpenSpec CLI, Spec-Driven Schema (+15 more)

### Community 112 - "Bad Monitor Arrangement"
Cohesion (internal edge density over full membership; size-biased): 0.44
Nodes (9): Bad Left Corner (red, Monitor 2 bottom-left blocked by Monitor 1), Bad Right Corner (red, Monitor 2 bottom-right blocked by Monitor 3), Good Left Corner (green, free space at Monitor 1 bottom-left), Good Right Corner (green, free space at Monitor 3 bottom-right), Monitor 1 (left monitor), Monitor 2 (center monitor with blocked corners), Monitor 3 (right, portrait monitor), Bad Monitor Arrangement Diagram (variant 1) (+1 more)

### Community 113 - "Good Monitor Arrangement"
Cohesion (internal edge density over full membership; size-biased): 0.28
Nodes (9): Good Left Corner (Free Bottom-Left Zone), Good Monitor Arrangement, Good Right Corner (Free Bottom-Right Zone), Hidden-Workspace Window Corner Stashing, Monitor 1, Monitor 2, Monitor 3 (Portrait), Monitor Arrangement 1 (Good) Diagram (+1 more)

### Community 114 - "Window Tree Diagram"
Cohesion (internal edge density over full membership; size-biased): 0.28
Nodes (9): Finder Window (Leaf), Google Chrome Window (Leaf), Horizontal Tiles (Root Node), Sublime Text Window (Leaf), Terminal Window (Active Leaf), Tiled macOS Desktop Screenshot, Vertical Tiles Container, Window Tree Layout Model (+1 more)

### Community 122 - "Stacked Monitor Pitfall"
Cohesion (internal edge density over full membership; size-biased): 0.50
Nodes (8): Bad Left Corner Placement (red, blocks Monitor 1 bottom-left), Bad Right Corner Placement (red, blocks Monitor 1 bottom-right), Good Right Corner Placement (green, bottom-aligned with Monitor 2), Monitor 1 (top stacked monitor), Monitor 2 (bottom stacked monitor), Proper Monitor Arrangement (guide.adoc section), Bad Monitor Arrangement 2 Diagram, Free Bottom Corner Requirement for Window Hiding

### Community 137 - "Horizontal Tiles Diagram"
Cohesion (internal edge density over full membership; size-biased): 0.53
Nodes (6): Finder Window (active), h_tiles Layout (horizontal tiling), Horizontal Tiles (root node), Terminal Window, Window Tree Model, Horizontal Tiles Illustration (h_tiles.png)

### Community 138 - "Diagonal Monitor Arrangement"
Cohesion (internal edge density over full membership; size-biased): 0.73
Nodes (6): Good Left Corner Zone, Good Diagonal Monitor Arrangement, Good Right Corner Zone, Monitor 1, Monitor 2, Monitor Arrangement 2 (Good) Diagram

### Community 150 - "Docs Site Icon"
Cohesion (internal edge density over full membership; size-biased): 0.50
Nodes (5): AeroSpace Docs Site Branding, macOS Traffic-Light Window Controls Motif, macOS Big Sur Squircle Icon Style, Window Management Operation Symbolism (close/minimize/zoom), AeroSpace App Icon

### Community 151 - "App Icon Design"
Cohesion (internal edge density over full membership; size-biased): 0.50
Nodes (5): macOS Big Sur Squircle Icon Convention, macOS Traffic-Light Window Controls Motif, Window Operation Glyphs (Close / Minimize / Zoom), AeroSpace App Icon, Icon Design Rationale: Window Controls Signal a Window Manager

### Community 157 - "Horizontal Accordion Diagram"
Cohesion (internal edge density over full membership; size-biased): 0.67
Nodes (4): Accordion Padding (Edge Slivers of Adjacent Windows), Focused Window Centered Between Accordion Neighbors, Horizontal Accordion Layout, Horizontal Accordion Layout Screenshot (htop in Alacritty)

### Community 158 - "Vertical Accordion Diagram"
Cohesion (internal edge density over full membership; size-biased): 0.83
Nodes (4): Accordion Padding (peeking edges of adjacent windows), Focused Window Prominence (focused window fills most of the screen), Vertical Accordion Layout, Vertical Accordion Screenshot (htop in terminal, macOS)

### Community 56 - "CI Release Pipeline"
Cohesion (internal edge density over full membership; size-biased): 0.11
Nodes (23): CI Job: build-debug, CI Job: build-release, Pages Workflow: build Job, Pages Workflow: deploy Job, release-adrianlsy Release Job, build-docs.sh Script, build-debug.sh Script, build-release.sh Script (+15 more)

## Ambiguous Edges - Review These
- `tomlplusplus MIT License (Mark Gillard)` → `Bundled Dependencies License Index`  [AMBIGUOUS]
  legal/third-party-license/LICENSE-tomlplusplus.txt · relation: references

## Knowledge Gaps
- **629 isolated node(s):** `.description`, `.format`, `.format`, `.format`, `.format` (+624 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **21 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `tomlplusplus MIT License (Mark Gillard)` and `Bundled Dependencies License Index`?**
  _Edge tagged AMBIGUOUS (relation: references) - confidence is low._
- **Why does `Common` connect `Command Framework Imports` to `Command Execution Core`, `Shell Lexer & Parser`, `Config Parse Diagnostics`, `Hotkey Binding Config`, `Config File Watcher`, `Move Mouse Command`, `Client-Server Protocol`, `Test Suite Imports`, `TreeNode Base Class`, `Tree Node Containers`, `Shared Arg Enums`, `Focus State Management`, `Env Variable Tests`, `Window Layout Primitives`, `Start At Login`, `Frozen Tree Snapshots`, `Refresh Session Engine`, `Ordered JSON Model`, `Format Variable Expansion`, `Shell Execution Env`, `CLI Entry Point`, `Monitor Description Parsing`, `Unix Socket Connection`, `Config Command Values`, `Cardinal Direction Moves`, `Per-Monitor Gaps Config`, `Tree Node Case Enums`, `Config Root Model`, `Workspace Model`, `Command Manifest`, `AX Accessibility Attributes`, `AX Subscriptions`, `Menu Bar Actions`, `Window Detected Callbacks`, `Rect Geometry`, `Run Loop Jobs`, `JSON Model`, `Message HUD View`, `Test Assertions`, `Volume HUD Panel`, `Tray Menu Model`, `Move To Workspace`, `App Bundle Init`, `Monitor Info Impl`, `Focus Command Logic`, `Frozen Tree Types`, `Abstract App Model`, `AX Dump Recursive`, `Test Util Imports`, `App Termination Handling`, `Relative Monitor Resolution`, `Window Frame Setting`, `Thread Guarded Values`, `Debug Windows Recording`, `Window Detection Binding`, `Appearance Theme`, `Node To Monitor`?**
  _High betweenness centrality (0.111) - this node is a cross-community bridge._
- **Why does `CmdArgs` connect `CLI Args Static Info` to `Workspace To Monitor`, `Test Harness Setup`, `Split Command Args`, `Command Argument Structs`, `Swap Command Args`, `Command Execution Core`, `Enum Table Parsing`, `List Command Args`, `Argument Parser Combinators`, `Boolean Flag Parsers`, `Shared Arg Enums`, `Command Parse Results`, `Focus State Management`, `Workspace Command Args`, `Command Parser Inputs`, `Misc Command Args`, `Config Root Model`, `Monitor Target Args`, `Command Manifest`, `Menu Bar Actions`, `Refresh Session Events`, `Focus Command Args`, `Fullscreen Command Args`, `Resize Args Parsing`, `Volume Command Args`, `Enable Command Args`, `Config Command Args`, `AeroAny Type Erasure`, `Move Node Args`, `Move Mouse Args`, `Run Callback Args`, `Trigger Binding Args`, `List Modes Args`?**
  _High betweenness centrality (0.079) - this node is a cross-community bridge._
- **Why does `CLAUDE.md Project Guidance` connect `Fork Docs & Guidance` to `Command Execution Core`, `Config Parse Diagnostics`, `Config File Watcher`, `Build & Dev Scripts`, `Native Focus Mouse`, `TreeNode Base Class`, `Command Kind Registry`, `MacApp AX Threading`, `Command Parse Results`, `Focus State Management`, `Refresh Session Engine`, `CLI Entry Point`, `Unix Socket Connection`, `MacWindow Lifecycle`, `SPM Package Manifest`, `Fork Publish Script`, `Command Manifest`, `Generated Subcommand Descriptions`, `Generated Cmd Help`, `Generated Git Hash`, `Generated Version`, `Window Level Normalization`?**
  _High betweenness centrality (0.073) - this node is a cross-community bridge._
- **Are the 281 inferred relationships involving `assertEquals()` (e.g. with `checkAxDumpsRecursive()` and `.testBalanceSizesCommand()`) actually correct?**
  _`assertEquals()` has 281 INFERRED edges - model-reasoned connections that need verification._
- **Are the 220 inferred relationships involving `parseCommand()` (e.g. with `testParseCommandHelp()` and `testParseSingleCommandSucc()`) actually correct?**
  _`parseCommand()` has 220 INFERRED edges - model-reasoned connections that need verification._
- **What connects `.description`, `.format`, `.format` to the rest of the system?**
  _629 weakly-connected nodes found - possible documentation gaps or missing edges._