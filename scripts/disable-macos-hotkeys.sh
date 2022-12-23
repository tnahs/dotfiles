#!/bin/zsh


HOTKEYS_PLIST=$HOME/Library/Preferences/com.apple.symbolichotkeys.plist


# Disable all default hotkeys found in 'Sysytem Preferences' > 'Keyboard'.
function disable_macos_hotkeys {
    for id in {0..200}; do
        # Many of the action ids don't exists therefore PlistBuddy will
        # complain, print 'Set: Entry, [ENTRY], Does Not Exist' and skip
        # executing the command. These errors are silenced by '&> /dev/null'.
        /usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:${id}:enabled false" $HOTKEYS_PLIST &> /dev/null
    done
}


function main {
    disable_macos_hotkeys
}


main
