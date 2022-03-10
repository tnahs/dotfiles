#!/bin/zsh


# -----------------------------------------------------------------------------
#  ln
#     -s Create a symbolic link.
#     -i Cause ln to write a prompt to standard error if the proposed link exists.
#     -v Cause ln to be verbose, showing files as they are processed.
# -----------------------------------------------------------------------------
# https://karabiner-elements.pqrs.org/docs/manual/misc/configuration-file-path/
# -----------------------------------------------------------------------------


function build_directories {
    printf "\nBuilding home directories...\n\n"
    # .config Mainly used for karabiner
    mkdir $HOME/.config
    # Workspace
    mkdir $HOME/Workspace
    mkdir $HOME/Workspace/repos
    mkdir $HOME/Workspace/projects
    # Media
    mkdir $HOME/Media
    mkdir $HOME/Media/incoming
    mkdir $HOME/Media/incoming/images
    mkdir $HOME/Media/incoming/audio
    mkdir $HOME/Media/incoming/video
    mkdir $HOME/Media/books
    mkdir $HOME/Media/books/pdfs
    mkdir $HOME/Media/books/epubs
    mkdir $HOME/Media/books/audiobooks
    mkdir $HOME/Media/wallpapers
    # Archives
    mkdir $HOME/Archives
    mkdir $HOME/Archives/anki
    mkdir $HOME/Archives/anki-collectionn
    mkdir $HOME/Archives/apple-books
    mkdir $HOME/Archives/downloads
    mkdir $HOME/Archives/media
    mkdir $HOME/Archives/workspace
}


function link_dotfiles {
    printf "\nLinking dotfiles...\n\n"
    ln -siv $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc
    ln -siv $HOME/.dotfiles/zsh/.zshenv $HOME/.zshenv
    ln -siv $HOME/.dotfiles/homebrew/Brewfile $HOME/Brewfile
    ln -siv $HOME/.dotfiles/karabiner $HOME/.config/karabiner
    ln -siv $HOME/.dotfiles/hammerspoon $HOME/.hammerspoon
    ln -siv $HOME/.dotfiles/alacritty/alacritty.yml $HOME/.alacritty.yml
    ln -siv $HOME/.dotfiles/kitty $HOME/.config/kitty
    ln -siv $HOME/.dotfiles/nvim $HOME/.config/nvim
}


function main {
    build_directories
    link_dotfiles
}


main

