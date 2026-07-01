@testable import AppBundle
import Common
import XCTest

@MainActor
final class WorkspaceCommandTest: XCTestCase {
    override func setUp() async throws { setUpWorkspacesForTests() }

    func testParseWorkspaceCommand() {
        testParseCommandFail("workspace my mail", msg: "ERROR: Unknown argument 'mail'", exitCode: 2)
        testParseCommandFail("workspace 'my mail'", msg: "ERROR: Whitespace characters are forbidden in workspace names", exitCode: 2)
        assertEquals(parseCommand("workspace").errorOrNil, "ERROR: Argument '(<workspace-name>|next|prev)' is mandatory")
        testParseCommandSucc("workspace next", WorkspaceCmdArgs(target: .relative(.next)))
        testParseCommandSucc("workspace --auto-back-and-forth W", WorkspaceCmdArgs(target: .direct(.parse("W").getOrDie()), autoBackAndForth: true))
        assertEquals(parseCommand("workspace --wrap-around W").errorOrNil, "--wrapAround requires using (next|prev) argument")
        assertEquals(parseCommand("workspace --auto-back-and-forth next").errorOrNil, "--auto-back-and-forth is incompatible with (next|prev)")
        testParseCommandSucc("workspace next --wrap-around", WorkspaceCmdArgs(target: .relative(.next), wrapAround: true))
        assertEquals(parseCommand("workspace --stdin foo").errorOrNil, "--stdin and --no-stdin require using (next|prev) argument")
        testParseCommandSucc("workspace --stdin next", WorkspaceCmdArgs(target: .relative(.next)).copy(\.explicitStdinFlag, true))
        testParseCommandSucc("workspace --no-stdin next", WorkspaceCmdArgs(target: .relative(.next)).copy(\.explicitStdinFlag, false))
    }

    // keep-floating-on-top: switching to a workspace with a floating window
    // surfaces the float, even when a tiling window is the most-recent overall.
    func testSwitchFocusesFloatingWindow() {
        Workspace.get(byName: "a").apply {
            TestWindow.new(id: 2, parent: $0) // floating
            TestWindow.new(id: 1, parent: $0.rootTilingContainer) // tiling (most-recent overall)
        }
        _ = Workspace.get(byName: "b").apply { TestWindow.new(id: 3, parent: $0.rootTilingContainer) }.focusWorkspace()

        _ = Workspace.get(byName: "a").focusWorkspaceRaisingFloating()

        assertEquals(focus.workspace.name, "a")
        assertEquals(focus.windowOrNil?.windowId, 2)
    }

    // With the option off, switching keeps the normal most-recent-window behavior.
    func testSwitchWithKeepFloatingDisabledFocusesTiling() {
        config.autoRaise.keepFloatingOnTop = false
        Workspace.get(byName: "a").apply {
            TestWindow.new(id: 2, parent: $0) // floating
            TestWindow.new(id: 1, parent: $0.rootTilingContainer) // tiling (most-recent overall)
        }
        _ = Workspace.get(byName: "b").apply { TestWindow.new(id: 3, parent: $0.rootTilingContainer) }.focusWorkspace()

        _ = Workspace.get(byName: "a").focusWorkspaceRaisingFloating()

        assertEquals(focus.workspace.name, "a")
        assertEquals(focus.windowOrNil?.windowId, 1)
    }

    // No floats → normal focusWorkspace() fallback.
    func testSwitchWithoutFloatsFallsBackToTiling() {
        Workspace.get(byName: "a").apply {
            TestWindow.new(id: 1, parent: $0.rootTilingContainer)
        }
        _ = Workspace.get(byName: "b").apply { TestWindow.new(id: 3, parent: $0.rootTilingContainer) }.focusWorkspace()

        _ = Workspace.get(byName: "a").focusWorkspaceRaisingFloating()

        assertEquals(focus.workspace.name, "a")
        assertEquals(focus.windowOrNil?.windowId, 1)
    }
}
