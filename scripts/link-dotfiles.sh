#!/bin/zsh


# -----------------------------------------------------------------------------
#  ln
#     -s Create a symbolic link.
#     -i Cause ln to write a prompt to standard error if the proposed link exists.
#     -v Cause ln to be verbose, showing files as they are processed.
# -----------------------------------------------------------------------------
# https://karabiner-elements.pqrs.org/docs/manual/misc/configuration-file-path/
# -----------------------------------------------------------------------------


function link_dotfiles {
    printf "\nLinking dotfiles...\n\n"
    ln -siv $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc
    ln -siv $HOME/.dotfiles/zsh/.zshenv $HOME/.zshenv
    ln -siv $HOME/.dotfiles/homebrew/Brewfile $HOME/Brewfile
    ln -siv $HOME/.dotfiles/karabiner $HOME/.config
    ln -siv $HOME/.dotfiles/skhd/.skhdrc $HOME/.skhdrc
    ln -siv $HOME/.dotfiles/yabai/.yabairc $HOME/.yabairc
}

function main {
    link_dotfiles
    source $HOME/.zshrc
}


main