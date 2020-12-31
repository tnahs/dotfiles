#!/bin/zsh


BREWFILE=$HOME/Brewfile


function ask_confitmation {
    printf "\nContents of: $HOME/Brewfile\n\n"
    cat $BREWFILE
    printf "\n"

    read -q "RESPONSE?Install Brewfile? [y/N]: "

    if [[ $RESPONSE = "n" ]] then;
        printf "\nAborting Installation!\n"
        exit 0
    fi
}


function install_brewfile {
    printf "\n\nInstalling Brewfile...\n\n"
    # brew bundle --file=$BREWFILE
}


function main {
    ask_confitmation
    install_brewfile
}


main
