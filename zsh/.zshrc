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
alias reload-zshrc="source $HOME/.dotfiles/zsh/.zshrc"
alias scripts="cd $HOME/.dotfiles/scripts"
alias dotfiles="cd $HOME/.dotfiles && code ."

# skhd
# https://github.com/koekeishiya/skhd
alias reload-skhd="skhd -r"

# yabai
# https://github.com/koekeishiya/yabai
alias reload-yabai="launchctl kickstart -k 'gui/${UID}/homebrew.mxcl.yabai'"

# Wiki
alias wiki="cd $HOME/Workspace/wiki && code ."
alias wiki-public="cd $HOME/Workspace/wiki-public && code ."


function meta-show {
    exiftool -G -s "$@"
}


function meta-strip-all {
    for item in "$@"; do
        exiftool -overwrite_original -all= "$item"
    done
}


function meta-strip-keywords {
    for item in "$@"; do
        exiftool -overwrite_original -Subject= -\*Keywords\*= "$item"
    done
}


function make-executable {
    chmod u+x "$@"
}


function spotlight-enable {
    mdutil -i on "$@"
}


function spotlight-disable {
    mdutil -i off -d "$@"
}


function spotlight-rebuild {
    mdutil -E "$@"
}


function clear-dsstore {
    find . -type f -name '.DS_Store' -ls -delete
}


function clear-history {
    local HISTSIZE=0
}


function restart-tablet {
    pkill "WacomTabletDriver"
    open "/Library/Application Support/Tablet/WacomTabletDriver.app"
}


function rip {
    for url in "$@"; do
        youtube-dl \
            --verbose \
            --force-ipv4 \
            --sleep-interval 5 \
            --max-sleep-interval 30 \
            --ignore-errors \
            --no-continue \
            --no-overwrites \
            --add-metadata \
            --all-subs \
            --sub-format "srt" \
            --embed-subs \
            --merge-output-format "mkv" \
            --output "%(uploader)s - %(upload_date)s - %(title)s [%(id)s].%(ext)s" \
            --external-downloader aria2c \
            --external-downloader-args "-c -j 3 -x 3 -s 3 -k 1M" \
            "$url"
    done
}


function ripu {
    for url in "$@"; do
        youtube-dl \
            --verbose \
            --force-ipv4 \
            --sleep-interval 5 \
            --max-sleep-interval 30 \
            --ignore-errors \
            --no-continue \
            --no-overwrites \
            --add-metadata \
            --all-subs \
            --sub-format "srt" \
            --embed-subs \
            --merge-output-format "mkv" \
            --output "%(uploader)s/%(upload_date)s - %(title)s [%(id)s].%(ext)s" \
            --external-downloader aria2c \
            --external-downloader-args "-c -j 3 -x 3 -s 3 -k 1M" \
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
