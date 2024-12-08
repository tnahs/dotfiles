#!/usr/bin/env zsh


VSCODE_EXTENSIONS_TXT="$HOME/.dotfiles/vscode/extensions.txt"


function dump_vscode_extensions {
    code --list-extensions > "$VSCODE_EXTENSIONS_TXT"
}


function main {
    dump_vscode_extensions
}


main
