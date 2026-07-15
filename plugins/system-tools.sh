#!/bin/zsh

# system-tools.sh
# Common system and productivity shortcuts

# Quick directory navigation
alias ll='ls -lah'
alias ..='cd ..'
alias ...='cd ../..'

# System utilities
alias diskspace='du -sh ./*'
alias ports='lsof -i -P -n | grep LISTEN'
alias myip='curl -s https://api.ipify.org'

# Development helpers
alias gitlog='git log --oneline -10'
alias serve='python3 -m http.server 8000'

# Quick system tools
alias calc='open -a Calculator'
alias notes='open -a Notes'
alias dict='open -a Dictionary'

# Utility functions
function mkcd() { mkdir -p "$1" && cd "$1"; }
function extract() { tar -xzf "$1"; }
