#!/usr/local/bin/bash

alias ll="ls -lah"
alias k="cd $HOME/Desktop; ls -lah;"
alias l="cd $HOME/Downloads; ls -lah;"
alias w="cd $HOME/Workspace; ls -lah;"
alias p="cd $HOME/Workspace/projects; ls -lah;"

alias editbash="code $HOME/.dotfiles/.bashrc"

alias brewski="brew update && brew upgrade && brew cleanup; brew doctor"

# ocr
alias ocreng="$HOME/bin/ocr-folder.sh english;"
alias ocrfr="$HOME/bin/ocr-folder.sh french;"
alias ocrjp="$HOME/bin/ocr-folder.sh japanese;"


# dotfiles
alias dotfiles="cd $HOME/.dotfiles; ls -lah;"

# anki
alias anki="cd $HOME/Workspace/projects/anki-setup; ls -lah;"

# pfolio
alias pfolio="cd $HOME/Workspace/projects/pfolio/pfolio/; pipenv shell;"

# hlts-data
alias hlts="cd $HOME/Workspace/projects/hlts-data/hlts-data/; pipenv shell;"

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