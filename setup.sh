#!/usr/bin/env zsh


# -----------------------------------------------------------------------------
#  ln
#     -s Create a symbolic link.
#     -i Cause ln to write a prompt to standard error if the proposed link exists.
#     -h If the target is a symbolic link, do not follow it.
#     -v Cause ln to be verbose, showing files as they are processed.
# -----------------------------------------------------------------------------
# https://karabiner-elements.pqrs.org/docs/manual/misc/configuration-file-path/
# -----------------------------------------------------------------------------


# shellcheck disable=2296
NAME=$(basename "${(%):-%N}")

APPLICATION_SUPPORT="$HOME/Library/Application Support"
PREFERENCES="$HOME/Library/Preferences"


function create_directories {
    echo "Building home directories..."
    echo

    mkdir "$HOME/.config"
    touch "$HOME/.hushlogin"
    mkdir "$HOME/Projects"
    mkdir "$HOME/Media"
    mkdir "$HOME/Archives"
}


function link_dotfiles {
    echo "Linking dotfiles..."

    ln -sihv "$HOME/.dotfiles/zsh/.zshenv"       "$HOME/.zshenv"
    ln -sihv "$HOME/.dotfiles/zsh/.zshrc"        "$HOME/.zshrc"
    ln -sihv "$HOME/.dotfiles/git/.gitconfig"    "$HOME/.gitconfig"
    ln -sihv "$HOME/.dotfiles/git/.gitignore"    "$HOME/.gitignore"
    ln -sihv "$HOME/.dotfiles/ruff/ruff.toml"    "$HOME/.ruff.toml"
    ln -sihv "$HOME/.dotfiles/hammerspoon"       "$HOME/.hammerspoon"
}


function link_application_dotfiles {
    echo "Linking application dotfiles..."

    mkdir -p "$HOME/.config"

    ln -sihv "$HOME/.dotfiles/starship/starship.toml" "$HOME/.config/starship.toml"
    ln -sihv "$HOME/.dotfiles/karabiner"              "$HOME/.config/karabiner"
    ln -sihv "$HOME/.dotfiles/kitty"                  "$HOME/.config/kitty"
    ln -sihv "$HOME/.dotfiles/ghostty"                "$HOME/.config/ghostty"
    ln -sihv "$HOME/.dotfiles/gitui"                  "$HOME/.config/gitui"
    ln -sihv "$HOME/.dotfiles/bat"                    "$HOME/.config/bat"
    ln -sihv "$HOME/.dotfiles/tridactyl"              "$HOME/.config/tridactyl"
    ln -sihv "$HOME/.dotfiles/yazi"                   "$HOME/.config/yazi"

    # helix
    git clone https://github.com/helix-editor/helix.git "$HOME/.dotfiles/helix/helix"
    ln -sihv "$HOME/.dotfiles/helix"                    "$HOME/.config/helix"
    ln -sihv "$HOME/.dotfiles/helix/helix/runtime/"     "$HOME/.dotfiles/helix/runtime"

    # Syntax-Highlight - https://github.com/sbarex/SourceCodeSyntaxHighlight
    ln -sihv "$HOME/.dotfiles/syntax-highlight/styles" "$APPLICATION_SUPPORT/Syntax Highlight/Styles"
    ln -sihv "$HOME/.dotfiles/syntax-highlight/themes" "$APPLICATION_SUPPORT/Syntax Highlight/Themes"
    ln -sihv "$HOME/.dotfiles/syntax-highlight/org.sbarex.SourceCodeSyntaxHighlight.plist" \
        "$PREFERENCES/org.sbarex.SourceCodeSyntaxHighlight.plist"

    # PrintQR
    mkdir -p "$HOME/.pqr"
    ln -sihv "$HOME/.dotfiles/pqr/config.toml" "$HOME/.pqr/config.toml"

    # VSCode
    ln -sihv "$HOME/.dotfiles/vscode/settings.json" "$APPLICATION_SUPPORT/Code/User/settings.json"

    # PrusaSlicer
    ln -sihv "$HOME/.dotfiles/prusa/PrusaSlicer.ini"  "$APPLICATION_SUPPORT/PrusaSlicer/PrusaSlicer.ini"
    ln -sihv "$HOME/.dotfiles/prusa/filament"         "$APPLICATION_SUPPORT/PrusaSlicer/filament"
    ln -sihv "$HOME/.dotfiles/prusa/physical_printer" "$APPLICATION_SUPPORT/PrusaSlicer/physical_printer"
    ln -sihv "$HOME/.dotfiles/prusa/print"            "$APPLICATION_SUPPORT/PrusaSlicer/print"
    ln -sihv "$HOME/.dotfiles/prusa/printer"          "$APPLICATION_SUPPORT/PrusaSlicer/printer"
    ln -sihv "$HOME/.dotfiles/prusa/shapes"           "$APPLICATION_SUPPORT/PrusaSlicer/shapes"

    # FreeCAD
    ln -sihv "$HOME/.dotfiles/freecad/preference_packs/ShantConfig" "$APPLICATION_SUPPORT/FreeCAD/SavedPreferencePacks/ShantConfig"
    ln -sihv "$HOME/.dotfiles/freecad/preference_packs/package.xml" "$APPLICATION_SUPPORT/FreeCAD/SavedPreferencePacks/package.xml"

    # darktable config & library @ ~/Media/photos/darktable
}


function link_games {
    # Caves of Qud
    # https://wiki.cavesofqud.com/wiki/File_locations
    rm -r"$HOME/Library/Application Support/com.FreeholdGames.CavesOfQud"
    ln -sihv "$HOME/Games/CavesOfQud" "$HOME/Library/Application Support/com.FreeholdGames.CavesOfQud"
}


function print_help {
    echo -e "Setup home directories and dotfiles.

\e[4mUsage:\e[0m ${NAME} [OPTIONS] <COMMAND>

\e[4mCommands:\e[0m
  directories           Create home directories
  dotfiles              Link home dotfiles
  application-dotfiles  Link 'Library'/'Application Support' dotfiles

\e[4mOptions:\e[0m
  -h, --help  Show help"
}


function main {
    if [[ "$1" == "--help" ||  "$1" == "-h" ]]; then
        print_help
        exit 0
    fi

    if [[ $# -ne 1 ]]; then
        echo "Error: missing required positional argument 'command'"
        print_help
        exit 1
    fi

    case "$1" in
        "directories")
            create_directories
            ;;
        "dotfiles")
            link_dotfiles
            ;;
        "application-dotfiles")
            link_application_dotfiles
            ;;
        "games")
            link_games
            ;;
        *)
            echo "Error: invalid command '$1'"
            print_usage
            exit 1
            ;;
    esac
}


main "$@"
