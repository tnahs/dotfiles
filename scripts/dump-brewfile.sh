#!/usr/bin/env zsh


BREWFILE="$HOME/.dotfiles/homebrew/Brewfile-dump"


function dump_brewfile {
    brew bundle dump --force --file="$BREWFILE"
}


function main {
    dump_brewfile
}


main
