@testable import AppBundle
import Common
import XCTest

@MainActor
final class ParseAutoRaiseTest: XCTestCase {
    func testDefaults() {
        let result = parseConfig("")
        assertEquals(result.errors, [])
        assertEquals(result.config.autoRaise, AutoRaiseConfig())
        assertEquals(result.config.autoRaise.enabled, false)
        assertEquals(result.config.autoRaise.pollMillis, 8)
        assertEquals(result.config.autoRaise.disableKey, .control)
    }

    func testFullRoundTrip() {
        let result = parseConfig(
            """
            [auto-raise]
                enabled = true
                poll-millis = 16
                ignore-space-changed = true
                invert-disable-key = true
                invert-ignore-apps = true
                ignore-apps = ["Finder", "Safari"]
                ignore-titles = ["^Picture-in-Picture$", "window$"]
                stay-focused-bundle-ids = ["com.apple.SecurityAgent"]
                disable-key = "option"
            """,
        )
        assertEquals(result.errors, [])
        assertEquals(result.config.autoRaise.enabled, true)
        assertEquals(result.config.autoRaise.pollMillis, 16)
        assertEquals(result.config.autoRaise.ignoreSpaceChanged, true)
        assertEquals(result.config.autoRaise.invertDisableKey, true)
        assertEquals(result.config.autoRaise.invertIgnoreApps, true)
        assertEquals(result.config.autoRaise.ignoreApps, ["Finder", "Safari"])
        assertEquals(result.config.autoRaise.ignoreTitles, ["^Picture-in-Picture$", "window$"])
        assertEquals(result.config.autoRaise.stayFocusedBundleIds, ["com.apple.SecurityAgent"])
        assertEquals(result.config.autoRaise.disableKey, .option)
    }

    func testPollMillisMinimum() {
        let result = parseConfig(
            """
            [auto-raise]
                poll-millis = 0
            """,
        )
        assertEquals(result.strErrors, ["[ERROR] auto-raise.poll-millis: Must be >= 1"])
    }

    func testInvalidDisableKey() {
        let result = parseConfig(
            """
            [auto-raise]
                disable-key = "shift"
            """,
        )
        assertEquals(result.strErrors, ["[ERROR] auto-raise.disable-key: Can't parse disable-key 'shift'. Allowed values: control, option, disabled"])
    }

    func testDisableKeyDisabledIsAllowed() {
        let result = parseConfig(
            """
            [auto-raise]
                disable-key = "disabled"
            """,
        )
        assertEquals(result.errors, [])
        assertEquals(result.config.autoRaise.disableKey, .disabled)
    }

    func testInvalidIgnoreTitlesRegex() {
        let result = parseConfig(
            """
            [auto-raise]
                ignore-titles = ["valid", "[unclosed"]
            """,
        )
        // Pattern index 1 is the bad one; the prefix is deterministic, the
        // localized suffix is not.
        assertEquals(result.strErrors.count, 1)
        XCTAssertTrue(result.strErrors[0].hasPrefix("[ERROR] auto-raise.ignore-titles[1]: Invalid regex '[unclosed': "))
    }

    // Spec: hover-focus / "Hover-driven focus mechanisms are mutually exclusive".
    // Upstream's focus-follows-mouse and the fork's [auto-raise] both focus the
    // window under the pointer, so enabling both must warn (never hard-error, or a
    // running config would break on upgrade).
    private static let bothEnabledMarker = "Enable only one of them."

    func testBothHoverMechanismsEnabledWarns() {
        let result = parseConfig(
            """
            focus-follows-mouse.enabled = true
            [auto-raise]
                enabled = true
            """,
        )
        assertEquals(result.errors, [])
        assertTrue(result.allowReloadConfig)
        assertEquals(result.strWarnings.count(where: { $0.contains(Self.bothEnabledMarker) }), 1)
    }

    func testOnlyAutoRaiseEnabledDoesNotWarn() {
        let result = parseConfig(
            """
            [auto-raise]
                enabled = true
            """,
        )
        assertEquals(result.errors, [])
        assertTrue(result.strWarnings.allSatisfy { !$0.contains(Self.bothEnabledMarker) })
    }

    func testOnlyFocusFollowsMouseEnabledDoesNotWarn() {
        let result = parseConfig("focus-follows-mouse.enabled = true")
        assertEquals(result.errors, [])
        assertTrue(result.strWarnings.allSatisfy { !$0.contains(Self.bothEnabledMarker) })
    }

    func testNeitherHoverMechanismEnabledDoesNotWarn() {
        let result = parseConfig("")
        assertEquals(result.errors, [])
        assertTrue(result.strWarnings.allSatisfy { !$0.contains(Self.bothEnabledMarker) })
    }

    // Upstream AutoRaise warp-related keys (warpX/warpY/scale/altTaskSwitcher)
    // must be rejected — see spec "Upstream warp keys are rejected". Using an
    // integer value here so the parser surfaces the unknown-key error rather
    // than the "Unsupported TOML type: Double" error it would raise for 0.5.
    func testUnknownKeyRejected() {
        let result = parseConfig(
            """
            [auto-raise]
                altTaskSwitcher = true
            """,
        )
        assertEquals(result.strErrors, ["[ERROR] auto-raise.altTaskSwitcher: Unknown key"])
    }
}
