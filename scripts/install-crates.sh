#!/bin/zsh


CRATES_TXT=$HOME/.dotfiles/cargo/crates.txt


# Installs crates listed in a text file.
function install_crates {
    while read crate; do
      cargo install $crate
    done < $CRATES_TXT
}


function main {
    install_crates
}


main
