# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

AeroSpace is an i3-like tiling window manager for macOS. This repo is the
**AdrianLSY fork** of [nikitabobko/AeroSpace](https://github.com/nikitabobko/AeroSpace)
that ships its own builds, Homebrew tap, and docs site. There are **no
functional differences from upstream** — the fork's delta is branding,
CI/release tooling, and issue templates. Everything is MIT, mirroring
upstream.

See [FORK.md](FORK.md), [CONTRIBUTING.md](CONTRIBUTING.md), and
[dev-docs/fork-maintenance.md](dev-docs/fork-maintenance.md) for fork
context; [dev-docs/development.md](dev-docs/development.md) for env
setup and tooling; [dev-docs/architecture.md](dev-docs/architecture.md)
for the upstream architecture primer.

`development.md` and `architecture.md` are **upstream-owned and
byte-identical to upstream** — editing them would create a fork delta,
so don't. Two known-stale spots to read past: `architecture.md`'s
infrastructure overview still describes a `xcode-app-bundle-launcher/`
directory and a root-level `AeroSpace.xcodeproj`/`project.yml` (really:
entry point `Sources/AeroSpaceApp/AeroSpaceApp.swift`, project at
`xcode/AeroSpace.xcodeproj` generated from `xcode/project.yml`), and
`development.md`'s script list names a `swiftformat.sh` that is now
`format.sh` while omitting `lint.sh` and `swift-test.sh`. Fix those
upstream, not here.

## Commands

All scripts live at repo root; invoke them with `./name.sh`. They all
`cd` to repo root and `source script/setup.sh`, which pins toolchains
via `swiftly` when available.

**Requires `bash` >= 5 on PATH** (`brew install bash`) — `script/setup.sh`
aborts otherwise, and it nukes `PATH` down to `.deps/bin:/bin:/usr/bin`,
so tools outside that set are invisible to every script.

**Primary dev loop**
- `./build-debug.sh` — SPM debug build into `.debug/`. Fast inner loop.
  Skips xcodeproj and cmd-help regeneration by default.
- `./swift-test.sh` — `swift test` with pruned output. **Takes no
  arguments.** Line 5 invokes bare `swift test` with no `"$@"`, so
  anything you pass — `--filter` included — is silently dropped and the
  whole suite runs. To target a single test, bypass the script:
  `swift test --filter <TestCaseName>[/<testMethod>]`, prefixed with
  `swiftly run` when `swiftly` is installed so the pinned toolchain is
  used — `script/setup.sh` does the same and warns when it falls back to
  whatever `swift` is on PATH. The script is upstream-owned and
  byte-identical to upstream, so don't add `"$@"` forwarding here — that
  belongs in an upstream PR.
- `./test.sh` — CI-equivalent: debug build with warnings-as-errors,
  full test suite, CLI smoke tests, `./lint.sh`, `./generate.sh`, and a
  check that no generated files are uncommitted. Run this before
  opening a PR (required by `.github/pull_request_template.md`).
- `./format.sh` — swiftformat only. Takes no options.
- `./lint.sh` — format + a `Task.init` ban + swiftlint + periphery
  dead-code scan. Takes no options. Note: periphery is skipped on macOS
  14/15/26 (see comments inside `lint.sh` — it can't run anywhere right
  now). The macOS 15/26 branch is the fork's only delta in this file and
  its stated cause is stale: the comment blames `AutoRaiseCore` (ObjC++),
  which `d42555f6` deleted — `lint.sh` is now the only remaining mention
  of it in the repo. The skip was left in place deliberately, because
  removing it re-arms `periphery scan --strict` inside `./test.sh` for
  the first time in the fork's history and may surface unrelated dead
  code; see that commit's message. swiftlint runs in check mode here,
  **not** `--fix`, so nothing auto-fixes lint violations any more. The
  uncommitted-files check is now a standalone
  `./script/check-uncommitted-files.sh`.
- `./run-debug.sh [args]` — rebuild + launch `.debug/AeroSpaceApp`.
- `./run-cli.sh [args]` — rebuild + invoke `.debug/aerospace` with
  forwarded args against the already-running server.

**Release / packaging**
- `./build-release.sh` — Xcode-driven universal release build into
  `.release/`. Debug builds never use Xcode; release builds must.
- `./install-from-sources.sh` — builds release + installs the
  `aerospace-dev` cask locally. The fork's only change is adding
  `aerospace-adrianlsy` to the pre-install uninstall list so the local
  dev build wins; do not rebrand on rebase. The `aerospace-adrianlsy`
  cask itself is produced only by `.github/workflows/release-adrianlsy.yml`
  / `script/publish-release-adrianlsy.sh`.
- `./build-docs.sh` / `./build-shell-completion.sh` — generate the
  docs site (`.site/`), man pages (`.man/`), and shell completions
  (`.shell-completion/`).

**Code generation**
- `./generate.sh` regenerates `xcode/AeroSpace.xcodeproj` and several
  Swift source files. Regenerated outputs (named `*Generated.swift` in
  `Sources/Common/` and `Sources/Cli/`) **must be committed** —
  `./test.sh` fails if they drift. Re-run after:
  - editing `xcode/project.yml` (xcodeproj)
  - adding/removing/renaming `docs/aerospace-*.adoc` (subcommand
    descriptions in the CLI `--help`)

  The shell parser is no longer generated. Upstream replaced the ANTLR
  grammar with a hand-written lexer/parser at
  `Sources/AppBundle/shell/shell{Lexer,Parser}.swift`; `grammar/` now
  holds only the hand-maintained `commands-bnf-grammar.txt`, which feeds
  shell-completion generation and must be edited by hand when adding a
  command.
- `swift-version` is pinned in `.swift-version`; `swiftly` in
  `script/setup.sh` enforces it.

## Architecture

### Client/server split

`aerospace` CLI binary (`Sources/Cli`) is the client. `AeroSpace.app`
(`Sources/AeroSpaceApp` entry point, `Sources/AppBundle` library) is
the server. They communicate over a Unix socket (`server.swift`,
client code in `Sources/Cli/_main.swift`). Args are parsed on the
client (for `--help` / early-exit shortcuts), sent over the socket,
then **re-parsed on the server** via the same code in
`Sources/Common/cmdArgs/`. That shared-parser constraint is why arg
parsing and command arg structs live in `Common/` — both client and
server link them.

### SPM vs Xcode

Library code and the CLI build **purely via SPM** (`Package.swift`).
SPM cannot produce a macOS App Bundle, so the App Bundle is built via
Xcode against the generated `xcode/AeroSpace.xcodeproj` (generated from
`xcode/project.yml` via `xcodegen`). Push as much code as possible into the
SPM library (`Sources/AppBundle`) — the Xcode target is just a thin
entry point. Open `Package.swift` in Xcode, not `.xcodeproj`, unless
you're debugging the release build.

### Command pipeline

A command is defined in three places:

1. **`Sources/Common/cmdArgs/impl/<Name>CmdArgs.swift`** — argument
   struct. Also registered in the `CmdKind` enum +
   `initSubcommands()` switch in
   `Sources/Common/cmdArgs/cmdArgsManifest.swift`.
2. **`Sources/AppBundle/command/impl/<Name>Command.swift`** —
   server-side `Command` conformance (`run(env, io) async throws`).
   Also wired into the `toCommand()` switch in
   `Sources/AppBundle/command/cmdManifest.swift`.
3. **`docs/aerospace-<name>.adoc`** — docs + man page + the CLI
   `--help` subcommand summary (pulled by `generate.sh` from
   `:manpurpose:`).

Adding or renaming a command without touching all three breaks the
build or the `./test.sh` "no uncommitted generated files" check.

### Refresh sessions (focus + layout reconciliation)

The central reconciliation primitive lives in
`Sources/AppBundle/layout/refresh.swift`:

- `runHeavyCompleteRefreshSession` — full `getNativeFocusedWindow` →
  model refresh (`MacApp.refreshAllAndGetAliveWindowIds` + GC) →
  layout pass. Kicked off by NSWorkspace notifications and AX
  observers via `scheduleCancellableCompleteRefreshSession`.
- `runLightSession` — wraps command execution. Cancels any in-flight
  heavy session, runs the command body, relayout, syncs focus, then
  reschedules a heavy session. Commands received via the socket
  server always run inside a `runLightSession`.

`TrayMenuModel.shared.isEnabled` (aka "the master switch", toggled
by `enable on/off`) gates both. When disabled, workspaces are
stashed into off-screen corners (see `hideInCorner`/`unhideFromCorner`
in `refresh.swift`).

### Tree model

`Sources/AppBundle/tree/`:

- `TreeNode` — base class. Every node records `lastAppliedLayoutPhysicalRect`
  (real gaps) and `lastAppliedLayoutVirtualRect` (zero gaps); many
  commands read these without re-querying AX.
- `Workspace`, `TilingContainer`, `Window` / `MacWindow` — concrete
  nodes. `Window.get(byId:)` has a unit-test branch that walks
  workspaces instead of `MacWindow.allWindowsMap`.
- `tree/MacosUnconventionalWindowsContainer.swift` declares no type of
  that name — it holds four sibling containers,
  `MacosFullscreenWindowsContainer`, `MacosHiddenAppsWindowsContainer`,
  `MacosMinimizedWindowsContainer`, and `MacosPopupWindowsContainer`,
  which keep fullscreen / hidden-app / minimized / popup windows off the
  main tree. `Sources/AppBundle/normalizeLayoutReason.swift` (one level
  up, **not** under `tree/`) shuttles windows in and out based on macOS
  state.

### Focus

`focus.swift` owns the global `LiveFocus` (derived) and `FrozenFocus`
(stored, safe to hold). Command implementations should generally
respect `--window-id` / `--workspace` / `AEROSPACE_WINDOW_ID` /
`AEROSPACE_WORKSPACE` env first and fall back to the global only when
none applies. Focus changes go through `setFocus(to:)` (updates the
tree model) paired with `Window.nativeFocus()` (AX-side raise + app
activate) — see `GlobalObserver` and the end of `runLightSession` for
how the pair is used consistently.

### Private API

`Sources/PrivateApi/` exposes exactly one private symbol:
`_AXUIElementGetWindow`. This is the only private API in the project
and the codebase's guiding principle is to keep it that way.

### Generated code

These files are produced by `generate.sh` and checked in. Don't edit
them by hand:

- `Sources/Common/versionGenerated.swift`
- `Sources/Common/gitHashGenerated.swift`
- `Sources/Common/cmdHelpGenerated.swift`
- `Sources/Cli/subcommandDescriptionsGenerated.swift`
- `xcode/AeroSpace.xcodeproj/` (regenerated from `xcode/project.yml`)

## Conventions that will catch you out

- **Swift strict concurrency.** `Package.swift` enables
  `NonisolatedNonsendingByDefault` and `.strictMemorySafety()`. Most
  mutable globals are `@MainActor`. Cross-actor calls need explicit
  annotations; `unsafe` is required for the few `nonisolated(unsafe)`
  globals.
- **Config reloads are hot.** `ConfigFileWatcher` + `reload-config`
  both call through the same parsing path in `parseConfig.swift`.
  Preserve runtime toggle state when adding new config fields — keep a
  sticky flag on the owning controller rather than in the config.
- **`runLightSession` is single-flight.** It cancels any in-flight
  heavy refresh. If you add a code path that mutates the tree, route
  it through `runLightSession` or `refreshModel()` so the
  `on-focus-changed` / broadcast machinery stays consistent.
- **Rebase, don't merge.** The fork's `main` is kept rebased on
  `nikitabobko/main`. No merge commits. Expected conflict set on
  rebase is listed in
  [dev-docs/fork-maintenance.md](dev-docs/fork-maintenance.md#expected-conflict-set)
  — consult it before resolving conflicts yourself.
