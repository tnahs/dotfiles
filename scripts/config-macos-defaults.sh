#!/bin/zsh
# https://mths.be/macos


# -----------------------------------------------------------------------------
# ✓11.0   Confirmed working on macOS 11.x
# x11.0   Confirmed not work on macOS 11.x
# ?11.0   Unknown working status
#
# ✓UI     Configuration available via the UI
# xUI     Configuration unavailable via the UI
# ?UI     Unknown availability status
# -----------------------------------------------------------------------------


GLOBAL_PLIST=$HOME/Library/Preferences/.GlobalPreferences.plist
FINDER_PLIST=$HOME/Library/Preferences/com.apple.finder.plist
DOCK_PLUST=$HOME/Library/Preferences/com.apple.dock.plist


function config__finder {

    echo "Configuring Finder..."

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

    # ✓11.0 ✓UI : Hide drives on desktop
    defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
    defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
    defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
    defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

    # ✓11.0 ✓UI : Disable the warning when changing a file extension
    defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

    # ✓11.0 ✓UI : When performing a search, search the current folder by default
    # Possible values:
    #   SCev -> Search This Mac
    #   SCcf -> Search the Current Folder
    #   SCsp -> Use the Previous Search Scope
    defaults write com.apple.finder FXDefaultSearchScope -string SCcf

    # ✓11.0 ✓UI : Set home folder as default Finder window location
    # Possible values:
    #   PfDe -> Desktop
    #   PfDo -> Douments
    #   PfHm -> Home
    #   PfLo -> Other
    defaults write com.apple.finder NewWindowTarget -string PfHm
    defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

    # ✓11.0 xUI : Disable window animations e.g. when invoking 'Get Info'
    # defaults write com.apple.finder DisableAllAnimations -bool true

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

    # ✓11.0 ✓UI : Hide 'Recent Tags' from Finder window sidebar
    defaults write com.apple.finder ShowRecentTags -bool false

    # ✓11.0 xUI : Increase window resize speed for applications
    defaults write NSGlobalDomain NSWindowResizeTime -float 0.15

    # ✓11.0 xUI : Disable automatic termination of inactive apps
    defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

    # ✓11.0 ✓UI : Disable 'Resume' aka 'Saved Application State'
    defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

    # ✓11.0 xUI : Expand save panel by default
    defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
    defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

    # ✓11.0 xUI : Expand print panel by default
    defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
    defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

    # ✓11.0 xUI : Avoid creating .DS_Store files on network or USB volumes
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
    defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

    # ✓11.0 ✓UI : Disable 'Handoff'
    defaults -currentHost write com.apple.coreservices.useractivityd.plist ActivityReceivingAllowed -bool false
    defaults -currentHost write com.apple.coreservices.useractivityd.plist ActivityAdvertisingAllowed -bool false

    # ✓11.0 ✓UI : Show the ~/Library folder
    chflags nohidden ~/Library
    xattr -d com.apple.FinderInfo ~/Library

    # ✓11.0 xUI : Show the /Volumes folder
    sudo chflags nohidden /Volumes

    # ✓11.0 xUI : Clear recent folders
    # defaults delete com.apple.finder FXRecentFolders
    # defaults write com.apple.finder FXRecentFolders "({})"

    # ✓11.0 ?UI : Clear "Go to folder" history
    # defaults delete com.apple.finder GoToField
    # defaults delete com.apple.finder GoToFieldHistory

    # ✓11.0 ?UI : Clear recent places
    # defaults delete NSGlobalDomain NSNavRecentPlaces

    # ?11.0 xUI : Disable recent places
    # defaults write NSGlobalDomain NSNavRecentPlacesLimit -int 0
}


function config__finder_windows {

    echo "--------------------------------------------------------------------"
    echo " Some of the following commands might output a 'Does Not Exist'"
    echo " error when running on a fresh 'com.apple.finer.plist'. The Desktop,"
    echo " Trash and the 'Column View' in a Finder window have their own entry"
    echo " in the 'com.apple.finer.plist' which are not there by default."
    echo
    echo " In order to create these entries into the plist, the 'View Options'"
    echo " need to be invoked and modified for each item. This will trigger "
    echo " Finder to add a complete and valid dictionary entry into the plist"
    echo " for each item. Afterwards the following commands will no longer"
    echo " output the 'Does Not Exist' error."
    echo
    echo " The easiset way to invoke the 'View Options' is to focus the"
    echo " desired view, (e.g. click on the Desktop) and select 'View' >"
    echo " 'Show View Options'."
    echo "--------------------------------------------------------------------"

    # ✓11.0 ✓UI : Use list view in all Finder windows by default
    # Possible values:
    #   Nlsv -> List View
    #   icnv -> Icon Viwe
    #   clmv -> Column View
    #   Flwv -> Gallery View
    defaults write com.apple.finder FXPreferredViewStyle -string Nlsv
    defaults write com.apple.finder FXPreferredSearchViewStyle -string Nlsv
    /usr/libexec/PlistBuddy -c "Set :TrashViewSettings:CustomViewStyle Nlsv" $FINDER_PLIST

    # ✓11.0 ✓UI : Enable/Disable 'Show icon preview'
    /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:ListViewSettings:showIconPreview false" $FINDER_PLIST
    /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showIconPreview false" $FINDER_PLIST
    /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:ExtendedListViewSettingsV2:showIconPreview false" $FINDER_PLIST
    /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:GalleryViewSettings:showIconPreview true" $FINDER_PLIST
    /usr/libexec/PlistBuddy -c "Set :StandardViewOptions:ColumnViewOptions:ShowIconThumbnails false" $FINDER_PLIST
    /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showIconPreview true" $FINDER_PLIST

    # ✓11.0 ✓UI : Set column width for column view
    /usr/libexec/PlistBuddy -c "Set :StandardViewOptions:ColumnViewOptions:ColumnWidth 250" $FINDER_PLIST

    # ✓11.0 ✓UI : Enable snap-to-grid for icons views
    /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" $FINDER_PLIST
    /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" $FINDER_PLIST
    /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" $FINDER_PLIST

    # ✓11.0 ✓UI : Set Finder window sidebar width.
    /usr/libexec/PlistBuddy -c "Add :SidebarWidth integer 200" $FINDER_PLIST
    /usr/libexec/PlistBuddy -c "Set :SidebarWidth 200" $FINDER_PLIST

    echo "Deleting all .DS_Store files..."

    # Delete all .DS_Store files to reset Finder view settings
    sudo find /Volumes/Macintosh\ HD -name ".DS_Store" -delete
}



function config__dock__mission_control {

    echo "Configuring Dock & Mission Control..."

    # ✓11.0 ✓UI : Set the icon size
    defaults write com.apple.dock tilesize -int 96

    # ✓11.0 xUI : Remove the auto-hiding delay
    defaults write com.apple.dock autohide-delay -float 0

    # ✓11.0 xUI : Speed-up the auto-hiding animation
    defaults write com.apple.dock autohide-time-modifier -float 0.5

    # ✓11.0 ✓UI : Enable auto-hiding
    defaults write com.apple.dock autohide -bool true

    # ✓11.0 ✓UI : Don't show recent applications
    defaults write com.apple.dock show-recents -bool false

    # ✓11.0 ✓UI : Remove all default macOS apps from the Dock
    defaults delete com.apple.dock persistent-apps

    # ✓11.0 ✓UI : Don't automatically rearrange Spaces based on most recent use
    defaults write com.apple.dock mru-spaces -bool false

    # ✓11.0 ✓UI : Group windows by application
    defaults write com.apple.dock expose-group-apps -bool true

    # ✓11.0 ✓UI : Displays have separate Spaces
    defaults write com.apple.spaces spans-displays -bool false

    # ✓11.0 ✓UI : When switching to an application, don't switch the Spaces
    defaults write NSGlobalDomain AppleSpacesSwitchOnActivate -bool false
}


function config__power_management {

    echo "Configuring power management..."

    # ✓11.0 ✓UI : Sleeping on battery power
    sudo pmset -b sleep 30
    sudo pmset -b disksleep 30
    sudo pmset -b displaysleep 10

    # ✓11.0 ✓UI : Sleeping on charger power
    sudo pmset -c sleep 120
    sudo pmset -c disksleep 120
    sudo pmset -c displaysleep 120

    # ✓11.0 ✓UI : Disable screen dimming
    sudo pmset -a lessbright 0

    # ✓11.0 ✓UI : Disable Power Nap
    sudo pmset -a powernap 0

    # ✓11.0 xUI : Restart automatically on power loss
    sudo pmset -a autorestart 1

    # ✓11.0 xUI : Disable hibernation
    sudo pmset -a hibernatemode 0

    local SLEEPIMAGE=/private/var/vm/sleepimage

    # Remove the sleep image file to save disk space
    sudo rm -rf $SLEEPIMAGE

    # Create a zero-byte file instead...
    sudo touch $SLEEPIMAGE

    # ...and make sure it can't be rewritten
    sudo chflags uchg $SLEEPIMAGE

    # ✓11.0 xUI : Restart automatically if the computer freezes
    sudo systemsetup -setrestartfreeze on
}


function config__keyboard__mouse {

    echo "Configuring keyboard and mouse settings..."

    # TODO Set tap to click

    # ✓11.0 ✓UI : Disable "natural" scrolling direction
    defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

    # ✓11.0 ?UI : Disable press-and-hold for keys in favor of key repeat
    defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

    # ✓11.0 xUI : Faster keyboard repeat rate
    defaults write NSGlobalDomain KeyRepeat -int 1

    # ✓11.0 xUI : Faster initial keyboard repeat delay
    defaults write NSGlobalDomain InitialKeyRepeat -int 13

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
}


function config__misc_applications {

    echo "Configuring application settings..."

    # ✓11.0 ✓UI : Use plain text mode for new TextEdit documents
    defaults write com.apple.TextEdit RichText -int 0

    # TODO Set default font and size: JetBrains Mono Regular 18

    # ✓11.0 ?UI : Prevent Time Machine from prompting to use new hard drives as backup volume
    defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

    # ?11.0 ?UI : Prevent Photos from opening automatically when devices are plugged in
    # defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true
}


function config__privacy {

    echo "Configuring privacy settings..."

    # ✓11.0 ✓UI : Disable Siri
    defaults write com.apple.assistant.support.plist "Assistant Enabled" -bool false

    # ✓11.0 ✓UI : Remove Siri from the Menu Bar
    defaults write com.apple.Siri StatusMenuVisible -bool false

    # ✓11.0 ✓UI : Disable Personlized Ads
    defaults write com.apple.AdLib allowApplePersonalizedAdvertising -bool false
}


#


function run__pre {
    osascript -e 'tell application "System Preferences" to quit'

    # Ask for the administrator password upfront
    sudo -v

    # Keep-alive: update existing `sudo` time stamp until `config-macos-defaults.sh` has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
}


function run__post {
    killall Finder Dock
    echo "Configuration complete!"
    echo "Please restart for all changes to take effect."
}


function run__config_base {
    config__finder
    config__dock__mission_control
    config__power_management
    config__keyboard__mouse
    config__misc_applications
    config__privacy
}


function run__config_windows {
    config__finder_windows
}


function main {
    if [[ $# -lt 1 ]] then;
        run__pre
        run__config_base
        run__post
    elif [[ "$1" = "--windows" ]] then;
        run__pre
        run__config_base
        run__config_windows
        run__post
    elif [[ "$1" = "--windows-only" ]] then;
        run__pre
        run__config_windows
        run__post
    else
        echo "Unrecognized flag: ${1}"
        exit 2
    fi
}


main "$@"
