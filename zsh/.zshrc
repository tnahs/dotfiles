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

# pyenv
# https://github.com/pyenv/pyenv#homebrew-on-macos
eval "$(pyenv init -)"

# Don't create Python binary files.
export PYTHONDONTWRITEBYTECODE=1

# navigation
alias ll="ls -lah"
alias k="cd $HOME/Desktop; ls -lah;"
alias l="cd $HOME/Downloads; ls -lah;"
alias w="cd $HOME/Workspace; ls -lah;"
alias p="cd $HOME/Workspace/projects; ls -lah;"


# homebrew
alias brewski="brew update && brew upgrade && brew cleanup; brew doctor"


# bash/dotfiles
alias editdot="code $HOME/.dotfiles "
alias editbash="code $HOME/.dotfiles/bash"
alias editzsh="code $HOME/.dotfiles/zsh"


function dlvid {
    for url in "$@"; do
        youtube-dl \
            --output "%(uploader)s - %(title)s - %(id)s.%(ext)s" \
            --continue \
            --add-metadata \
            --embed-subs \
            --all-subs \
            --external-downloader aria2c --external-downloader-args "-c -j 3 -x 3 -s 3 -k 1M" \
            "$url"
    done
}
