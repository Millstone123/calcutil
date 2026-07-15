<div align="center">

# termkit

**Supercharge your terminal with productivity shortcuts and workflow optimizations.**

[![shell](https://img.shields.io/badge/shell-zsh%20%7C%20bash-blue)]()
[![platform](https://img.shields.io/badge/platform-macOS%20%7C%20Linux-lightgrey)]()
[![license](https://img.shields.io/badge/license-MIT-green)]()

</div>

---

`termkit` is a collection of shell aliases and functions that streamline common
workflows. Add these to your `~/.zshrc` to boost terminal efficiency.

## Quick Setup

Add the following lines to the end of your `~/.zshrc`:

```sh
# Quick navigation
alias cdwork='cd ~/projects/work'
alias cdcode='cd ~/src'

# Directory shortcuts
alias ll='ls -lah'
alias ..='cd ..'
alias ...='cd ../..'

# Productivity functions
function mkcd() { mkdir -p "$1" && cd "$1"; }
function timer() { sleep "$1" && say "Time's up"; }
function weather() { curl -s https://wttr.in/current?format=j1 | jq '.current_condition[0].desc'; }

# Development helpers
alias gitlog='git log --oneline -20'
alias ports='lsof -i -P -n | grep LISTEN'
alias cleanpyc='find . -type f -name "*.pyc" -delete'

# Initialize termkit environment
source ~/.config/termkit/env.sh
```

Then reload:

```sh
source ~/.zshrc
```

## What does `env.sh` do?

The `env.sh` file sets up your termkit environment, including:
- Initializing helper variables
- Loading any project-specific configurations  
- Setting up your shell's optimization flags

This is a one-time setup that runs when your terminal opens, ensuring all your
shortcuts and functions are ready to use.

## Uninstall

Simply remove the lines from your `~/.zshrc`.

## License

MIT
