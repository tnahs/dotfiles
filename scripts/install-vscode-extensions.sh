#!/usr/bin/env zsh


VSCODE_EXTENSIONS_TXT="$HOME/.dotfiles/vscode/extensions.txt"


# Installs VSCode extensions listed in a text file.
function install_vscode_extensions {
    while read -r extension; do
      code --install-extension "$extension" --force
    done < "$VSCODE_EXTENSIONS_TXT"
}


function main {
    install_vscode_extensions
}


main
