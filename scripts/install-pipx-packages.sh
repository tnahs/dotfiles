#!/bin/zsh


function install_pipx_packages {

    printf "\nInstalling pipx packages...\n\n"

    pipx_packages=(
        "flake8"
        "black"
        "mypy"
        "isort"
        "bpython"
        "youtube-dl"
        "gallery-dl"
    )

    for package in $pipx_packages; do
        pipx install $package
    done
}


function main {
    install_pipx_packages
}


main

