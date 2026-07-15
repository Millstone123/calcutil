#!/bin/zsh

# Common utility functions

function mkcd() {
    mkdir -p "$1" && cd "$1"
}

function extract() {
    case "$1" in
        *.tar.gz) tar -xzf "$1" ;;
        *.tar) tar -xf "$1" ;;
        *.zip) unzip "$1" ;;
        *) echo "Unknown archive format" ;;
    esac
}

function gitclone() {
    git clone "$1" && cd "$(basename "$1" .git)"
}
