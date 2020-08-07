#!/bin/zsh

# Append ~/.dotfiles/bin.
export PATH="$PATH:$HOME/bin"

# poetry
# https://python-poetry.org/docs/#installation
export PATH="$HOME/.poetry/bin:$PATH"

# pipx
# https://pipxproject.github.io/pipx/installation/
export PATH="$PATH:$HOME/.local/bin"

# For running `code` in the terminal to launch VSCode.
# https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Warning: Homebrew's sbin was not found in your PATH but you have installed
# formulae that put executables in /usr/local/sbin.
# Consider setting the PATH for example like so:
export PATH="/usr/local/sbin:$PATH"

# Don't create Python binary files.
export PYTHONDONTWRITEBYTECODE=1

# pyenv
# https://github.com/pyenv/pyenv#homebrew-on-macos
eval "$(pyenv init -)"


# navigation
alias ll="ls -lah"
alias k="cd $HOME/Desktop; ls -lah;"
alias l="cd $HOME/Downloads; ls -lah;"
alias w="cd $HOME/Workspace; ls -lah;"
alias p="cd $HOME/Workspace/projects; ls -lah;"

# homebrew
alias brewski="brew update && brew upgrade && brew cleanup; brew doctor"

# zsh/dotfiles
alias zshrc="code $HOME/.dotfiles/zsh"
alias reload_zshrc="source $HOME/.dotfiles/zsh/.zshrc"
alias scripts="cd $HOME/.dotfiles/scripts"
alias dotfiles="cd $HOME/.dotfiles && code ."


function make_executable {
    chmod u+x "$@"
}


function clear_history {
    local HISTSIZE=0
}


function set_icons {

    cp "$HOME/.dotfiles/icons/iTerm2-dark-mode.icns" "/Applications/iTerm.app/Contents/Resources/AppIcon.icns"
    touch "/Applications/iTerm.app"

    cp "$HOME/.dotfiles/icons/Anki.icns" "/Applications/Anki.app/Contents/Resources/anki.icns"
    touch "/Applications/Anki.app"

    cp "$HOME/.dotfiles/icons/Audacity.icns" "/Applications/Audacity.app/Contents/Resources/Audacity.icns"
    touch "/Applications/Audacity.app"

    sudo killall Finder && sudo killall Dock
}


function rip-videos {
    for url in "$@"; do
        youtube-dl \
            --output "%(uploader)s - %(title)s - %(id)s.%(ext)s" \
            --continue \
            --add-metadata \
            --embed-subs \
            --all-subs \
            --ignore-errors \
            --external-downloader aria2c --external-downloader-args "-c -j 3 -x 3 -s 3 -k 1M" \
            "$url"
    done
}


# zsh-completions
# https://github.com/zsh-users/zsh-completions
fpath=("$HOME/.dotfiles/zsh/plugins/zsh-completions/src" $fpath)

# zsh-autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions
source "$HOME/.dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

# zsh-syntax-highlighting
# http://github.com/zsh-users/zsh-syntax-highlighting
# https://coderwall.com/p/qmvfya/syntax-highlighting-for-zsh
source "$HOME/.dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
