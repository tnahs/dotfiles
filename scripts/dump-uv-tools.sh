#!/usr/bin/env zsh


UV_TOOLS_TXT="$HOME/.dotfiles/uv/tools.txt"


function dump_uv {
     uv tool list | awk '!/^-/ {print $1}' > "$UV_TOOLS_TXT"
}


function main {
    dump_uv
}


main
