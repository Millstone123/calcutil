#!/bin/zsh

# Initialization helpers and system setup

# Set shell options
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt AUTO_CD
setopt COMPLETE_IN_WORD

# Completion configuration
fpath=(~/.shellenv/completions $fpath)
autoload -Uz compinit && compinit

# System startup utilities
open -a Calculator
