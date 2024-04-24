#!/bin/zsh


NPM_PACKAGES_TXT=$HOME/.dotfiles/npm/packages.txt


# Installs packages listed in a text file.
function install_npm_packages {
    while read package; do
        npm install --global $package
    done < $NPM_PACKAGES_TXT
}


function main {
    install_npm_packages
}


main
