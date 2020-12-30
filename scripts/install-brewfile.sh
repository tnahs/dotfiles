#!/bin/zsh


function install_brewfile {
    printf "\nInstalling Brewfile...\n\n"
    brew bundle --file=$HOME/brewwfile
}


function main {
    install_brewfile
}


main
