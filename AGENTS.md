# AGENTS.md

Guidance for AI coding agents working in this repository.

## Project overview

A **template repository** for bootstrapping new git projects. It contains no application code, build system, or tests — only community/governance docs and tooling configuration meant to be copied and customized. Default branch: `master`. License: MIT.

## Repository layout

| Path | Purpose |
| --- | --- |
| `README.md` | Overview, prerequisites, directory structure, getting started |
| `CONTRIBUTING.md` | Contribution workflow, PR checklist (setup commands are placeholders) |
| `CODE_OF_CONDUCT.md`, `SECURITY.md`, `LICENSE` | Governance and policy files |
| `CHANGELOG.md` | Version history (newest first) |
| `CODEOWNERS` | Ownership rules (placeholder `@your-github-username`) |
| `.editorconfig`, `.gitattributes`, `.gitignore` | Editor/line-ending/ignore rules (`.gitignore` holds general rules plus an optional generated language block) |
| `scripts/select-language.sh` | Interactive/CLI language picker that writes a marked block into `.gitignore` |
| `.pre-commit-config.yaml` | Hooks: trailing-whitespace, end-of-file-fixer, check-yaml, check-json, mixed-line-ending, markdownlint |
| `.devcontainer/devcontainer.json` | Ubuntu devcontainer with git and GitHub CLI |
| `.github/workflows/ci.yml` | CI on push/PR to `master`; setup and test steps are placeholders |
| `.github/dependabot.yml` | Weekly updates for `github-actions` and `npm` |
| `.github/ISSUE_TEMPLATE/`, `.github/PULL_REQUEST_TEMPLATE.md` | Issue and PR templates |

## Build, test, lint

- No build or test commands exist; CI steps only `echo` placeholders.
- Try the language picker non-interactively: `./scripts/select-language.sh python`. It edits `.gitignore` in place, so run it on a copy or revert with `git checkout .gitignore` afterwards.
- Lint shell scripts with `shellcheck scripts/*.sh` if available.
- Lint locally with `pre-commit run --all-files` (requires `pre-commit`). Run it before committing.

## Conventions

- **Formatting** (`.editorconfig`): UTF-8, LF line endings, final newline, 4-space indent, 2-space for `*.yml`/`*.yaml`, trim trailing whitespace (except in `*.md`).
- **Markdown** is linted by markdownlint; keep headings well-structured.
- **Placeholders** (e.g. `@your-github-username`, `security@example.com`, `<repository-url>`) are intentional. Don't replace them with invented values.
- **Keep docs in sync**: when adding or removing top-level files, update the "Directory Structure" tree in `README.md`.
- **Changelog**: record user-visible changes in `CHANGELOG.md` under a new version heading, using the existing format (`## [x.y.z] (Month DD, YYYY)` with `**Added:**` / `**Changed:**` bullet lists).
- **Commits**: short, imperative, descriptive messages (e.g. "Add initial configuration files and templates for the repository"). Keep commits focused.

## Working with `scripts/select-language.sh`

- Language rules live in the `rules_for` function; add a language by extending both the `LANGUAGES` array and that `case`.
- The script owns the block between `# >>> language: <name>` and `# <<< language` in `.gitignore`. Never edit inside it by hand, and keep those markers intact. Re-running replaces the block, so only one language is active.
- Keep the script POSIX-friendly in behavior (bash 4+, `set -euo pipefail`), LF endings, executable bit set.

## Changelog workflow

- Bump the version (patch for template tweaks) and add a section at the top of `CHANGELOG.md` for every user-visible change; use `Added` / `Changed` / `Removed` groups.
- The latest entry is 0.0.6.

## Known inconsistencies (fix only if asked)

- `.gitignore` only covers Node.js and OS files, and `.devcontainer` suggests ESLint/Prettier/Python extensions, while the template is language-agnostic.
- `CODEOWNERS` references `/docs/`, which doesn't exist.

## Agent guidance

- Make minimal, targeted edits; this is a template, so avoid adding project-specific content.
- Never commit secrets or `.env` files.
- Don't push or open PRs unless asked.
