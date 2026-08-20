---
type: "query"
date: "2026-08-20T06:21:50.624555+00:00"
question: "How does the fork release pipeline work end to end, and where are the rebase risks?"
contributor: "graphify"
outcome: "useful"
source_nodes: ["release-adrianlsy Release Job", "build-brew-cask.sh", "publish-release-adrianlsy.sh", "install-from-sources.sh", "AdrianLSY/homebrew-tap", "Pages Workflow: build Job"]
---

# Q: How does the fork release pipeline work end to end, and where are the rebase risks?

## Answer

VERIFIED: tag push v<x.y.z>-Beta.adrianlsy.<n> (regex identical in release-adrianlsy.yml:28 and publish-release-adrianlsy.sh:25) -> macos-26 runner -> ./test.sh -> ./build-release.sh --codesign-identity - (AD-HOC signed only, no Developer ID / no notarization anywhere; the cask compensates with a postflight xattr -d com.apple.quarantine, build-brew-cask.sh:65-68) -> universal SPM CLI + Xcode app bundle, layout/2-arch/githash/codesign validation -> gh release create with zip (GITHUB_TOKEN) -> build-brew-cask.sh generates aerospace-adrianlsy.rb (conflicts_with upstream aerospace cask only) -> tap PR to AdrianLSY/homebrew-tap using HOMEBREW_TAP_PAT + gh auth setup-git (the 05dcc8f8 fix) -> manual merge. Same tag also triggers pages.yml -> build-docs.sh -> deploy-pages. install-from-sources.sh:23 is that file's ENTIRE fork delta (uninstall aerospace-adrianlsy so aerospace-dev wins; the casks do not conflict at brew level). Rebase risk map: fork-owned files can never conflict; build-brew-cask.sh carries the fork insertions (textual conflict risk in the case statement + heredoc); the BIGGER risk is silent clean-merge breakage - build-release.sh is byte-identical to upstream, but the fork workflow hardcodes its outputs (.release/AeroSpace-v$V.zip path, flag names), so an upstream rename rebases clean and breaks the release with no conflict marker. If upstream drops -Beta, the regex must change in BOTH the workflow and the publish script. Also: upstream label-incoming-prs.yml must stay deleted (not-actionable label missing in fork). HOMEBREW_TAP_PAT is a manually provisioned fine-grained PAT.

## Outcome

- Signal: useful

## Source Nodes

- release-adrianlsy Release Job
- build-brew-cask.sh
- publish-release-adrianlsy.sh
- install-from-sources.sh
- AdrianLSY/homebrew-tap
- Pages Workflow: build Job