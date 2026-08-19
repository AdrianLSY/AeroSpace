# Fork Maintenance

Operational notes for maintaining `AdrianLSY/AeroSpace` rebased on
`nikitabobko/main`.

## Rebase protocol

```bash
git fetch upstream
git rebase upstream/main
# resolve conflicts (see below)
./test.sh
git push --force-with-lease origin main
```

### Expected conflict set

Verified against the v0.21.3 rebase (146 upstream commits, 16 conflicts).
A file conflicts only when upstream also touches it, so treat this as
"expect these, and check the rest merges clean" rather than a guarantee.

**The fork no longer patches any upstream Swift file.** Since AutoRaise was
removed, `Sources/**` carries no fork delta at all, so no Swift conflict is
expected. If one appears, something has drifted — investigate rather than
resolving it by hand.

Historical note: up to `v0.21.3-Beta.adrianlsy.1` the fork carried seven
single-hunk patches into upstream-owned Swift files, and they conflicted on
essentially every rebase. That was the single largest maintenance cost and is
now gone.

**Generated files — never hand-merge.**

| File | Resolve by |
|------|------------|
| `Sources/Common/cmdHelpGenerated.swift`, `Sources/Cli/subcommandDescriptionsGenerated.swift` | No longer expected to conflict (the fork adds no commands). If they do: take either side, run bare `./generate.sh`, commit. **Not** `./build-debug.sh`, which passes `--ignore-cmd-help` |

**Docs and examples.**

| File | Conflict type | Resolve by |
|------|---------------|------------|
| `README.md` | Fork banner + docs-site URLs + Build-badge URL | Keep the fork banner and rebranding; accept upstream edits to the body |
| `CONTRIBUTING.md` | Fork section prepended above `---` divider | Keep fork preamble; accept upstream edits below the divider |
| `docs/guide.adoc` | One rebranded releases URL | Keep the fork's URL; accept upstream edits everywhere else |
| `docs/commands.adoc` | Hand-maintained command index; both sides append | Alphabetical adjacency — keep both sides |
| `grammar/commands-bnf-grammar.txt` | Hand-maintained (despite the name, **not** generated) | Alphabetical adjacency — keep both sides |
| `docs/config-examples/*.toml` | Fork rebrands doc URLs to `adrianlsy.github.io` | Take upstream's structure, re-apply the URL rebrand. Rebrand any *new* upstream URLs too — these files ship inside the `.app` |
| `CLAUDE.md` | Fork-specific architecture notes | Keep fork version |

**Fork-owned — no upstream equivalent, so never conflict.**

`.github/ISSUE_TEMPLATE/fork-*.yml`, `upstream-redirect.md`,
`.github/workflows/release-adrianlsy.yml`, `.github/workflows/pages.yml`,
`script/publish-release-adrianlsy.sh`, `FORK.md`,
`dev-docs/fork-maintenance.md`, `CLAUDE.md`, `.claude/**`.

(`CLAUDE.md` and `.claude/**` have no upstream equivalent, so they can never
conflict — they used to be listed in the conflict table by mistake.)

**Deletions to re-verify** (upstream still ships these; confirm they are
still absent after each rebase):
`.github/ISSUE_TEMPLATE/new-issue.yml`,
`.github/workflows/close-third-party-issues.yml`,
`.github/workflows/label-incoming-prs.yml` (added upstream in v0.21.x;
it labels every PR not authored by an upstream maintainer as
`not-actionable`, and fails outright if that label does not exist in this
repo).

**Merged cleanly in v0.21.3 despite being fork-modified** — do not expect
a conflict, but do re-check: `script/build-brew-cask.sh`,
`install-from-sources.sh`, `.github/pull_request_template.md`,
`.github/ISSUE_TEMPLATE/config.yml`, `docs/util/header.adoc`, `lint.sh`,
`Package.swift`, `Sources/AppBundle/GlobalObserver.swift`,
`Sources/AppBundle/initAppBundle.swift`.

Files that stay upstream-shaped — do not rebrand on rebase:

- `docs/guide.adoc` — upstream owns the guide. The fork's only delta is the
  rebranded releases URL.
- `docs/aerospace-*.adoc` command pages — all upstream-owned; the fork adds
  no commands.
- `dev-docs/architecture.md`, `dev-docs/development.md` — upstream-owned.
  Note both carry **pre-existing upstream errors** that survive rebases
  and are not rebase damage: `development.md` lists a `swiftformat.sh`
  that exists in neither tree, and scopes the bash dependency to shell
  completion when `script/setup.sh` now requires bash >= 5 for every
  script. `architecture.md` cites paths that no longer exist. Leave them
  alone unless you want to carry a deliberate fork patch.
- `legal/README.md`, `third-party-license/**` — dependency licenses.
- `.github/FUNDING.yml` — intentionally unchanged; sponsorship still
  credits upstream maintainer.

## Release workflow

### Tag naming

```
v<upstream-version>-Beta.adrianlsy.<n>
```

- `<upstream-version>` is the upstream version the fork is currently
  rebased on (e.g. `0.21.3`, matching upstream's `v0.21.3-Beta` tag).
- `-Beta.` mirrors upstream's pre-release marker. It stays in the fork
  tag so the version string is honest ("beta of a beta") and SemVer sorts
  the fork tag below a hypothetical stable `v0.21.3`.
- `<n>` is the fork patch counter; resets to `1` per upstream version.
- Dot-separated chain (`-Beta.adrianlsy.N`) is idiomatic SemVer
  pre-release. Homebrew accepts it; tooling that treats dash-suffixes as
  pre-releases behaves correctly for a fork whose tags never interleave
  with upstream's in a single channel.
- If upstream ever drops the `-Beta` marker (e.g. cuts a 1.0 release),
  update the regex in
  [script/publish-release-adrianlsy.sh](../script/publish-release-adrianlsy.sh)
  and
  [.github/workflows/release-adrianlsy.yml](../.github/workflows/release-adrianlsy.yml)
  to match the new upstream shape.

### What fires on tag push

Pushing a matching tag to `AdrianLSY/AeroSpace` triggers two workflows:

1. **[.github/workflows/release-adrianlsy.yml](../.github/workflows/release-adrianlsy.yml)**
   — builds the release binary, creates the GH Release with the zip
   attached, regenerates the Homebrew cask, opens a PR against
   `AdrianLSY/homebrew-tap`.
2. **[.github/workflows/pages.yml](../.github/workflows/pages.yml)** —
   builds `.site/` via `./build-docs.sh`, deploys to GitHub Pages.

### Cutting a release

```bash
git checkout main
git pull
./test.sh                                   # sanity check
git tag -a v0.21.3-Beta.adrianlsy.1 -m "Release v0.21.3-Beta.adrianlsy.1"
git push origin v0.21.3-Beta.adrianlsy.1
```

Then:

- Watch the release workflow in Actions. If it fails, fix and re-tag as
  `-Beta.adrianlsy.<n+1>` — don't mutate existing tags.
- Review the auto-opened tap PR at
  `AdrianLSY/homebrew-tap`. For the first few releases, merge manually
  after visually verifying the generated `.rb` (`sha256`, `url`,
  `version` all make sense). Once the pipeline has been validated
  across 2-3 releases, auto-merge can be enabled.
- Verify the Pages deployment at
  https://adrianlsy.github.io/AeroSpace — the fork banner should appear
  in the site header.

### Manual release fallback

If Actions is unavailable or the workflow fails in a way that needs
local debugging, use
[script/publish-release-adrianlsy.sh](../script/publish-release-adrianlsy.sh):

```bash
./script/publish-release-adrianlsy.sh \
  --build-version 0.21.3-Beta.adrianlsy.1 \
  --tap-git-repo-path /path/to/AdrianLSY/homebrew-tap
```

The script runs `./test.sh`, builds the release, pushes the tag, opens
the GH release creation page, and copies the generated cask into the
local tap checkout. You commit + push the tap repo yourself.

## Tap repo (`AdrianLSY/homebrew-tap`)

Separate repo at https://github.com/AdrianLSY/homebrew-tap.

Expected layout:

```
AdrianLSY/homebrew-tap/
├── Casks/aerospace-adrianlsy.rb     # updated by release workflow
├── README.md
└── (optional) pin.sh                # version-pinning helper
```

**Setup:**

1. Create the repo as public.
2. Add `README.md` pointing at `AdrianLSY/AeroSpace` and giving the
   `brew tap AdrianLSY/tap && brew install --cask aerospace-adrianlsy`
   instructions.
3. Generate a GitHub PAT (fine-grained, scoped to `AdrianLSY/homebrew-tap`
   with `contents: write` and `pull_requests: write`), add it to
   `AdrianLSY/AeroSpace`'s repo secrets as `HOMEBREW_TAP_PAT`. The
   release workflow uses this to push the cask branch and open the PR.

## Docs site (GitHub Pages)

- Pages source = GitHub Actions. URL:
  https://adrianlsy.github.io/AeroSpace.
- Deploys only on tagged releases (`v*-Beta.adrianlsy.*`) — docs match a
  shipping version rather than chasing `main`.
- To preview doc changes locally: `./build-docs.sh && open .site/guide.html`.
- Enable Pages once: repo Settings → Pages → Source: "GitHub Actions".

## Upstream sync cadence

No fixed schedule. Rebase when:

- Upstream ships a release you want to incorporate.
- An upstream fix affects fork users.
- Accumulated upstream delta is approaching a rebase-complexity threshold
  (more than ~20 commits tends to make conflict resolution tedious).

After every rebase:

1. Re-run `./test.sh` before cutting a fork release. Also run
   `./build-docs.sh` and `./build-shell-completion.sh` — neither is covered
   by `./test.sh`, so docs and completion breakage otherwise surfaces only at
   release time.
2. Skim `CLAUDE.md` for accuracy — upstream renames/moves of subsystems
   can stale fork-specific architecture notes.
3. If upstream introduced a new file that overlaps with fork territory
   (e.g. another issue template, another workflow), update the conflict
   set table above.
