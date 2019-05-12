#!/usr/local/bin/bash

# List all
alias ll="ls -lah"

# Quick cd
alias k="cd $HOME/Desktop; ls -lah;"
alias l="cd $HOME/Downloads; ls -lah;"
alias w="cd $HOME/Workspace; ls -lah;"
alias p="cd $HOME/Workspace/projects; ls -lah;"

#

# Edit this file
alias editbash="code $HOME/.dotfiles/.bashrc"

#

# Open all TODO lists i.e. _[project-name]-todo.md
alias todo="find $HOME/Workspace/projects -name \_*-todo.* -exec code {} \;"

#

# dotfiles
alias dotfiles="cd $HOME/.dotfiles; ls -lah;"

# homebrew
alias brewski='brew update && brew upgrade && brew cleanup; brew doctor'

# anki
alias anki="cd $HOME/Workspace/projects/anki-setup; ls -lah;"

# ocr
alias ocreng="$HOME/bin/ocr-folder.sh english;"
alias ocrfr="$HOME/bin/ocr-folder.sh french;"
alias ocrjp="$HOME/bin/ocr-folder.sh japanese;"

# pfolio
alias pfolio="cd $HOME/Workspace/projects/pfolio/pfolio/; pipenv shell;"

# hlts
alias hlts="cd $HOME/Workspace/projects/hlts/hlts/; pipenv shell;"
alias hlts_code="code $HOME/Workspace/projects/hlts/"
alias hlts_serv="flask run"
alias hlts_gogo="hlts_code; hlts_serv;"

# hlts add-ons
alias hlts_applebooks="cd $HOME/Workspace/projects/hlts-applebooks/hlts-applebooks/; pipenv shell;"
alias hlts_kindle="cd $HOME/Workspace/projects/hlts-kindle/hlts-kindle/; pipenv shell;"

#

# Run mojave-backup.sh
alias backup_preferences="bash $HOME/.dotfiles/scripts/mojave-backup.sh preferences"
alias backup_dotfiles="bash $HOME/.dotfiles/scripts/mojave-backup.sh dotfiles"
alias backup_books="bash $HOME/.dotfiles/scripts/mojave-backup.sh books"
alias backup_anki="bash $HOME/.dotfiles/scripts/mojave-backup.sh anki"
alias backup_all="bash $HOME/.dotfiles/scripts/mojave-backup.sh all"

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