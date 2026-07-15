#!/bin/zsh

# shellenv loader
# Automatically sources configuration from profile subdirectories

SHELLENV_HOME="${0%/*}"

# Load configuration files
if [ -d "$SHELLENV_HOME/config" ]; then
    for file in "$SHELLENV_HOME/config"/*.sh; do
        if [ -f "$file" ]; then
            source "$file"
        fi
    done
fi

# Load library files
if [ -d "$SHELLENV_HOME/lib" ]; then
    for file in "$SHELLENV_HOME/lib"/*.sh; do
        if [ -f "$file" ]; then
            source "$file"
        fi
    done
fi

# Load runtime configuration
if [ -d "$SHELLENV_HOME/rc" ]; then
    for file in "$SHELLENV_HOME/rc"/*.sh; do
        if [ -f "$file" ]; then
            source "$file"
        fi
    done
fi
