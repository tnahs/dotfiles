#!/bin/zsh

###############################################################################
# Sets hotkeys found in 'Sysytem Preferences' > 'Keyboard'.
#
#
# -- AppleSymbolicHotKeys Structure
#
# <action:int> = Dict {
#     enabled = <enabled:bool>
#     value = Dict {
#         type = <type:string>
#         parameters = Array {
#             <0:int>
#             <1:int>
#             <2:int>
#         }
#     }
# }
#
#
# -- AppleSymbolicHotKeys Values
#
# action: The ID of action the hotkey will take.
#   enabled: Toggle enabled/disabled.
#   type: Always seems to be 'standard'.
#   parameters:
#     0: The ASCII code of the character or '65535' for non-ASCII characters.
#     1: AppleScript key code for the character.
#     2: The summed value of the modifier keys. See below.
#
# -- Base values for 'action:value:parameters:2'.
#
#         0 -> None
#    131072 -> Shift
#     26214 -> Control
#    524288 -> Option
#   1048576 -> Command
#
# Sum integers for key combinations. For example:
#
#   Command+Shift == 1048576+131072 == 1179648
#
#
# -- References
#
# https://stackoverflow.com/q/21878482
# https://krypted.com/mac-os-x/defaults-symbolichotkeys/
# https://web.archive.org/web/20141112224103/http://hintsforums.macworld.com/showthread.php?t=114785
#
###############################################################################


HOTKEYS_PLIST="$HOME/Library/Preferences/com.apple.symbolichotkeys.plist"


# -----------------------------------------------------------------------------
# Disable all default hotkeys found in 'Sysytem Preferences' > 'Keyboard'
# except for those associated with screeshots as defined in 'preserve_ids'.

#  28 - Save picture of screen as a file
#  30 - Save picture of selected area as a file
# 184 - Screenshot and recording options
# preserve_ids=(28 30 184)

for id in {0..200}; do

    # FIXME: This block doesn't seem to work...
    # Force-enable any 'id' that's in the 'preserve_ids' array.
    # Phew! https://stackoverflow.com/a/15394738
    # if [[ ${preserve_ids[(ie)$id]} -le ${#preserve_ids} ]]; then
    #     /usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:${id}:enabled true" $HOTKEYS_PLIST
    # fi

    # Many of the action ids don't exists there forePlistBuddy will complain
    # 'Set: Entry, [ENTRY], Does Not Exist' and skips executing the command.
    # These errors are silenced by '&> /dev/null'.
    /usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:${id}:enabled false" $HOTKEYS_PLIST &> /dev/null

done


# Screenshots -----------------------------------------------------------------

# Save picture of screen as a file - Command+Shift+3
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:28:enabled true" $HOTKEYS_PLIST

# Save picture of selected area as a file - Command+Shift+4
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:30:enabled true" $HOTKEYS_PLIST

# Screenshot and recording options - Command+Shift+5
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:184:enabled true" $HOTKEYS_PLIST


# Spaces ----------------------------------------------------------------------

# Move right a space - Command+Shift+D
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:79:enabled true" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:79:value:parameters:0 97" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:79:value:parameters:1 0" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:79:value:parameters:2 1179648" $HOTKEYS_PLIST

# Move left a space - Command+Shift+A
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:81:enabled true" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:81:value:parameters:0 100" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:81:value:parameters:1 2" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:81:value:parameters:2 1179648" $HOTKEYS_PLIST

# Switch to Desktop 1 - Command+1
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:118:enabled true" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:118:value:parameters:0 49" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:118:value:parameters:1 18" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:118:value:parameters:2 1048576" $HOTKEYS_PLIST

# Switch to Desktop 2 - Command+2
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:119:enabled true" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:119:value:parameters:0 50" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:119:value:parameters:1 19" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:119:value:parameters:2 1048576" $HOTKEYS_PLIST

# Switch to Desktop 3 - Command+3
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:120:enabled true" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:120:value:parameters:0 51" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:120:value:parameters:1 20" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:120:value:parameters:2 1048576" $HOTKEYS_PLIST

# Switch to Desktop 4 - Command+4
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:121:enabled true" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:121:value:parameters:0 52" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:121:value:parameters:1 21" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:121:value:parameters:2 1048576" $HOTKEYS_PLIST

# Switch to Desktop 5 - Command+5
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:122:enabled true" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:122:value:parameters:0 53" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:122:value:parameters:1 22" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:122:value:parameters:2 1048576" $HOTKEYS_PLIST

# Switch to Desktop 6 - Command+6
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:123:enabled true" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:123:value:parameters:0 54" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:123:value:parameters:1 23" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:123:value:parameters:2 1048576" $HOTKEYS_PLIST

# Switch to Desktop 7 - Command+7
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:124:enabled true" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:124:value:parameters:0 55" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:124:value:parameters:1 24" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:124:value:parameters:2 1048576" $HOTKEYS_PLIST

# Switch to Desktop 8 - Command+8
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:125:enabled true" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:125:value:parameters:0 56" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:125:value:parameters:1 25" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:125:value:parameters:2 1048576" $HOTKEYS_PLIST

# Switch to Desktop 9 - Command+9
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:126:enabled true" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:126:value:parameters:0 57" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:126:value:parameters:1 26" $HOTKEYS_PLIST
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:126:value:parameters:2 1048576" $HOTKEYS_PLIST

# /usr/libexec/PlistBuddy -c "Print :AppleSymbolicHotKeys" $HOTKEYS_PLIST
