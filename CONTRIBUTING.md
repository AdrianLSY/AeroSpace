# Contributing to this fork

This document applies to **AdrianLSY/AeroSpace**, a fork of
[nikitabobko/AeroSpace](https://github.com/nikitabobko/AeroSpace) that adds
AutoRaise hover-to-raise. Contribution rules for the fork differ from
upstream — upstream's rules are reproduced below the divider (with minor
annotations) for anyone wanting to upstream a change.

## Scope

Fork-specific contributions are welcome for:

- Bugs in the AutoRaise integration (`Sources/AutoRaiseCore/`,
  `Sources/AppBundle/autoraise/`).
- Fork-specific docs (this file, [FORK.md](./FORK.md),
  [dev-docs/fork-maintenance.md](./dev-docs/fork-maintenance.md), the
  `#auto-raise` section of [docs/guide.adoc](./docs/guide.adoc),
  [docs/aerospace-enable-auto-raise.adoc](./docs/aerospace-enable-auto-raise.adoc),
  [docs/aerospace-disable-auto-raise.adoc](./docs/aerospace-disable-auto-raise.adoc)).
- Release tooling (`script/publish-release-adrianlsy.sh`,
  `.github/workflows/release-adrianlsy.yml`, `.github/workflows/pages.yml`).
- Fork issue templates and the fork-specific parts of
  [.github/pull_request_template.md](./.github/pull_request_template.md).

Contributions that affect core AeroSpace behavior (tiling, focus,
multi-monitor, config parsing, CLI that matches upstream) should go
to [upstream](https://github.com/nikitabobko/AeroSpace) so the fix
benefits everyone. Fork-specific wrappers around upstream behavior stay
here.

## Filing issues

Bug reports and feature requests can be submitted to this repo's
[Issues](https://github.com/AdrianLSY/AeroSpace/issues) — no Discussion
gate required. Use the **Bug (fork-specific)** and **Feature request
(fork-specific)** templates.

If a bug is clearly in upstream AeroSpace behavior (tiling, focus,
multi-monitor, config parsing, CLI), you're also welcome to file it
directly at
[upstream discussions](https://github.com/nikitabobko/AeroSpace/discussions)
so it benefits the wider community. The **Upstream behavior (redirect)**
issue template can help route you there. Either place works.

## Licensing

- Contributions to `Sources/AutoRaiseCore/**` are
  **GPL-2.0-or-later**, derived from
  [sbmpost/AutoRaise](https://github.com/sbmpost/AutoRaise).
- Contributions elsewhere in the fork are **MIT**, matching upstream.
- The combined binary is **GPL-2.0-or-later** because of the
  AutoRaiseCore linkage. See [LICENSE.txt](./LICENSE.txt) and
  [LICENSE-GPL](./LICENSE-GPL).

By contributing to a file, you agree to license your contribution under
that file's existing license.

## Commit hygiene

- Each commit is an atomic change — no mixing refactors with functional
  changes.
- Commit messages explain what, why, and how.
- Rebase and force-push; no merge commits.
- `./test.sh` exits 0 before you open the PR.

## Pull request review

PRs are reviewed and merged by maintainers of this fork. Upstream
AeroSpace maintainers are not involved — this fork is a separate project.

---

## Upstream AeroSpace contribution rules (reference)

The rules below apply to the upstream project at
[nikitabobko/AeroSpace](https://github.com/nikitabobko/AeroSpace). They
are reproduced here (with minor annotations where the fork differs) so
contributors can see how upstream handles contributions, in case you want
to upstream a change instead of (or in addition to) sending it to the fork.

The main and the most important rule: **read the room!**

* Does your patch look like typical commit in the repo?
* Does your commit message look like typical commit message in the repo?
* Does your test look like typical test in the repo?
* etc.

## Submiting bugs and feature ideas

Submit bugs to https://github.com/nikitabobko/AeroSpace/discussions/categories/potential-bugs

Submit feature ideas to https://github.com/nikitabobko/AeroSpace/discussions/categories/feature-ideas

Rules:
* Search for duplicates (in GitHub Issues and Discussions) before creating a new discussion
* Upvote for issues/discussions that you find useful

**Consider including in bug reports**

* `aerospace debug-windows` output, if the problem is about handling some windows
* Screenshots of problematic windows
* Videos of problematic windows
* What did you try to resolve the issue?
* Your config
* AeroSpace version
* macOS version

**Consider including in feature request**

* Use cases!
* Alternative approaches
* Links to docs of similar features in other window managers that you know
* Synopsis, if you suggest a new command
* Mental model description

## Submiting code

There are 2 options:
1. Send email patches to: `echo YWVyb3NwYWNlLXBhdGNoZXNAYm9ia28ueHl6Cg== | base64 --decode`
2. Send GitHub PRs

**License Agreement**. By contributing changes to this repository, you agree to license your contributions under the MIT license. (**Note:** this applies to upstream only. This fork's AutoRaiseCore code is GPL-2.0-or-later — see the [Licensing](#licensing) section above for the fork's terms.)

Maintainers can apply your patch with arbitrary modifications.

## Spread the word

Do you like the project? Does AeroSpace finally fix your problems with windows management on macOS? Good to hear it!

* Spread the word in social networks! (Don't forget to share the link :) )
* Talk about AeroSpace to your colleagues and friends
* Write a blogpost about your workflows
* Record a YouTube video

## Share your workflow and tips

Submit your tips to [the Goodies page](https://nikitabobko.github.io/AeroSpace/goodies). The source code of the page can be found in `./docs` directory

## Support the project financially

Supporting the parent project financially counts as a contribution (even if it's just a $1/month).
You can sponsor the parent project on GitHub Sponsors page: https://github.com/sponsors/nikitabobko
