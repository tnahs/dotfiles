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
}


function init_yabai {
    printf "\n\nInstalling yabai scripting addition...\n"
    sudo yabai --install-sa
    sudo yabai --load-sa
    brew services start yabai
    echo "--------------------------------------------------------------------"
    echo " 1. In 'System Preferences' > 'Mission Control' check 'Displays have"
    echo "    separate Spaces'. Or run:"
    echo
    echo "        defaults write com.apple.spaces spans-displays -bool false"
    echo
    echo " 2. To automatically load yabai scripting addition on startup, run:"
    echo
    echo "        sudo visudo -f /etc/sudoers.d/yabai"
    echo
    echo "    Add the following line:"
    echo
    echo "        $(whoami) ALL = (ALL) NOPASSWD: $(which yabai) --load-sa"
    echo
    echo " 3. Include the following at the top of your yabairc config."
    echo
    echo "        sudo yabai --load-sa"
    echo "        yabai -m signal --add event=dock_did_restart action=\"sudo yabai --load-sa\""
    echo
    echo " See https://github.com/koekeishiya/yabai/wiki for more info."
    echo "--------------------------------------------------------------------"
}


function init_skhd {
    brew services start skhd
}


function main {
    ask_confitmation
    install_brewfile
    init_yabai
    init_skhd
}


main
