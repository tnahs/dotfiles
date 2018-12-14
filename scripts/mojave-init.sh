#!/usr/bin/env bash

# Connect .bashrc and .bash_profile to machine
ln -s $HOME"/Workspace/preferences/dotfiles/.bashrc" $HOME"/.bashrc"
ln -s $HOME"/Workspace/preferences/dotfiles/.bash_profile" $HOME"/.bash_profile"

# Connect .gitconfig and .gitignore to machine
ln -s $HOME"/Workspace/preferences/dotfiles/.gitconfig" $HOME"/.gitconfig"
ln -s $HOME"/Workspace/preferences/dotfiles/.gitignore" $HOME"/.gitignore"

# Restore apps with Homebrew
#   via. ~/Workspace/preferences/dotfiles/Brewfile
#   or https://github.com/tnahs/dotfiles/blob/master/Brewfile
ln -s $HOME"/Workspace/preferences/dotfiles/Brewfile" "~/Brewfile"
brew bundle