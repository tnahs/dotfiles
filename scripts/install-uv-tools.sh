#!/usr/bin/env zsh


UV_TOOLS_TXT="$HOME/.dotfiles/uv/tools.txt"


# Installs tools listed in a text file.
function install_uv_tools {
    while read -r tool; do
        uv tool install "$tool"
    done < "$UV_TOOLS_TXT"
}


function main {
    install_uv_tools
}


main
