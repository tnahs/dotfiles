#!/usr/local/bin/bash

# navigation
alias ll="ls -lah"
alias k="cd $HOME/Desktop; ls -lah;"
alias l="cd $HOME/Downloads; ls -lah;"
alias w="cd $HOME/Workspace; ls -lah;"
alias p="cd $HOME/Workspace/projects; ls -lah;"

# homebrew
alias brewski="brew update && brew upgrade && brew cleanup; brew doctor"

# bash/dotfiles
alias dotfiles="cd $HOME/.dotfiles; ls -lah;"
alias editbash="code $HOME/.dotfiles/.bashrc $HOME/.dotfiles/.bash_profile"

# ocr
alias ocreng="$HOME/bin/ocr-folder.sh english;"
alias ocrfr="$HOME/bin/ocr-folder.sh french;"
alias ocrjp="$HOME/bin/ocr-folder.sh japanese;"

# backup
alias backup_preferences="bash $HOME/.dotfiles/scripts/mojave-backup.sh preferences"
alias backup_dotfiles="bash $HOME/.dotfiles/scripts/mojave-backup.sh dotfiles"
alias backup_books="bash $HOME/.dotfiles/scripts/mojave-backup.sh books"
alias backup_anki="bash $HOME/.dotfiles/scripts/mojave-backup.sh anki"
alias backup_all="bash $HOME/.dotfiles/scripts/mojave-backup.sh all"

# utilities

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"


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