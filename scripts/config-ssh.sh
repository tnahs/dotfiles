#!/usr/bin/env zsh


# ------------------------------------------------------------------------------
# https://unix.stackexchange.com/a/595537
# ------------------------------------------------------------------------------


function config_ssh {
    mkdir -p "$HOME/.ssh"
    chmod 700 "$HOME/.ssh"
    chmod 600 "$HOME/.ssh/id_rsa"
    chmod 644 "$HOME/.ssh/id_rsa.pub"
}


function main {
    config_ssh
}


main
