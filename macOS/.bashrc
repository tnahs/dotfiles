#!/usr/bin/env bash

export PATH=$PATH":$HOME/Library/Python/2.7/bin"
export PATH=$PATH":$HOME/Workspace/projects/bin"
export PATH=$PATH":/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

#  don't create Python binary files
export PYTHONDONTWRITEBYTECODE=1

# list all
alias ll="ls -lah"

# quick cd
alias k="cd $HOME/Desktop; ls -lah;"
alias l="cd $HOME/Downloads; ls -lah;"
alias w="cd $HOME/Workspace/; ls -lah;"
alias p="cd $HOME/Workspace/projects/; ls -lah;"

#

alias editbash="code $HOME/.bashrc"

# _[project-name]-todo.md
alias todo="find $HOME/Workspace/projects -name \_*-todo.* -exec code {} \;"

# hlts
alias hlts="cd $HOME/Workspace/projects/hlts/hlts/; pipenv shell;"
alias hlts_code="code $HOME/Workspace/projects/hlts/"
alias hlts_serv="flask run"
alias hlts_gogo="hlts_code; hlts_serv;"

# bsync
alias bsync="cd $HOME/Workspace/projects/hlts/hlts-bsync/; pipenv shell;"
alias bsync_code="code $HOME/Workspace/projects/hlts/hlts-bsync/"

# backup
alias backup_all="bash $HOME/Workspace/preferences/macOS/backup.sh -all"
alias backup_anki="bash $HOME/Workspace/preferences/macOS/backup.sh -anki"
alias backup_reading="bash $HOME/Workspace/preferences/macOS/backup.sh -reading"
alias backup_preferences="bash $HOME/Workspace/preferences/macOS/backup.sh -preferences"

#

# recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

#

# set prompt colors
reset=$(tput sgr0);
blue=$(tput setaf 33);
white=$(tput setaf 15);
gray=$(tput setaf 243);

# set prompt
PS1="\[${gray}\]\u";        # username
PS1+="\[${white}\]@";       # @
PS1+="\[${gray}\]\h";       # host
PS1+="\[${white}\] in ";    # in
PS1+="\[${blue}\]\W";       # directory
PS1+="\n";                  #
PS1+="\[${white}\]\$ "      # $
PS1+="\[${reset}\]";        #
export PS1;