#!/bin/zsh


# -----------------------------------------------------------------------------
#  ln
#     -s Create a symbolic link.
#     -i Cause ln to write a prompt to standard error if the proposed link exists.
#     -h If the target is a symbolic link, do not follow it.
#     -v Cause ln to be verbose, showing files as they are processed.
# -----------------------------------------------------------------------------
# https://karabiner-elements.pqrs.org/docs/manual/misc/configuration-file-path/
# -----------------------------------------------------------------------------


function build_directories {
    printf "\nBuilding home directories...\n\n"
    mkdir $HOME/.config
    mkdir $HOME/Workspace
    mkdir $HOME/Media
    mkdir $HOME/Media/incoming
    mkdir $HOME/Archives
    mkdir $HOME/Archives/anki
    mkdir $HOME/Archives/anki-collectionn
    mkdir $HOME/Archives/apple-books
    mkdir $HOME/Archives/downloads
    mkdir $HOME/Archives/media
    mkdir $HOME/Archives/workspace
    touch $HOME/.hushlogin
}


function link_dotfiles {
    printf "\nLinking dotfiles...\n\n"
    ln -sihv $HOME/.dotfiles/zsh/.zshrc        $HOME/.zshrc
    ln -sihv $HOME/.dotfiles/zsh/.zshenv       $HOME/.zshenv
    ln -sihv $HOME/.dotfiles/git/.gitconfig    $HOME/.gitconfig
    ln -sihv $HOME/.dotfiles/git/.gitignore    $HOME/.gitignore
    ln -sihv $HOME/.dotfiles/homebrew/Brewfile $HOME/Brewfile
    ln -sihv $HOME/.dotfiles/hammerspoon       $HOME/.hammerspoon
    ln -sihv $HOME/.dotfiles/karabiner         $HOME/.config/karabiner
    ln -sihv $HOME/.dotfiles/kitty             $HOME/.config/kitty
    ln -sihv $HOME/.dotfiles/helix             $HOME/.config/helix
    ln -sihv $HOME/.dotfiles/gitui             $HOME/.config/gitui
    rm -r                                      $HOME/Library/Preferences/kicad
    ln -sihv $HOME/.dotfiles/kicad/config      $HOME/Library/Preferences/kicad
    ln -sihv $HOME/.dotfiles/kicad/documents   $HOME/Documents/KiCad
}


function main {
    build_directories
    link_dotfiles
}


main
