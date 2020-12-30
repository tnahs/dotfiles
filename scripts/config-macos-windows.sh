PREFERENCES_PLIST=$HOME/Downloads/com.apple.finder.plist

# All
/usr/libexec/PlistBuddy -c "Set :FK_SidebarWidth 200" $PREFERENCES_PLIST
/usr/libexec/PlistBuddy -c "Set :SidebarWidth 200" $PREFERENCES_PLIST

# (?) Computer View
/usr/libexec/PlistBuddy -c "Set :ComputerViewSettings:ExtendedListViewSettingsV2:showIconPreview false" $PREFERENCES_PLIST

# Desktop
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showIconPreview true" $PREFERENCES_PLIST

# (?) FK ----------------------------------------------------------------------

# Icon View
/usr/libexec/PlistBuddy -c "Set :FK_DefaultIconViewSettings:showIconPreview true" $PREFERENCES_PLIST

# List View
/usr/libexec/PlistBuddy -c "Set :FK_DefaultListViewSettingsV2:showIconPreview false" $PREFERENCES_PLIST
/usr/libexec/PlistBuddy -c "Set :FK_DefaultListViewSettingsV2:calculateAllSizes true" $PREFERENCES_PLIST

# Column View
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:ExtendedListViewSettingsV2:showIconPreview false" $PREFERENCES_PLIST
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:ExtendedListViewSettingsV2:calculateAllSizes true" $PREFERENCES_PLIST

# -----------------------------------------------------------------------------

# (?) Package View
/usr/libexec/PlistBuddy -c "Set :PackageViewSettings:ExtendedListViewSettingsV2:showIconPreview false" $PREFERENCES_PLIST
/usr/libexec/PlistBuddy -c "Set :PackageViewSettings:ExtendedListViewSettingsV2:calculateAllSizes true" $PREFERENCES_PLIST

# Search View
/usr/libexec/PlistBuddy -c "Set :SearchViewSettings:ExtendedListViewSettingsV2:showIconPreview false" $PREFERENCES_PLIST
/usr/libexec/PlistBuddy -c "Set :SearchViewSettings:ExtendedListViewSettingsV2:calculateAllSizes true" $PREFERENCES_PLIST
/usr/libexec/PlistBuddy -c "Set :SearchViewSettings:ListViewSettings:showIconPreview false" $PREFERENCES_PLIST
/usr/libexec/PlistBuddy -c "Set :SearchViewSettings:ListViewSettings:calculateAllSizes true" $PREFERENCES_PLIST

# Standard View
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:ExtendedListViewSettingsV2:showIconPreview false" $PREFERENCES_PLIST
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:ExtendedListViewSettingsV2:calculateAllSizes true" $PREFERENCES_PLIST
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:ListViewSettings:showIconPreview false" $PREFERENCES_PLIST
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:ListViewSettings:calculateAllSizes true" $PREFERENCES_PLIST
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showIconPreview false" $PREFERENCES_PLIST
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:GalleryViewSettings:showIconPreview true" $PREFERENCES_PLIST

# Trash View
/usr/libexec/PlistBuddy -c "Set :TrashViewSettings:ExtendedListViewSettingsV2:showIconPreview false" $PREFERENCES_PLIST
/usr/libexec/PlistBuddy -c "Set :TrashViewSettings:ExtendedListViewSettingsV2:calculateAllSizes true" $PREFERENCES_PLIST
/usr/libexec/PlistBuddy -c "Set :TrashViewSettings:ListViewSettings:showIconPreview false" $PREFERENCES_PLIST
/usr/libexec/PlistBuddy -c "Set :TrashViewSettings:ListViewSettings:calculateAllSizes true" $PREFERENCES_PLIST
/usr/libexec/PlistBuddy -c "Set :TrashViewSettings:IconViewSettings:showIconPreview true" $PREFERENCES_PLIST


# /usr/libexec/PlistBuddy -c "Print :ComputerViewSettings:ExtendedListViewSettingsV2:showIconPreview" false$HOME/Downloads/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :ComputerViewSettings:79:enabled true" $HOME/Downloads/com.apple.finder.plist
