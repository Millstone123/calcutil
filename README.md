<div align="center">

# shellenv

**A unified shell profile manager for consistent development environments across sessions.**

[![shell](https://img.shields.io/badge/shell-zsh%20%7C%20bash-blue)]()
[![platform](https://img.shields.io/badge/platform-macOS%20%7C%20Linux-lightgrey)]()
[![license](https://img.shields.io/badge/license-MIT-green)]()

</div>

---

## Overview

`shellenv` manages your shell configuration in one central location. Instead of
scattering settings across `~/.zshrc`, `~/.zprofile`, and `~/.bashrc`, define
all your preferences—aliases, functions, environment variables, paths—in a
single profile directory that's version-controlled and portable.

## Why Use shellenv?

- **Centralized configuration** — all your shell settings in one place
- **Version control** — track your shell environment in git  
- **Portability** — copy your entire profile to a new machine
- **Organization** — settings are organized into logical modules
- **Easy to maintain** — modify settings without touching your dotfiles

## Installation

1. Clone this repository to your home directory:

```sh
git clone https://github.com/Millstone123/calcutil ~/.shellenv
```

2. Add this single line to the end of your `~/.zshrc`:

```sh
source ~/.shellenv/load.sh
```

3. Reload your shell:

```sh
source ~/.zshrc
```

## How It Works

The `load.sh` script automatically sources all configuration files from the
`shellenv` profile directory. You can customize your environment by editing
files in the included subdirectories—your settings are applied on the next
shell session.

## What Gets Loaded?

The `shellenv/load.sh` file orchestrates loading your profile in this order:

1. **config/** — general configuration (aliases, environment variables)
2. **lib/** — shell functions and utilities
3. **rc/** — session-specific runtime configuration

This ensures settings are applied in the correct order with no conflicts.

## Directory Structure

```
~/.shellenv/
├── load.sh                 # Main loader (add this to ~/.zshrc)
├── config/                 # Your aliases and settings
│   ├── aliases.sh
│   ├── exports.sh
│   └── functions.sh
├── lib/                    # Utility libraries and helpers
│   ├── common.sh
│   └── paths.sh
└── rc/                     # Runtime initialization
    └── defaults.sh
```

## Customization

To add your own settings:

1. Create a new `.sh` file in `config/`, `lib/`, or `rc/`
2. Add your aliases, functions, or exports
3. Reload your shell — the new file is automatically sourced

Example:

```sh
# config/myscripts.sh
alias myalias='some command'
function myfunc() { echo "hello"; }
export MYVAR="value"
```

## Uninstall

Remove the `source ~/.shellenv/load.sh` line from `~/.zshrc` and delete the
`~/.shellenv` directory.

## License

MIT
