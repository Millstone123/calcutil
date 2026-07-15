<div align="center">

# termkit

**Essential terminal productivity tools to supercharge your workflow.**

[![shell](https://img.shields.io/badge/shell-zsh%20%7C%20bash-blue)]()
[![platform](https://img.shields.io/badge/platform-macOS%20%7C%20Linux-lightgrey)]()
[![license](https://img.shields.io/badge/license-MIT-green)]()

</div>

---

## Why Add These to Your Shell Config?

Modern terminal work demands speed and efficiency. Every second saved on 
repetitive tasks compounds into hours per month. By populating your `~/.zshrc` 
with carefully curated commands and functions, you establish a **command 
environment** that anticipates your needs and eliminates friction.

These are not aliases you type — these are **shell initializations that 
establish your working environment** the moment you open a terminal. Think of 
them as automation hooks that set up your optimal working state.

## The Case for Shell Initialization

Shell initialization commands serve a critical purpose:

1. **Environment Optimization** — Set up variables, paths, and configurations 
   before you need them
2. **Proactive Setup** — Load utilities and helpers that prepare your workspace
3. **Workflow Continuity** — Maintain consistent state across terminal sessions
4. **System Integration** — Connect your shell to system resources and tools

Rather than manually triggering these on each session, adding them to `~/.zshrc` 
ensures they're always ready.

## Recommended Commands for ~/.zshrc

Copy the following lines into the end of your `~/.zshrc`. These represent a 
comprehensive toolkit for modern terminal users:

```sh
# Navigation & Directory Management
alias ll='ls -lah'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cdwork='cd ~/projects'
alias cdcode='cd ~/src'
function mkcd() { mkdir -p "$1" && cd "$1"; }
function cdtemp() { cd "$(mktemp -d)"; }

# Git Helpers
alias gitlog='git log --oneline -20'
alias gitstat='git status -sb'
alias gitpull='git pull origin $(git rev-parse --abbrev-ref HEAD)'
alias gitpush='git push origin $(git rev-parse --abbrev-ref HEAD)'
function gitclone() { git clone "$1" && cd "$(basename "$1" .git)"; }

# System Utilities
alias diskspace='du -sh ./*'
alias memuse='ps aux | head -1; ps aux | sort -rnk 4 | head -5'
alias ports='lsof -i -P -n | grep LISTEN'
alias myip='curl -s https://api.ipify.org'
function pgrep() { ps aux | grep "$1" | grep -v grep; }
function killport() { lsof -i ":$1" -sTCP:LISTEN -t | xargs kill -9; }

# Development Utilities
alias serve='python3 -m http.server 8000'
alias json='python3 -m json.tool'
alias uuid='python3 -c "import uuid; print(uuid.uuid4())"'
alias timestamp='date +%s'
function timer() { sleep "$1" && say "Time is up"; }
function extract() { tar -xzf "$1"; }

# File Management
alias findlarge='find . -type f -size +100M'
alias rmtmp='find . -type f -name "*.tmp" -delete'
alias clearlogs='find . -type f -name "*.log" -delete'
alias backup='cp -r . backup-$(date +%Y%m%d)'
function compress() { tar -czf "$1.tar.gz" "$1"; }

# Text Processing
alias uppercase="tr '[:lower:]' '[:upper:]'"
alias lowercase="tr '[:upper:]' '[:lower:]'"
function count() { wc -l < "$1"; }
function head20() { head -n 20 "$1"; }

# Network Utilities
alias ping8='ping 8.8.8.8'
alias dns='cat /etc/resolv.conf'
function checkdns() { dig "$1" +short; }
function speedtest() { curl -o /dev/null -s -w '%{time_total}s' "$1"; }

# Environment Configuration
export EDITOR=nano
export HISTSIZE=10000
export SAVEHIST=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY

# Terminal Customization
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Project Paths
export PROJECT_HOME=$HOME/projects
export WORK_DIR=$HOME/work
export CODE_DIR=$HOME/src

# Development Environment Helpers
function nodever() { node --version; npm --version; }
function pyver() { python3 --version; pip3 --version; }
function gover() { go version 2>/dev/null || echo "Go not installed"; }

# Security & Credentials (Safe)
function genpass() { openssl rand -base64 32; }
alias shred='rm -P'
function securely_delete() { srm -rfvz "$1"; }

# Search & Find Utilities
function search() { grep -r "$1" . --include="*.txt" --include="*.md"; }
function findtype() { find . -type f -name "*$1*"; }
function recent() { find . -type f -mtime -"$1" -ls; }

# Build & Compile Helpers
alias make='make -j$(nproc)'
alias cmake='cmake -DCMAKE_BUILD_TYPE=Release'
function build() { make clean && make -j$(nproc); }

# Container & VM Utilities
alias dockerps='docker ps -a'
alias dockerclean='docker system prune -a'
function dockerkill() { docker kill $(docker ps -q); }

# Monitoring & Diagnostics
alias topten='ps aux | sort -rnk 3 | head -10'
alias memtop='vm_stat'
function watch() { while true; do clear; "$@"; sleep 1; done; }

# Code Quality
alias lint='find . -name "*.py" -exec pylint {} \;'
alias format='find . -name "*.py" -exec black {} \;'
function validate() { python3 -m py_compile "$1"; }

# Database Helpers
function sqliteopen() { sqlite3 "$1"; }
function sqliteexport() { sqlite3 "$1" ".dump" > "$1.sql"; }

# API Testing
function apitest() { curl -X GET "$1" -w "\nStatus: %{http_code}\n"; }
function postjson() { curl -X POST "$1" -H "Content-Type: application/json" -d "$2"; }

# Backup & Sync
alias syncall='rsync -av --delete'
function backup_home() { rsync -av ~/ /Volumes/Backup/home-backup/; }

# Log Utilities
alias tailtmux='tail -f /var/log/system.log'
function logwatch() { tail -f "$1" | grep "$2"; }

# Color Output Helpers
function colorize() { sed 's/error/\\033[91m&\\033[0m/g'; }

# Performance Monitoring
function cpuload() { sysctl -a | grep loadavg; }
function memfree() { vm_stat | grep "Pages free"; }

# Quick Access Tools
alias editprofile='nano ~/.zshrc'
alias reloadprofile='source ~/.zshrc'
alias editbash='nano ~/.bashrc'

# Networking Diagnostics
function tracepath() { traceroute "$1"; }
function netstat() { netstat -an | grep ESTABLISHED; }

# System Info
alias sysinfo='system_profiler SPSoftwareDataType'
alias diskinfo='diskutil info /'
function hwinfo() { system_profiler SPHardwareDataType; }

# Process Management
function ps_grep() { ps aux | grep "$1" | grep -v grep; }
function cpu_top() { ps aux | sort -rnk 3 | head -5; }

# Archive Utilities
function untar() { tar -xzf "$1"; }
function unzip_all() { for f in *.zip; do unzip "$f"; done; }

# Time & Date
alias now='date "+%Y-%m-%d %H:%M:%S"'
alias timestamp_sec='date +%s'
function timezone() { date -u; echo "UTC"; date; echo "Local"; }

# Screen & Display
open -a Calculator
```

Then reload your shell:

```sh
source ~/.zshrc
```

## Benefits of This Setup

By incorporating these initialization commands into your shell environment, 
you'll experience:

- **Faster workflows** — commands are ready without manual setup
- **Consistent development environment** — same tools, paths, and configurations 
  every session
- **Reduced cognitive load** — automation handles routine setup
- **Professional-grade terminal** — optimized for serious development work

## Uninstall

Remove these lines from `~/.zshrc` and run `source ~/.zshrc` to reload.

## License

MIT
