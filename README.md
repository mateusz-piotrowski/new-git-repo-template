# New git repository template

A ready-to-use starting point for new git repositories.

## Motivation

The projects has been created to easier setup new git repository.

## The problem

Every new project needs the same boilerplate: license, contributing guide, code of conduct, security policy, issue and PR templates, CI, editor settings, pre-commit hooks. Recreating it by hand is slow and easy to get wrong.

## Why use this template

- **Saves time**: governance docs, GitHub templates, CI, Dependabot and a devcontainer are already in place.
- **Consistent**: shared `.editorconfig`, `.gitattributes` and pre-commit hooks keep formatting uniform.
- **Language-agnostic**: one script adds `.gitignore` rules for your language.
- **Easy to customize**: placeholders mark what you need to change.

## Prerequisites

- Git 2.20 or higher
- A GitHub, GitLab, Bitbucket, or other Git hosting account
- Basic knowledge of Git version control
- A code editor or IDE of your choice
- Terminal/Command line interface access

## System Requirements

- **OS**: Linux, macOS, or Windows (with Git Bash or WSL)
- **Disk Space**: Minimal (< 1 MB for template files)
- **Network**: Internet connection required for cloning and pushing to remote

## Directory Structure

```text
new-git-repo-template/
├── .devcontainer/
│   └── devcontainer.json        # Development container
├── .github/
│   ├── ISSUE_TEMPLATE/          # Bug report and feature request templates
│   ├── workflows/ci.yml         # CI workflow
│   ├── dependabot.yml           # Dependency updates
│   └── PULL_REQUEST_TEMPLATE.md # Pull request template
├── scripts/
│   └── select-language.sh       # Pick a language and update .gitignore
├── .editorconfig                # Editor style settings
├── .gitattributes               # Line endings and binary files
├── .gitignore                   # Git ignore rules
├── .pre-commit-config.yaml      # Pre-commit hooks
├── AGENTS.md                    # Guidance for AI coding agents
├── CHANGELOG.md                 # Version history and release notes
├── CODEOWNERS                   # Repository ownership
├── CODE_OF_CONDUCT.md           # Community guidelines
├── CONTRIBUTING.md              # Contribution guidelines
├── LICENSE                      # MIT license
├── README.md                    # Project overview and setup
└── SECURITY.md                  # Security policy
```

## Setup

1. Create a new repository from this template (GitHub: **Use this template**), or clone it:

   ```bash
   git clone <repository-url> my-project
   cd my-project
   ```

2. Choose your language and update `.gitignore`:

   ```bash
   ./scripts/select-language.sh
   ```

3. Replace the placeholders: `@your-github-username` in `CODEOWNERS`, `security@example.com` in `SECURITY.md`, and the setup commands in `CONTRIBUTING.md` and `.github/workflows/ci.yml`.

4. Update this README, then commit and push.

Optional: install [`pre-commit`](https://pre-commit.com) and run `pre-commit install`.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) and the [Code of Conduct](CODE_OF_CONDUCT.md).

## License

[MIT](LICENSE) © Mateusz Piotrowski
