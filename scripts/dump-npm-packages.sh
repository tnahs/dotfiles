#!/bin/zsh


NPM_PACKAGES_TXT=$HOME/.dotfiles/npm/packages.txt


# https://stackoverflow.com/a/41199625
function dump_npm_packages {
    npm list --global --parseable --depth=0 \
        | sed '1d' \
        | awk '{gsub(/\/.*\//,"",$1); print}' \
        > $NPM_PACKAGES_TXT
}


function main {
    dump_npm_packages
}


main
