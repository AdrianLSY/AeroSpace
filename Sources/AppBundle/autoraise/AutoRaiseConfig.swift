import AppKit
import AutoRaiseCore
import Common

struct AutoRaiseConfig: ConvenienceCopyable, Equatable, Sendable {
    var enabled: Bool = false
    var pollMillis: Int = 8
    var ignoreSpaceChanged: Bool = false
    var invertDisableKey: Bool = false
    var invertIgnoreApps: Bool = false
    var ignoreApps: [String] = []
    var ignoreTitles: [String] = []
    var stayFocusedBundleIds: [String] = []
    var disableKey: AutoRaiseDisableKey = .control
    // Keep floating windows on top (Swift-side only; not sent to the bridge).
    // Two effects, both in AeroSpace's tree model rather than macOS window levels
    // (true always-on-top would require disabling SIP — see RaiseRouter/design):
    //   1. A hover-raise never buries a focused floating window under a tiling
    //      window (RaiseRouter.route). Soft, not modal: a real click still moves
    //      focus, because clicks land via updateFocusCache, not this router.
    //   2. Switching to a workspace that has floating windows focuses the
    //      most-recent one, surfacing it (Workspace.focusWorkspaceRaisingFloating).
    var keepFloatingOnTop: Bool = true
}

enum AutoRaiseDisableKey: String, Equatable, Sendable {
    case control, option, disabled

    // CGEventFlags mask. Upstream AutoRaise checks modifier state via
    // CGEventGetFlags(keyDownEvent) & disableKey.
    var cgEventFlagMask: Int32 {
        switch self {
            case .control: Int32(CGEventFlags.maskControl.rawValue)
            case .option: Int32(CGEventFlags.maskAlternate.rawValue)
            case .disabled: 0
        }
    }
}

extension AutoRaiseConfig {
    func toBridge() -> AutoRaiseBridgeConfig {
        let bridge = AutoRaiseBridgeConfig()
        bridge.pollMillis = Int32(pollMillis)
        bridge.disableKey = disableKey.cgEventFlagMask
        bridge.ignoreSpaceChanged = ignoreSpaceChanged
        bridge.invertDisableKey = invertDisableKey
        bridge.invertIgnoreApps = invertIgnoreApps
        bridge.ignoreApps = ignoreApps
        bridge.ignoreTitles = ignoreTitles
        bridge.stayFocusedBundleIds = stayFocusedBundleIds
        return bridge
    }
}
