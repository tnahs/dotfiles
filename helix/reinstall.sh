#!/usr/bin/env zsh


function reinstall_helix {
    local repo
    repo=$(realpath "$1")

    cd "$repo" || return

    rm -rf "$repo/target"
    git pull origin master
    cargo uninstall helix-term
    cargo install --path "$repo/helix-term" --locked

    unlink "$HOME/.config/helix/runtime"
    ln -sf "$repo/runtime" "$HOME/.config/helix/runtime"

    rm -rf "$repo/target"
}


function main {
    if [[ $# -ne 1 ]]; then
        echo "Error: please proide a path to a helix repo."
        echo
        exit 1
    else
        # TODO: Add a check to make sure installation was successful.
        reinstall_helix "$1"
        printf "\nInstalled \e[33m%s\e[0m!\n" "$(hx --version)"
    fi
}


main "$@"
