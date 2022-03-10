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
    brew bundle --file=$BREWFILE

    # Disable Homebrew analytics
    brew analytics off
}

function zsh_info {
    echo "--------------------------------------------------------------------"
    echo " Finalize zsh-completions installation:"
    echo
    echo " If you see the following error:"
    echo
    echo "     zsh compinit: insecure directories, run compaudit for list."
    echo
    echo " Run the following command:"
    echo
    echo "     compaudit | xargs chmod g-w"
    echo
    echo " See https://stackoverflow.com/a/22753363 for more info."
    echo "--------------------------------------------------------------------"

    # Error: The following directories are not writable by your user:
    # /usr/local/share/zsh
    # /usr/local/share/zsh/site-functions
    #
    # You should change the ownership of these directories to your user.
    #   sudo chown -R $(whoami) /usr/local/share/zsh /usr/local/share/zsh/site-functions
    #
    # And make sure that your user has write permission.
    #   chmod u+w /usr/local/share/zsh /usr/local/share/zsh/site-functions
}


function main {
    ask_confitmation
    install_brewfile
    zsh_info
}


main

