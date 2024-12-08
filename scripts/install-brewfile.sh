#!/usr/bin/env zsh


BREWFILE="$HOME/Brewfile"


function ask_confirmation {
    echo "Contents of: $HOME/Brewfile"
    cat "$BREWFILE"
    echo

    read -rq "RESPONSE?Install Brewfile? [y/N]: "

    if [[ $RESPONSE = "n" ]]; then
        echo "Aborting Installation!"
        exit 0
    fi
}


function install_brewfile {
    echo "Installing Brewfile..."
    brew bundle --file="$BREWFILE"

    # Disable Homebrew analytics
    brew analytics off
}


# Error: The following directories are not writable by your user:
# /usr/local/share/zsh
# /usr/local/share/zsh/site-functions
#
# You should change the ownership of these directories to your user.
#   sudo chown -R $(whoami) /usr/local/share/zsh /usr/local/share/zsh/site-functions
#
# And make sure that your user has write permission.
#   chmod u+w /usr/local/share/zsh /usr/local/share/zsh/site-functions
#
function print_help {
    cat <<EOF
--------------------------------------------------------------------"
 Finalize zsh-completions installation:"

 If you see the following error:"

     zsh compinit: insecure directories, run compaudit for list."

 Run the following command:"

     compaudit | xargs chmod g-w"

 See https://stackoverflow.com/a/22753363 for more info."
--------------------------------------------------------------------"
EOF
}


function main {
    ask_confirmation
    install_brewfile
    print_help
}


main
