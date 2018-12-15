# macOS 10.14 Mojave


## Back-up

1. Run Backup Script
   + Run: `mojave-backup.sh`
     + via `~/Workspace/preferences/dotfiles/scripts/mojave-backup.sh`
     + or [`tnahs/dotfiles/scripts/mojave-backup.sh`](https://github.com/tnahs/dotfiles/blob/master/scripts/mojave-backup.sh)
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


### Install homebrew

``` bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

via https://docs.brew.sh/


### Install Command Line Tools

During install of Homebrew, the script will kindly detect that you have not yet installed Xcode Command Line Tools, and pop up a dialog asking if you want to install it. Yes, you do.

If not, run:
``` bash
xcode-select --install
```
or install via [Command Line Tools](https://developer.apple.com/downloads/)


### Restore Workspace

1. Restore folders from to external HDD
    + `~/Workspace`
    + `~/Downloads``~/Dropbox`
    + `~/Pictures`
    + `~/Movies`
    + `~/Music`


### Restore dotfiles and macOS Apps

1. Initialize Mojave
   + Run: `mojave-init.sh`
     + via `~/Workspace/preferences/dotfiles/scripts/mojave-init.sh`
     + or [`tnahs/dotfiles/scripts/mojave-init.sh`](https://github.com/tnahs/dotfiles/blob/master/scripts/mojave-init.sh)
   + This script:
     + Creates symlinks from `~/Workspace/preferences/dotfiles` to `~/` for:
       + `.bashrc`
       + `.bash_profile`
       + `.gitconfig`
       + `.gitignore`
     + Installs all apps found in `~/Workspace/preferences/dotfiles/Brewfile`
1.  Configure Mojave
    + Run: `mojave-config.sh`
      + via `~/Workspace/preferences/dotfiles/scripts/mojave-config.sh`
      + or [`tnahs/dotfiles/scripts/mojave-config.sh`](https://github.com/tnahs/dotfiles/blob/master/scripts/mojave-config.sh)
    + Sets global macOS preferences. Forked from https://mths.be/macos


### Restore macOS App Configurations

1. Restore **Apple Books** EPUBs/Database via `~/Workspace/reading/ibooks/README.md`
2. Restore **VSCode** Settings
   1. Install [`Settings Sync`](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync) from Extensions Manager
      + or via `code --install-extension Shan.code-settings-sync`
   2. `Cmd + Shift + P`
   3. `Sync` > `Sync: Download Settings`
   4. Enter `Github Personal Access Token` found in `~/Workspace/preferences/private/vscode-settings-sync-token.txt`
   5. Enter Gist ID: `d35243a837d404d545cb56144030f4ee`


### Manually Install

+ [Anki](https://apps.ankiweb.net/)
+ [Infovox iVox Voice Manager](http://www.assistiveware.com/product/infovox-ivox)
+ [DeDRM_tools](https://github.com/apprenticeharper/DeDRM_tools/releases/)
+ [Wacom Tablet Driver](https://www.wacom.com/en-us/support/product-support/drivers)
+ [Audacity](http://www.audacityteam.org/)
+ [Fusion360](https://www.autodesk.com/products/fusion-360/students-teachers-educators)# Video
+ Adobe Digital Editions from `~/Workspace/preferences/misc/installers`