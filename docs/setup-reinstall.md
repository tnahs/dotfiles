# Re-installing macOS

## via Bootable USB

1. Create Bootable USB via https://support.apple.com/en-us/HT201372

   1. Download [macOS Catalina](https://apps.apple.com/us/app/macos-catalina/id1466841314?mt=12) Installer:

   2. Format USB Drive:
      + Name: `Untitled`
      + Format: `Mac OS Extended (Journaled)`
      + Scheme: `GUID Partition Map`

   3.  Create Bootable USB with:
        ``` zsh
        sudo /Applications/Install\ macOS\ Catalina.app/Contents/Resources/createinstallmedia --volume /Volumes/Untitled
        ```

2. Format and Install

   1. Plug in the Bootable USB
   2. Restart & hold down the **Option ⌥** key
   4. Select `Disk Utility` from the `macOS Utilities` window
   5. Format startup disk as `Mac OS Extended (Journaled)`
   6. Exit `Disk Utility`
   7. Select `Install macOS`


## via macOS Recovery

   1. Make sure there's WiFi available
   2. Restart & hold down the **Command ⌘ + Option ⌥ + R**
   3. Select `Disk Utility` from the `macOS Utilities` window
   4. Format startup disk as `Mac OS Extended (Journaled)`
   5. Exit `Disk Utility`
   6. Select `Install macOS`

# Resources

+ https://support.apple.com/en-us/HT201255
+ https://support.apple.com/en-us/HT204904