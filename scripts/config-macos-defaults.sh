#!/bin/zsh

# Forked from: https://mths.be/macos

# Close any open System Preferences panes, to prevent them from overriding
# settings we're about to change
osascript -e "tell application "System Preferences" to quit"

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.defaults.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Finder                                                                      #
###############################################################################

# ✓11.0 (default): Set sidebar icon size to medium.
# defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# ✓11.0 (UI) Show status bar.
defaults write com.apple.finder ShowStatusBar -bool true

# ✓11.0 (UI) Show path bar.
defaults write com.apple.finder ShowPathbar -bool true

# ✓11.0 (UI) Always show scrollbars.
# Possible values: WhenScrolling, Automatic, Always
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# TODO: Set columns in all folders

# TODO: Disable icon preview

# ✓11.0 (UI) Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# ✓11.0 (UI) Show filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# ✓11.0 (UI) Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# ✓11.0 (UI) Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# ✓11.0 (UI)  When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# ✓11.0 Remove Finder window title title rollover delay
defaults write NSGlobalDomain NSToolbarTitleViewRolloverDelay -float 0

# ✓11.0 Display full POSIX path in Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# ✓11.0 Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# ✓11.0 Shorten the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0.5

# ✓11.0 Use list view in all Finder windows by default
# Possible values: Nlsv, icnv, clmv, Flwv
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# This might require deleting all .DS_Store files to see changes.
# sudo find / -name '.DS_Store' -delete; killall Finder

# ?11.0 Disable recent places
# defaults write NSGlobalDomain NSNavRecentPlacesLimit -int 0

# ✓11.0 Delete recent places
defaults delete NSGlobalDomain NSNavRecentPlaces

# ✓11.0 Delete recent folders
defaults write com.apple.finder FXRecentFolders "({})"

# ✓11.0 Delete "Go to folder" history
defaults delete com.apple.finder GoToField
defaults delete com.apple.finder GoToFieldHistory

# ✓11.0 Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# ✓11.0 Set ~/ as default finder window location.
# PfDe : Desktop
# PfDo : Douments
# PfHm : Home
# PfLo : Other
defaults write com.apple.finder NewWindowTarget -string "PfHm"

# For other paths use:
# defaults write com.apple.finder NewWindowTarget -string "PfLo"
# defaults write com.apple.finder NewWindowTargetPath -string "file://absolute/path/"

# ✓11.0 (UI) Show the ~/Library folder
chflags nohidden ~/Library
xattr -d com.apple.FinderInfo ~/Library

# ✓11.0 Show the /Volumes folder
sudo chflags nohidden /Volumes

# ✓11.0 Increase window resize speed for applications
defaults write NSGlobalDomain NSWindowResizeTime -float .15

# ✓11.0 Disable window animations e.g. when invoking "Get Info"
defaults write com.apple.finder DisableAllAnimations -bool true

# ✓11.0 Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# ✓11.0 Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# ?11.0 Disable Resume system-wide
# defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# ?11.0 Sets default save target to be a local disk, not iCloud.
# defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

###############################################################################
# Energy                                                                      #
###############################################################################

# pmset Documentation
# https://ss64.com/osx/pmset.html

# Display system-wide power settings
# pmset -g

# ✓11.0 Disable hibernation (speeds up entering sleep mode)
sudo pmset -a hibernatemode 0

# ✓11.0 Remove the sleep image file to save disk space
sudo rm /private/var/vm/sleepimage

# ✓11.0 Create a zero-byte file instead…
sudo touch /private/var/vm/sleepimage

# ✓11.0 …and make sure it can't be rewritten
sudo chflags uchg /private/var/vm/sleepimage

# ✓11.0 Restart automatically on power loss
sudo pmset -a autorestart 1

# ✓11.0 Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

###############################################################################
# Keyboard / Mouse                                                            #
###############################################################################

# ✓11.0 (UI) Disable “natural” scrolling direction
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# ✓11.0 Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# ✓11.0 Faster keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1

# ✓11.0 Faster initial keyboard repeat delay (might require restart)
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# ✓11.0 (UI) Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# ✓11.0 (UI) Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# ✓11.0 (UI) Disable automatic period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# ✓11.0 (UI) Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# ✓11.0 (UI) Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

###############################################################################
# Screenshots                                                                 #
###############################################################################

# ✓11.0 Save screenshots to the Downloads
defaults write com.apple.screencapture location -string "${HOME}/Downloads"

# ✓11.0 Save screenshots in PNG format
# Possible values: bmp, gif, jpg, pdf, tiff
defaults write com.apple.screencapture type -string "png"

# ✓11.0 Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

###############################################################################
# Dock / Spaces                                                               #
###############################################################################

# ✓11.0 Set the icon size of Dock items
defaults write com.apple.dock tilesize -int 128

# ✓11.0 Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0

# ✓11.0 Speed-up the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0.5

# ✓11.0 (UI) : Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# ✓11.0 (UI) : Don't show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# ✓11.0 (UI) : Don't automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

###############################################################################
# Applications                                                                #
###############################################################################

# ?11.0 Prevent Time Machine from prompting to use new hard drives as backup volume
# defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# ✓11.0 Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# ?11.0 Prevent Photos from opening automatically when devices are plugged in
# defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

###############################################################################
# Misc                                                                        #
###############################################################################

# ?11.0 Increase sound quality for Bluetooth headphones/headsets
# defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

echo "Configuration Done!"
echo "Note that some of these changes require a logout/restart to take effect."