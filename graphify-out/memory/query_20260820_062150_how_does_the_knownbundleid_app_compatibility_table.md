---
type: "query"
date: "2026-08-20T06:21:50.575677+00:00"
question: "How does the KnownBundleId app compatibility table drive window classification?"
contributor: "graphify"
outcome: "useful"
source_nodes: ["KnownBundleId", "AxUiElementWindowType", "MacosPopupWindowsContainer", "unbindAndGetBindingDataForNewWindow()", "windowLevelCache.swift"]
---

# Q: How does the KnownBundleId app compatibility table drive window classification?

## Answer

VERIFIED: KnownBundleId.swift:1-46 has exactly 30 cases (+isFirefox incl. zenBrowser, isVscode groups); instantiated once per app at MacApp.swift:40. Four override clusters in AxUiElementWindowType.swift: (1) windowLevel rollout allowlist L107-112 (slack/chrome/firefox/brave/screenstudio/cleanshotx/iterm2/outlook/codex/wisprFlow: alwaysOnTop -> popup); (2) per-app popup shapes L114-141 (ghostty quickTerminal identifier per issue #103, xcode open_quickly, iterm2 nil-fullscreen-button hotkey window, steam accessory exemption, emacs floating child frames #776) + Firefox gets a NEW button/focus heuristic while everyone else uses the 0.18.3-hotfix old path L143-200 (finder Quick Look kept as window L199); (3) forced/bespoke dialog rules L27-57 (_1password alwaysOnTop, iphonesimulator always, photoBooth always, qutebrowser exempted from subrole rule, firefox disabled-minimize = PiP, ghostty button-combination rule); (4) the no-enabled-fullscreen-button dialog rule L70-92 with a 12-app exemption list (gimp, chrome tab-drag race, activityMonitor, alacritty/kitty/wezterm/qutebrowser/iterm2/emacs/vscode/vscodium buttonless-titlebar modes, steam). zoom is special-cased elsewhere: MacWindow.hideInCorner skips the 1px corner offset (#527). Classifier inputs: subrole, identifier, 4 window buttons + enabled state, focus signals, activation policy, and CG window layer via windowLevelCache (never size/title in the new path; title only in the old heuristic). Result flows via unbindAndGetBindingDataForNewWindow (MacWindow.swift:216-220): popup -> global MacosPopupWindowsContainer under NilTreeNode (no workspace), dialog -> workspace floatingWindowsContainer, window -> tiling at MRU+1. Tests: AxUiElementWindowTypeTest replays 125 real-world .json5 AX dumps from axDumps/ as pinned fixtures.

## Outcome

- Signal: useful

## Source Nodes

- KnownBundleId
- AxUiElementWindowType
- MacosPopupWindowsContainer
- unbindAndGetBindingDataForNewWindow()
- windowLevelCache.swift