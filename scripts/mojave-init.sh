#!/usr/bin/env bash


# Create synlinks to bashrc, .bash_profile, .gitconfig and .gitignore
#   via. ~/Workspace/preferences/dotfiles/
#   or https://github.com/tnahs/dotfiles/
ln -s $HOME"/Workspace/preferences/dotfiles/.bashrc" $HOME"/.bashrc"
ln -s $HOME"/Workspace/preferences/dotfiles/.bash_profile" $HOME"/.bash_profile"
ln -s $HOME"/Workspace/preferences/dotfiles/.gitconfig" $HOME"/.gitconfig"
ln -s $HOME"/Workspace/preferences/dotfiles/.gitignore" $HOME"/.gitignore"


# Restore apps with Homebrew
#   via. ~/Workspace/preferences/dotfiles/Brewfile
#   or https://github.com/tnahs/dotfiles/blob/master/Brewfile
ln -s $HOME"/Workspace/preferences/dotfiles/Brewfile" $HOME"/Brewfile"
cd && brew bundle


# Install fonts
#   via. ~/Workspace/preferences/dotfiles/fonts/
#   or https://github.com/tnahs/dotfiles/fonts
find $HOME"/Workspace/preferences/dotfiles/fonts" \
    \( -name "*.ttf" -or -name "*.otf" \) \
    -exec cp -v {} $HOME"/Library/Fonts" \;


# Set Terminal theme
osascript <<EOD

    set themeName to "Pro"
    set fontName to "Source Code Pro"
    set fontSize to "13"

	tell application "Terminal"

		set default settings to settings set themeName
		set font name of default settings to fontName
		set font size of default settings to fontSize

	end tell

EOD

# Restore Moom preferences
#   via ~/Workspace/preferences/dotfiles/moom/com.manytricks.Moom.plist
#   or https://github.com/tnahs/dotfiles/blob/master/moom/com.manytricks.Moom.plist
cp -f $HOME"/Workspace/preferences/dotfiles/moom/com.manytricks.Moom.plist" \
    $HOME"/Library/Preferences"


# Install VSCodde Settings Sync Extension
code --install-extension Shan.code-settings-sync