# AdrianLSY/AeroSpace — Fork of [nikitabobko/AeroSpace](https://github.com/nikitabobko/AeroSpace)

This is a public fork of AeroSpace, the i3-like tiling window manager for
macOS. It tracks upstream closely and ships its own builds.

## What this fork is

This fork carries **no functional changes** to AeroSpace. It exists to provide
an independently built and released distribution:

- **Its own Homebrew tap and cask** (`AdrianLSY/tap`, `aerospace-adrianlsy`),
  released on its own cadence from this repo's CI.
- **Its own docs site** at
  [adrianlsy.github.io/AeroSpace](https://adrianlsy.github.io/AeroSpace),
  mirroring upstream's content with a fork header.
- **Its own issue templates and triage**, accepting both fork-specific and
  upstream behavior reports.

Behavior matches upstream exactly, so upstream's
[user guide](https://adrianlsy.github.io/AeroSpace/guide) applies in full.

### Previously: hover-to-raise (AutoRaise) — removed

Up to and including `v0.21.3-Beta.adrianlsy.1`, this fork bundled a port of
[sbmpost/AutoRaise](https://github.com/sbmpost/AutoRaise) providing
hover-to-raise via an `[auto-raise]` config section. It has been removed in
favour of upstream's native `focus-follows-mouse`, which arrived in upstream
v0.21.x.

**If you used `[auto-raise]`, this is a breaking change.** An unknown
top-level key is a hard config error, so AeroSpace will reject your config
until you act:

1. Delete the entire `[auto-raise]` section from your `aerospace.toml`.
2. Add `focus-follows-mouse.enabled = true` at the top level.
3. Replace any `enable-auto-raise` / `disable-auto-raise` keybindings or
   scripts — those commands no longer exist. Hover focus is now toggled only
   by editing the config and running `reload-config`.

Two behavioral differences to expect:

- **Better:** focus now follows the pointer *across monitors*. AutoRaise never
  did — it only ever raised windows on the focused workspace.
- **Worse:** focus no longer re-evaluates when the window under a *stationary*
  pointer changes (for example after a keyboard workspace switch, or when a
  window closes and the layout reflows). `focus-follows-mouse` reacts only to
  physical pointer movement.

The `poll-millis`, `disable-key`, `invert-disable-key`, `ignore-apps`,
`invert-ignore-apps`, `ignore-titles`, `stay-focused-bundle-ids` and
`ignore-space-changed` options have no equivalent.

The last release containing AutoRaise is
[`v0.21.3-Beta.adrianlsy.1`](https://github.com/AdrianLSY/AeroSpace/releases/tag/v0.21.3-Beta.adrianlsy.1).

## Installation

```bash
brew tap AdrianLSY/tap
brew install --cask aerospace-adrianlsy
```

Or in one command:

```bash
brew install --cask AdrianLSY/tap/aerospace-adrianlsy
```

The `aerospace-adrianlsy` cask `conflicts_with 'aerospace'`, so you can't
install both simultaneously — pick one.

Other installation options (manual zip download, build from source) match
upstream; see upstream's
[installation guide](https://adrianlsy.github.io/AeroSpace/guide#installation)
for details.

## Relationship to upstream

- **Rebase-based.** Fork's `main` stays rebased on `nikitabobko/main`.
  Upstream commits arrive as-is; fork-specific commits sit on top. No merge
  commits in the fork's `main`.
- **Version scheme.** `v<upstream-version>-Beta.adrianlsy.<n>` — mirrors
  upstream's `-Beta` pre-release marker (the combined binary is genuinely
  a beta of a beta). SemVer-compliant dot-separated pre-release chain:
  - `v0.21.3-Beta.adrianlsy.1` — first fork release after upstream's
    `v0.21.3-Beta`.
  - `v0.21.3-Beta.adrianlsy.2` — fork bugfix with no upstream change.
  - When upstream releases `v0.22.0-Beta` and the fork rebases, the next
    fork tag resets to `v0.22.0-Beta.adrianlsy.1`.
- **Where to file bugs:**
    Bug reports can be filed at
    **[this repo's issues](https://github.com/AdrianLSY/AeroSpace/issues)** —
    both fork-specific and upstream behavior bugs are accepted.
    For upstream AeroSpace bugs you can also file at
    **[upstream discussions](https://github.com/nikitabobko/AeroSpace/discussions)**
    if you prefer. Either place works.

## License

MIT, inherited from upstream AeroSpace — see [LICENSE.txt](./LICENSE.txt).
The fork adds no licensing delta.

Bundled dependency licenses are listed in
[legal/README.md](./legal/README.md); all are permissive (MIT, plus
Apache-2.0 for `swift-collections`).

## For maintainers

See [dev-docs/fork-maintenance.md](./dev-docs/fork-maintenance.md) for:

- Rebase protocol: files that diverge from upstream and how to resolve them.
- Release workflow: tag naming, CI pipeline, Homebrew tap update.
- Docs-site deployment.
- Upstream sync cadence.
