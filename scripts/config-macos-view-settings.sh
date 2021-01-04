PREFERENCES_PLIST=$HOME/Library/Preferences/com.apple.finder.plist

/usr/libexec/PlistBuddy -c "Set :SidebarWidth 200" $PREFERENCES_PLIST

# Standard View
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:ExtendedListViewSettingsV2:showIconPreview false" $PREFERENCES_PLIST
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:ExtendedListViewSettingsV2:calculateAllSizes true" $PREFERENCES_PLIST
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:ListViewSettings:showIconPreview false" $PREFERENCES_PLIST
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:ListViewSettings:calculateAllSizes true" $PREFERENCES_PLIST
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showIconPreview false" $PREFERENCES_PLIST
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:GalleryViewSettings:showIconPreview true" $PREFERENCES_PLIST

/usr/libexec/PlistBuddy -c "Set :StandardViewOptions:ColumnViewOptions:ColumnWidth 250" $PREFERENCES_PLIST
/usr/libexec/PlistBuddy -c "Set :StandardViewOptions:ColumnViewOptions:ShowIconThumbnails false" $PREFERENCES_PLIST

# Trash View
/usr/libexec/PlistBuddy -c "Set :TrashViewSettings:CustomViewStyle Nlsv" $PREFERENCES_PLIST

rm $HOME/Library/Preferences/com.apple.finder.plist
rm -rf $HOME/Library/Saved\ Application\ State/com.apple.finder.savedState

find /Volumes/Macintosh\ HD -name ".DS_Store" -delete
# find ~ -name ".DS_Store" -delete

killall Finder cfprefsd