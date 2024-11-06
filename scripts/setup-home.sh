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


local APPLICATION_SUPPORT="$HOME/Library/Application Support"
local PREFERENCES="$HOME/Library/Preferences"

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

    # KiCad
    rm -r                                      $HOME/Library/Preferences/kicad
    ln -sihv $HOME/.dotfiles/kicad/config      $HOME/Library/Preferences/kicad
    ln -sihv $HOME/.dotfiles/kicad/documents   $HOME/Documents/KiCad

    # PrusaSlicer
    ln -sihv $HOME/.dotfiles/prusa/PrusaSlicer.ini  $APPLICATION_SUPPORT/PrusaSlicer/PrusaSlicer.ini
    ln -sihv $HOME/.dotfiles/prusa/filament         $APPLICATION_SUPPORT/PrusaSlicer/filament
    ln -sihv $HOME/.dotfiles/prusa/physical_printer $APPLICATION_SUPPORT/PrusaSlicer/physical_printer
    ln -sihv $HOME/.dotfiles/prusa/print            $APPLICATION_SUPPORT/PrusaSlicer/print
    ln -sihv $HOME/.dotfiles/prusa/printer          $APPLICATION_SUPPORT/PrusaSlicer/printer
    ln -sihv $HOME/.dotfiles/prusa/shapes           $APPLICATION_SUPPORT/PrusaSlicer/shapes

    # FreeCAD
    ln -sihv $HOME/.dotfiles/freecad/preference_packs/ShantConfig $APPLICATION_SUPPORT/FreeCAD/SavedPreferencePacks/ShantConfig
    ln -sihv $HOME/.dotfiles/freecad/preference_packs/package.xml $APPLICATION_SUPPORT/FreeCAD/SavedPreferencePacks/package.xml
    ln -sihv $HOME/.dotfiles/freecad/macros                       $APPLICATION_SUPPORT/FreeCAD/Macro
    ln -sihv $HOME/.dotfiles/freecad/materials                    $APPLICATION_SUPPORT/FreeCAD/Material
    ln -sihv $HOME/.dotfiles/freecad/system.cfg                   $PREFERENCES/FreeCAD/system.cfg
    ln -sihv $HOME/.dotfiles/freecad/user.cfg                     $PREFERENCES/FreeCAD/user.cfg
}


function main {
    # build_directories
    link_dotfiles
}


main
