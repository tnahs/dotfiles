#!/usr/bin/env zsh


CRATES_TXT="$DOTFILES/cargo/crates.txt"


# Installs crates listed in a text file.
function install_crates {
    while read -r crate; do
      cargo install "$crate"
    done < "$CRATES_TXT"
}


function main {
    install_crates
}


main
