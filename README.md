# Back-up

1. Run: `backup.sh`
2. Save Contacts
    + Edit > Select All
    + File > Export... > Export vCard...
    + Copy to `~/Workspace/preferences/private`
3. `gitpush` [tnahs/dotfiles](https://github.com/tnahs/dotfiles) repository changes
4. Copy to External HDD
    + `~/Workspace`
    + `~/Pictures`
    + `~/Movies`
    + `~/Music`

# Re-installation

1. Create Bootable USB
   1. Download [macOS Mojave](https://itunes.apple.com/tw/app/macos-mojave/id1398502828?l=en&mt=12)
   2. Format USB drive as `Mac OS Extented (Journaled)`
   3. Create bootable USB with
        ```bash
        sudo /Applications/Install\ macOS\ Mojave.app/Contents/Resources/createinstallmedia --volume /Volumes/Untitled --applicationpath /Applications/Install\ macOS\ Mojave.app --nointeraction
        ```
2. Format and Install
   1. Plug in the Bootable USB
   2. Restart & hold down the Option(⌥) key
   3. Choose Install macOS Mojave
   4. Select `Disk Utility` from the menu and format startup disk as `Mac OS Extented (Journaled)`
   5. Exit `Disk Utility`
   6. Select `Install macOS Mojave`

# Restore

## Install homebrew

``` bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

https://docs.brew.sh/

## Install Command Line Tools

``` bash
xcode-select --install
# sudo xcodebuild -license accept
```
or via. [Command Line Tools](https://developer.apple.com/downloads/)


## Restore Workspace

1. Restore from to External HDD
    + `~/Workspace`
    + `~/Pictures`
    + `~/Movies`
    + `~/Music`

2. Copy `Brewfile` from `~/Workspace/preferences/dotfiles` to `$HOME` (or from [tnahs/dotfiles](https://github.com/tnahs/dotfiles))
3. Run `brew bundle`
4. Restore `Apple Books` via `README.md` in `~/Workspace/reading/ibooks`


## Manually Install

+ [Anki](https://apps.ankiweb.net/)
+ [Infovox iVox Voice Manager](http://www.assistiveware.com/product/infovox-ivox)
+ [DeDRM_tools](https://github.com/apprenticeharper/DeDRM_tools/releases/)
+ [Wacom Tablet Driver](https://www.wacom.com/en-us/support/product-support/drivers)
+ [Audacity](http://www.audacityteam.org/)

## Config macOS

1. Run: `config/config-Mojave.sh`