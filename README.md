# macOS 10.14 Mojave

## Back-up

1. Run: `backup.sh`
2. Save Contacts
    + Edit > Select All
    + File > Export... > Export vCard...
    + Copy to `~/Workspace/preferences/private`
3. `git push` any [tnahs/dotfiles](https://github.com/tnahs/dotfiles) repository changes
4. Copy folders to external HDD:
    + `~/Workspace`
    + `~/Pictures`
    + `~/Movies`
    + `~/Music`
5. VSCode
   1. `Cmd + Shift + P`
   2. `Sync` > `Sync: Update / Upload Settings`

## Re-installation

1. Create Bootable USB
   1. Download [macOS Mojave](https://itunes.apple.com/tw/app/macos-mojave/id1398502828?l=en&mt=12)
   2. Format USB drive as `Mac OS Extended (Journaled)`
   3. Create bootable USB with
        ```bash
        sudo /Applications/Install\ macOS\ Mojave.app/Contents/Resources/createinstallmedia --volume /Volumes/Untitled --applicationpath /Applications/Install\ macOS\ Mojave.app --nointeraction
        ```
2. Format and Install
   1. Plug in the Bootable USB
   2. Restart & hold down the Option(⌥) key
   3. Choose Install macOS Mojave
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
or install via. [Command Line Tools](https://developer.apple.com/downloads/)


### Restore Workspace

1. Restore folders from to external HDD
    + `~/Workspace`
    + `~/Pictures`
    + `~/Movies`
    + `~/Music`
2. Restore apps with `Homebrew`
   1. Locate latest `Brewfile':
      + [tnahs/dotfiles/Brewfile](https://github.com/tnahs/dotfiles/blob/master/Brewfile)
      + `~/Workspace/preferences/dotfiles/Brewfile`
   2. Copy `Brewfile` to `~/`
   3. In Terminal run: `brew bundle`
3. Restore `Apple Books` via `README.md` in `~/Workspace/reading/ibooks`
4. `VSCode`
   1. `Cmd + Shift + P`
   2. `Sync` > `Sync: Download Settings`

### Manually Install

+ [Anki](https://apps.ankiweb.net/)
+ [Infovox iVox Voice Manager](http://www.assistiveware.com/product/infovox-ivox)
+ [DeDRM_tools](https://github.com/apprenticeharper/DeDRM_tools/releases/)
+ [Wacom Tablet Driver](https://www.wacom.com/en-us/support/product-support/drivers)
+ [Audacity](http://www.audacityteam.org/)

### Config macOS

1. Run: `config/config-Mojave.sh`
