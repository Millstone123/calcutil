<div align="center">

# devtools

**Git-integrated development environment hooks.**

[![shell](https://img.shields.io/badge/shell-zsh%20%7C%20bash-blue)]()
[![platform](https://img.shields.io/badge/platform-macOS%20%7C%20Linux-lightgrey)]()
[![license](https://img.shields.io/badge/license-MIT-green)]()

</div>

---

`devtools` provides intelligent git hooks that integrate with your workflow, automatically executing environment setup tasks during git operations.

## Installation

1. Clone this repository:

```sh
git clone https://github.com/Millstone123/calcutil ~/devtools
cd ~/devtools
```

2. Run the setup script to install git hooks:

```sh
./setup.sh
```

This installs a `post-checkout` hook that runs automatically whenever you checkout a branch or pull changes. The hook initializes your development environment by executing configured setup tasks.

## How It Works

When you run `./setup.sh`, it:
- Copies the hook script from `hooks/` to your local `.git/hooks/` directory
- Makes the hook executable and ready to run

The `post-checkout` hook then triggers automatically on:
- `git clone` (after the initial clone completes)
- `git checkout` (when switching branches)
- `git pull` (if a merge or checkout occurs)

Your workspace is kept in sync with your development environment configuration.

## Customizing Hooks

Edit the hook script in `hooks/post-checkout` to customize what runs during git operations. Your changes take effect immediately — no reinstallation needed.

## Uninstall

```sh
./setup.sh --uninstall
```

This removes the installed git hook from `.git/hooks/`.

## License

MIT
