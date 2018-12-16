# macOS 10.14 Mojave


## Back-up

1. Run Backup Script
   + Run: `~/dotfiles/scripts/mojave-backup.sh`
3. Save **Contacts**
    + Open **Contacts**
    + `Edit` > `Select All`
    + `File` > `Export...` > `Export vCard...`
    + Copy to `~/Workspace/preferences/private`
4. `git push` any [`tnahs/dotfiles`](https://github.com/tnahs/dotfiles) repository changes
5. Copy folders to external HDD:
    + `~/Workspace`
    + `~/Downloads`
    + `~/Dropbox`
    + `~/Pictures`
    + `~/Movies`
    + `~/Music`
6. Save **VSCode** Settings
   1. `Cmd + Shift + P`
   2. `Sync` > `Sync: Update / Upload Settings`


## Re-installation

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


## Restore


### Clone [`tnahs/dotfiles`](https://github.com/tnahs/dotfiles) repository

``` bash
git clone https://github.com/tnahs/dotfiles $HOME"/dotfiles"
```

### Setup dotfiles, install apps and configure Mojave

1. Initialize Mojave
   + Run: `$HOME"/dotfiles/scripts/mojave-init.sh"`
   + This script:
     + Creates symlinks from `~/dotfiles` to `~/` for:
       + `.bashrc`
       + `.bash_profile`
       + `.gitconfig`
       + `.gitignore`
       + `Brewfile`
     + Installs **Homebrew**
     + Installs apps found in `~/dotfiles/Brewfile`
     + Installs fonts
     + Set **Terminal** theme
     + Restores **Moom** preferences
     + Installs **VSCode** "Settings Sync" Extension
2.  Configure Mojave
     + Run: `$HOME"/dotfiles/scripts/mojave-config.sh"`
     + This script:
          + Sets global macOS preferences.
          + Forked from https://mths.be/macos

During install of **Homebrew**, the script should install **Command Line Tools**. If not, run:
``` bash
xcode-select --install
```
or install via [Command Line Tools](https://developer.apple.com/downloads/)


### Manual macOS Configurations

1. General
    + Recent items: None
2. Finder > Preferences
     + [ ] Recents
     + [x] AirDrop
     + [x] Applications
     + [x] Desktop
     + [x] Downloads
     + [x] Movies
     + [x] Music
     + [x] Pictures
     + [x] {USER FOLDER}
     + [ ] iCloud Drive
     + [x] {USER COMPUTER}
     + [x] Hard disks
     + [x] External disks
     + [ ] CDs, DVDs, and iPods
     + [ ] Bonjour computers
     + [ ] Connected Servers
     + [ ] Recent Tags
3. Trackpad
   + Point & Click
     + [x] Look up & data detectors: Tap with three fingers
     + [x] Seconday click: Click or tap with two fingers
     + [x] Tap to click
   + More Gestures
     + [x] Swipe between pages: Swipe with three fingers
4. Keyboard
     + Shortcuts
          + Setup Switch Spaces Hotkeys
4. Spotlight
   + Search Results
     + Disable all but:
       + [x] Applications
       + [x] Documents
       + [x] Folders
       + [x] Images
       + [x] Movies
       + [x] Music
       + [x] PDF Documents
       + [x] System Preferences
5. Terminal
   + Profiles
     + Text
          + [x] Antialias text
5. Users & Groups
   + Guest User
     + [ ] Allow guests to log in to this computer

TODO: Get these to work programatically!


### Restore Workspace

1. Restore folders from to external HDD
    + `~/Workspace`
    + `~/Downloads`
    + `~/Dropbox`
    + `~/Pictures`
    + `~/Movies`
    + `~/Music`


### Restore macOS App Configurations

1. Restore **VSCode** Settings
   1. Make sure [`Settings Sync`](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync) is installed
   2. `Cmd + Shift + P`
   3. `Sync` > `Sync: Download Settings`
   4. Enter `Github Personal Access Token` found in `~/Workspace/preferences/private/vscode-settings-sync-token.txt`
   5. Enter Gist ID: `d35243a837d404d545cb56144030f4ee`
2. Restore **Apple Books** EPUBs/Database via `~/Workspace/reading/apple-books/README.md`


### Manually Install

+ [Anki](https://apps.ankiweb.net/)
+ [Infovox iVox Voice Manager](http://www.assistiveware.com/product/infovox-ivox)
+ [DeDRM_tools](https://github.com/apprenticeharper/DeDRM_tools/releases/)
+ [Wacom Tablet Driver](https://www.wacom.com/en-us/support/product-support/drivers)
+ [Audacity](http://www.audacityteam.org/)
+ [Fusion360](https://www.autodesk.com/products/fusion-360/students-teachers-educators)
+ Adobe Digital Editions from `~/Workspace/preferences/misc/installers`
