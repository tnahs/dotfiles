#!/usr/bin/env zsh


NPM_PACKAGES_TXT="$DOTFILES/npm/packages.txt"


# Installs packages listed in a text file.
function install_npm_packages {
    while read -r package; do
        npm install --global "$package"
    done < "$NPM_PACKAGES_TXT"
}


function main {
    install_npm_packages
}


main
