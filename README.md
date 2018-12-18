# dotfiles (macOS 10.14 Mojave)


## A. Back-up


### Run Backup Script

``` bash
bash $HOME"/.dotfiles/scripts/mojave-backup.sh all
```
+ Backs up
     + dotfiles
          + `Brewfile`
          + **Moom** Preferences
     + App Preferences
          + **Photoshop** Preferences
          + **Safari** Bookmarks
     + All **Anki** Data
     + **Apple Books** EPUBs and Database

<br>

### Manually backup

1. Save **Contacts**
    + Open **Contacts**
    + `Edit` > `Select All`
    + `File` > `Export...` > `Export vCard...`
    + Copy to `~/Workspace/preferences/private`
2. Copy folders to external HDD:
    + `~/Workspace`
    + `~/Downloads`
    + `~/Dropbox`
    + `~/Pictures`
    + `~/Movies`
    + `~/Music`
3. Save **VSCode** Settings
   1. `Cmd + Shift + P`
   2. `Sync` > `Sync: Update / Upload Settings`
4. `git push` any [`tnahs/dotfiles`](https://github.com/tnahs/dotfiles) repository changes

<br>

## B. Re-installation

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

<br>

---

<br>

## Restore


### A. Install Homebrew

``` bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

via https://brew.sh

During install of **Homebrew**, the script should install **Command Line Tools**. If not, run:
``` bash
xcode-select --install
```
or install via https://developer.apple.com/downloads/

<br>

### B. Clone [`tnahs/dotfiles`](https://github.com/tnahs/dotfiles) repository

``` bash
git clone https://github.com/tnahs/dotfiles $HOME"/.dotfiles"
```

<br>

### C. Initialize Mojave

``` bash
bash $HOME"/.dotfiles/scripts/mojave-init.sh"
```

+ Creates symlinks from `~/.dotfiles` to `~/` for:
     + `.bashrc`
     + `.bash_profile`
     + `.gitconfig`
     + `.gitignore`
     + `Brewfile`
+ Installs apps found in `~/.dotfiles/Brewfile`
+ Installs fonts
+ Sets **Terminal** theme
+ Restores **Moom** preferences
+ Installs **VSCode** "Settings Sync" Extension

<br>

### D. Configure Mojave

``` bash
bash $HOME"/.dotfiles/scripts/mojave-config.sh"
```

+ Sets global macOS preferences.
+ Forked from https://mths.be/macos

<br>

### E. Manual Mojave Configurations

1. Finder > Preferences
   + Disable all but:
     + [x] AirDrop
     + [x] Applications
     + [x] Desktop
     + [x] Downloads
     + [x] Movies
     + [x] Music
     + [x] Pictures
     + [x] {USER FOLDER}
     + [x] {USER COMPUTER}
     + [x] Hard disks
     + [x] External disks
2. System Preferences
   1. General
      + Click in the scroll bar to: Jump to the spot that's clicked
      + Recent items: None
   2. Displays
      + Night Shift
        + Schedule
          + Sunset to Sunrise
      + Displays
        + Resolution
          + [x] Scaled
            + [x] More Space
   3. Trackpad
      + Point & Click
        + [x] Look up & data detectors: Tap with three fingers
        + [x] Tap to click
      + More Gestures
        + [x] Swipe between pages: Swipe with three fingers
   4. Keyboard
      + Shortcuts
        + Setup Switch Spaces Hotkeys
   5. Spotlight
      + Search Results
        + Disable all but:
          + [x] Applications
          + [x] Calculator
          + [x] Conversion
          + [x] Documents
          + [x] Folders
          + [x] Images
          + [x] Movies
          + [x] Music
          + [x] PDF Documents
          + [x] System Preferences
   6. Users & Groups
      + Guest User
        + [ ] Allow guests to log in to this computer
   7. Safari
      + Search > Smart Search Field:
        + [ ] Enable Quick Website Search
        + [ ] Preload Top Hit in the Background
      + Advanced
        + [x] Show Develop menu in menu bar
      + Websites > Notifications
        + [ ] Allow websites to ask for permission to send push notifications
   8. iCloud
      + Sign into iCloud
        + Disable all but:
          + [x] Contacts
          + [x] Calendars
          + [x] Safari
          + [x] Keychain
          + [x] Find My Mac


TODO: Get these to work programmatically!

<br>

### F. Restore Workspace

1. Restore folders from to external HDD
    + `~/Workspace`
    + `~/Downloads`
    + `~/Dropbox`
    + `~/Pictures`
    + `~/Movies`
    + `~/Music`

<br>

### G. Restore macOS App Configurations

1. Restore **VSCode** Settings
   1. Make sure [`Settings Sync`](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync) is installed
   2. `Cmd + Shift + P`
   3. `Sync` > `Sync: Download Settings`
   4. Enter `Github Personal Access Token` found in `~/Workspace/preferences/private/vscode-settings-sync-token.txt`
   5. Enter Gist ID: `d35243a837d404d545cb56144030f4ee`
2. Restore **Apple Books** EPUBs and Database via `~/Workspace/reading/apple-books/README.md`
3. Register **Moom** with license file in `~/Workspace/preferences/private/`
4. Setup **Dropbox**
5. Setup **Google Backup and Sync**

<br>

### H. Manually Install

+ [Adobe Creative Cloud](https://www.adobe.com/creativecloud/desktop-app.html)
+ [Anki](https://apps.ankiweb.net/)
  + Setup
  + Icon - `~/Workspace/preferences/misc/icons`
+ [Infovox iVox Voice Manager](http://www.assistiveware.com/product/infovox-ivox)
+ [DeDRM_tools](https://github.com/apprenticeharper/DeDRM_tools/releases/)
+ [Wacom Tablet Driver](https://www.wacom.com/en-us/support/product-support/drivers)
+ [Audacity](http://www.audacityteam.org/)
  + Icon - `~/Workspace/preferences/misc/icons`
+ [Fusion360](https://www.autodesk.com/products/fusion-360/students-teachers-educators)
+ Adobe Digital Editions from `~/Workspace/preferences/misc/installers`

<br>

### I. Check out

+ https://gif.ski