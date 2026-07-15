#!/bin/zsh

# shellkit initialization
# Loads all plugins from the plugins/ directory

SHELLKIT_DIR="${0%/*}"

# Source all plugin files in order
for plugin in "$SHELLKIT_DIR"/plugins/*.sh; do
    if [[ -f "$plugin" ]]; then
        source "$plugin"
    fi
done
