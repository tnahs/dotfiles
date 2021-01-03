#!/bin/zsh

# ~/Library/Preferences/com.apple.finder.plist
# ~/Library/Preferences/com.apple.dock.plist
# ~/Library/Preferences/.GlobalPreferences.plist

# Forked from: https://mths.be/macos

osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.defaults.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# -----------------------------------------------------------------------------
# Finder
# -----------------------------------------------------------------------------

# ✓11.0 ✓UI : Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# ✓11.0 ✓UI : Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# ✓11.0 ✓UI : Show tab bar
defaults write com.apple.finder NSWindowTabbingShoudShowTabBarKey-com.apple.finder.TBrowserWindow -bool true

# ✓11.0 ✓UI : Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# ✓11.0 xUI : Display full POSIX path in Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# ✓11.0 ✓UI : Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# ✓11.0 ✓UI : Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# ✓11.0 ✓UI : When performing a search, search the current folder by default
# Possible values:
#   SCev Search This Mac
#   SCcf Search the Current Folder
#   SCsp Use the Previous Search Scope
defaults write com.apple.finder FXDefaultSearchScope -string SCcf

# ✓11.0 xUI : Use list view in all Finder windows by default
# Possible values:
#   Nlsv List View
#   icnv Icon Viwe
#   clmv Column View
#   Flwv Gallery View
defaults write com.apple.finder FXPreferredViewStyle -string Nlsv

# ✓11.0 ✓UI : Set ~ as default finder window location
# Possible values:
#   PfDe Desktop
#   PfDo Douments
#   PfHm Home
#   PfLo Other
defaults write com.apple.finder NewWindowTarget -string PfHm
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# ✓11.0 xUI : Disable window animations e.g. when invoking 'Get Info'
defaults write com.apple.finder DisableAllAnimations -bool true

# ✓11.0 ✓UI : Show filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# ✓11.0 ✓UI : Always show scrollbars
# Possible values:
#   WhenScrolling
#   Automatic
#   Always
defaults write NSGlobalDomain AppleShowScrollBars -string Always

# ✓11.0 ✓UI : Click in the scroll bar to jump to the spot that's clicked
defaults write NSGlobalDomain AppleScrollerPagingBehavior -bool true

# ✓11.0 ✓UI : Hide desktop icons
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

# TODO Other sidebar items...
# ~/Library/Application Support/com.apple.sharedfilelist
defaults write com.apple.finder ShowRecentTags -bool false

# ✓11.0 xUI : Increase window resize speed for applications
defaults write NSGlobalDomain NSWindowResizeTime -float .15

# ?11.0 xUI :
# defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# ✓11.0 xUI : Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# ✓11.0 xUI : Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# ✓11.0 xUI : Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# ?11.0 ?UI : Disable Resume system-wide
# defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# ✓11.0 ✓UI : Disable Handoff
defaults -currentHost write com.apple.coreservices.useractivityd.plist ActivityReceivingAllowed -bool false
defaults -currentHost write com.apple.coreservices.useractivityd.plist ActivityAdvertisingAllowed -bool false

# ✓11.0 ✓UI : Show the ~/Library folder
chflags nohidden ~/Library
xattr -d com.apple.FinderInfo ~/Library

# ✓11.0 xUI : Show the /Volumes folder
sudo chflags nohidden /Volumes

# -----------------------------------------------------------------------------
# Finder Extras
# -----------------------------------------------------------------------------

# ✓11.0 xUI : Delete recent folders
# defaults write com.apple.finder FXRecentFolders "({})"
# defaults delete com.apple.finder FXRecentFolders

# ✓11.0 xUI : Delete "Go to folder" history
# defaults delete com.apple.finder GoToField
# defaults delete com.apple.finder GoToFieldHistory

# ✓11.0 xUI : Delete recent places
# defaults delete NSGlobalDomain NSNavRecentPlaces

# ?11.0 ?UI : Disable recent places
# defaults write NSGlobalDomain NSNavRecentPlacesLimit -int 0

# -----------------------------------------------------------------------------
# Dock / Mission Control/ Spaces
# -----------------------------------------------------------------------------

# ✓11.0 ✓UI : Set the icon size
defaults write com.apple.dock tilesize -int 128

# ✓11.0 xUI : Remove the auto-hiding delay
defaults write com.apple.dock autohide-delay -float 0

# ✓11.0 xUI : Speed-up the auto-hiding animation
defaults write com.apple.dock autohide-time-modifier -float 0.5

# ✓11.0 ✓UI : Enable auto-hiding
defaults write com.apple.dock autohide -bool true

# ✓11.0 ✓UI : Don't show recent applications
defaults write com.apple.dock show-recents -bool false

# ✓11.0 ✓UI :
defaults delete com.apple.dock persistent-apps

# ✓11.0 ✓UI : Don't automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# ✓11.0 ✓UI :
defaults write com.apple.dock expose-group-apps -bool true

# ✓11.0 ✓UI :
defaults write com.apple.spaces spans-displays -bool true

# ✓11.0 ✓UI :
defaults write NSGlobalDomain AppleSpacesSwitchOnActivate -bool false

# -----------------------------------------------------------------------------
# Energy
# -----------------------------------------------------------------------------

# pmset Documentation
# https://ss64.com/osx/pmset.html

# Display system-wide power settings
# pmset -g

# ✓11.0 xUI : Restart automatically on power loss
sudo pmset -a autorestart 1

# ✓11.0 xUI : Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

# ✓11.0 xUI : Disable hibernation (speeds up entering sleep mode)
sudo pmset -a hibernatemode 0

# Remove the sleep image file to save disk space
sudo rm /private/var/vm/sleepimage

# Create a zero-byte file instead…
sudo touch /private/var/vm/sleepimage

# …and make sure it can't be rewritten
sudo chflags uchg /private/var/vm/sleepimage

# -----------------------------------------------------------------------------
# Keyboard / Mouse
# -----------------------------------------------------------------------------

# ✓11.0 ✓UI : Disable “natural” scrolling direction
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# ✓11.0 ?UI : Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# ✓11.0 xUI : Faster keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1

# ✓11.0 xUI : Faster initial keyboard repeat delay (might require restart)
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# ✓11.0 ✓UI : Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# ✓11.0 ✓UI : Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# ✓11.0 ✓UI : Disable automatic period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# ✓11.0 ✓UI : Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# ✓11.0 ✓UI : Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# ✓11.0 ✓UI : Disable automatic text completion
defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false

# -----------------------------------------------------------------------------
# Siri
# -----------------------------------------------------------------------------

# ✓11.0 ✓UI :
defaults write com.apple.assistant.support.plist "Assistant Enabled" -bool false

# ✓11.0 ✓UI :
defaults write com.apple.Siri StatusMenuVisible -bool false

# -----------------------------------------------------------------------------
# Applications
# -----------------------------------------------------------------------------

# ?11.0 ?UI : Prevent Time Machine from prompting to use new hard drives as backup volume
# defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# ✓11.0 ?UI : Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# ?11.0 ?UI : Prevent Photos from opening automatically when devices are plugged in
# defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# -----------------------------------------------------------------------------
# Misc
# -----------------------------------------------------------------------------

# ?11.0 ?UI : Increase sound quality for Bluetooth headphones/headsets
# defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# This might require deleting all .DS_Store files to see changes.
sudo find /Volumes/Macintosh\ HD -name ".DS_Store" -delete

killall Finder

echo "Configuration Done!"
echo "Note that some of these changes require a logout/restart to take effect."