---
type: "query"
date: "2026-08-19T13:51:28.764689+00:00"
question: "Why does TreeNode connect TreeNode Base Class to 17 communities (Refresh Session Engine, Frozen Tree Snapshots, Recursive Layout Engine, ...)?"
contributor: "graphify"
outcome: "useful"
source_nodes: ["TreeNode", "Window", "Workspace", "TilingContainer", "MruStack", "FrozenTreeNode", "Rect", ".layoutRecursive()", ".findLeafWindowRecursive()", "BindingData"]
---

# Q: Why does TreeNode connect TreeNode Base Class to 17 communities (Refresh Session Engine, Frozen Tree Snapshots, Recursive Layout Engine, ...)?

## Answer

Expanded from original query via vocab: [tree, node, container, workspace, tiling, frozen, refresh, layout, binding, weight, mru, recursive]. BFS from TreeNode (TreeNode.swift L4, degree 74) + neighbor-community grouping shows 3 bridge mechanisms. (1) Inheritance root: every concrete tree entity inherits TreeNode and each subclass sits in its own community - Window (Window.swift L4), Workspace (Workspace.swift L33), TilingContainer (TilingContainer.swift L4), NonLeafTreeNodeObject (TreeNodeCases.swift L74), and the five unconventional containers Floating/MacosFullscreen/MacosHiddenApps/MacosMinimized/MacosPopupWindowsContainer. (2) Distributed class body via Swift extensions: TreeNode methods are declared in files owned by other subsystems - .layoutRecursive() in layoutRecursive.swift L16 (Recursive Layout Engine), .findLeafWindowRecursive() in FocusCommand.swift L196 (Focus Command Logic), .getWeightBeforeResize() in resizeWithMouse.swift (Refresh Session Engine), MoveCommandTest.swift (Test Suite Imports). (3) Cross-cutting data deps: calls MruStack (MruStack.swift L2) for most-recent-child ordering, references Rect (Rect.swift L4), MonitorInfo (MonitorInfo.swift L18), FrozenTreeNode.getWeightOrNil (FrozenTreeNode.swift L45) and FrozenWorld.collectAllWindowIdsRecursive (FrozenWorld.swift L7) for snapshots, implements AeroAny. All bridge edges are EXTRACTED (AST), not inferred.

## Outcome

- Signal: useful

## Source Nodes

- TreeNode
- Window
- Workspace
- TilingContainer
- MruStack
- FrozenTreeNode
- Rect
- .layoutRecursive()
- .findLeafWindowRecursive()
- BindingData