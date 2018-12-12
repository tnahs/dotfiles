# Back-up

1. Run: `backup.sh`
2. Save Contacts
    + Edit > Select All
    + File > Export... > Export vCard...
    + Copy to `~/Workspace/preferences/private`
3. `gitpush` dotfile repository changes
4. Copy to External HDD
    + `~/Workspace`
    + `~/Pictures`
    + `~/Movies`
    + `~/Music`

# Re-installation

1. Create Bootable USB
   1. Download [macOS Mojave](https://itunes.apple.com/tw/app/macos-mojave/id1398502828?l=en&mt=12)
   2. Format USB drive with `Mac OS Extented (Journaled)` format
   3. Create bootable USB with
        ```bash
        sudo /Applications/Install\ macOS\ Mojave.app/Contents/Resources/createinstallmedia --volume /Volumes/Untitled --applicationpath /Applications/Install\ macOS\ Mojave.app --nointeraction
        ```
2. Format and Install your Mac
   1. Plug in the bootable USB
   2. Restart & hold down the Option(⌥) key
   3. Choose Install macOS Mojave(the bootable USB)
   4. Select Disk Utility from the menu and erase you Startup Disk(usually named Macintosh HD) with Mac OS Extended (Journaled)
   5. Go back to the main menu; select Install macOS and choose your HDD when prompted

# Restore

## Install homebrew
https://docs.brew.sh/

``` bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## Install Command Line Tools

``` bash
xcode-select --install
# sudo xcodebuild -license accept
```
or [Command Line Tools](https://developer.apple.com/downloads/)


## Restore



## Restore Workspace

1. Restore from to External HDD
    + `~/Workspace`
    + `~/Pictures`
    + `~/Movies`
    + `~/Music`

2. Copy `Brewfile` from `~/Workspace/preferences/dotfiles` to `$HOME` (or from [tnahs/dotfiles](https://github.com/tnahs/dotfiles))
3. Run `brew bundle`


## Manually Install

+ [Anki](https://apps.ankiweb.net/)
+ [Infovox iVox Voice Manager](http://www.assistiveware.com/product/infovox-ivox)
+ [DeDRM_tools](https://github.com/apprenticeharper/DeDRM_tools/releases/)
+ [Wacom Tablet Driver](https://www.wacom.com/en-us/support/product-support/drivers)
+ [Audacity](http://www.audacityteam.org/)

## Config macOS

1. Run: `config/config-Mojave.sh`