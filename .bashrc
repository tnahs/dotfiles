#!/usr/bin/env bash

export PATH=$PATH":$HOME/Library/Python/2.7/bin"
export PATH=$PATH":$HOME/Workspace/projects/bin"
export PATH=$PATH":/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Don't create Python binary files
export PYTHONDONTWRITEBYTECODE=1

# List all
alias ll="ls -lah"

# Quick cd
alias k="cd $HOME/Desktop; ls -lah;"
alias l="cd $HOME/Downloads; ls -lah;"
alias w="cd $HOME/Workspace; ls -lah;"
alias p="cd $HOME/Workspace/projects; ls -lah;"

#

# Edit this file
alias editbash="code $HOME/.bashrc"
# alias editbash="code $HOME/Workspace/preferences/dotfiles/.bashrc"

#

# Open all TODO lists i.e. _[project-name]-todo.md
alias todo="find $HOME/Workspace/projects -name \_*-todo.* -exec code {} \;"

# dotfiles
alias dotfiles="cd $HOME/Workspace/preferences/dotfiles"
alias dotfiles_code="dotfiles; code .;"

# hlts
alias hlts="cd $HOME/Workspace/projects/hlts/hlts/; pipenv shell;"
alias hlts_code="code $HOME/Workspace/projects/hlts/"
alias hlts_serv="flask run"
alias hlts_gogo="hlts_code; hlts_serv;"

# hlts-bsync
alias bsync="cd $HOME/Workspace/projects/hlts-bsync/hlts-bsync/; pipenv shell;"
alias bsync_code="code $HOME/Workspace/projects/hlts-bsync/hlts-bsync/"

#

# Run mojave-backup.sh
alias backup_all="bash $HOME/Workspace/preferences/dotfiles/scripts/mojave-backup.sh -all"
alias backup_anki="bash $HOME/Workspace/preferences/dotfiles/scripts/mojave-backup.sh -anki"
alias backup_reading="bash $HOME/Workspace/preferences/dotfiles/scripts/mojave-backup.sh -reading"
alias backup_preferences="bash $HOME/Workspace/preferences/dotfiles/scripts/mojave-backup.sh -preferences"

#

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

#

# Set prompt via http://bashrcgenerator.com
export PS1="\[\033[38;5;244m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;244m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;129m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\n\\$ \[$(tput sgr0)\]"