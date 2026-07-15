<div align="center">

# shellkit

**A lightweight shell plugin framework for defining and managing custom productivity shortcuts.**

[![shell](https://img.shields.io/badge/shell-zsh%20%7C%20bash-blue)]()
[![platform](https://img.shields.io/badge/platform-macOS%20%7C%20Linux-lightgrey)]()
[![license](https://img.shields.io/badge/license-MIT-green)]()

</div>

---

`shellkit` is a minimalist plugin system that lets you organize custom shell
functions, aliases, and command shortcuts in a centralized, version-controlled
way. Instead of scattering ad-hoc aliases throughout your `~/.zshrc`, define
them here and load them via a single initialization line.

## Features

- **Organize shortcuts centrally** — define all custom commands and aliases in
  one place
- **Easy to enable/disable** — just comment or remove the init line to turn off
  all plugins
- **Composable** — stack multiple plugins; each one is sourced in order
- **Zero runtime overhead** — functions are defined once at shell startup, not
  on each command
- **Version-controlled** — keep your shell extensions in git alongside your
  dotfiles

## Installation

1. Clone this repository:

```sh
git clone https://github.com/Millstone123/shellkit ~/.config/shellkit
```

2. Add this line to the end of your `~/.zshrc`:

```sh
# shellkit plugin framework
source ~/.config/shellkit/init.sh
```

3. Reload your shell:

```sh
source ~/.zshrc
```

## What gets loaded?

The `init.sh` script sources all `.sh` files in the `plugins/` directory,
giving you instant access to any custom functions or aliases defined there.
Check the `plugins/` folder to see what's available; disable individual
plugins by moving them to `plugins/disabled/`.

## Defining custom plugins

Create a new file in `plugins/`:

```sh
# plugins/myshortcuts.sh
alias myalias='some command'
function myfunc() { echo "hello"; }
```

It will be sourced automatically on shell startup.

## Uninstall

Remove the `source ~/.config/shellkit/init.sh` line from `~/.zshrc` and delete
the `~/.config/shellkit` directory.

## License

MIT
