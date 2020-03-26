# Re-install

1. Create Bootable USB via https://support.apple.com/en-us/HT201372
   1. Download [macOS Mojave](https://itunes.apple.com/tw/app/macos-mojave/id1398502828?l=en&mt=12)
   2. Format USB drive
      + Name: `Untitled`
      + Format: `Mac OS Extended (Journaled)`
      + Scheme: `GUID Partition Map`
   3.  Create bootable USB with:
        ```bash
        sudo /Applications/Install\ macOS\ Mojave.app/Contents/Resources/createinstallmedia --volume /Volumes/Untitled
        ```
2.  Format and Install
    1. Plug in the Bootable USB
    2. Restart & hold down the Option `⌥` key
    3. Choose `Install macOS Mojave`
    4. Select `Disk Utility` from the menu and format startup disk as `Mac OS Extended (Journaled)`
    5. Exit `Disk Utility`
    6. Select `Install macOS Mojave`