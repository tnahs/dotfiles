# dotfiles

## Install Homebrew

``` console
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

During installation, `Homebrew` should ask to install `Command Line Tools`. If not, run:

``` console
$ xcode-select --install
```

## Clone Repository

``` console
$ git clone https://github.com/tnahs/dotfiles ~/.dotfiles
```

## Rebuild

``` console
$ python3 ~/.dotfiles/scripts/rebuild.py --verbose
```

## Configure macOS

``` console
$ zsh ~/.dotfiles/scripts/defaults.sh
$ zsh ~/.dotfiles/scripts/hotkeys.sh
```

- `System Preferences` • `Keyboard`
    - In the `Keyboard` tab
        - Click `Modifier Keys...`
            - For every keyboard set `Caps Lock Key` to `Option`

## Disable SIP (Intel macOS 11.x)

1. Start up in Recovery Mode by holding down `command ⌘` + `R`.
2. In the menu bar, choose `Utilities`, then `Terminal`.
3. Run `csrutil disable --with kext --with dtrace --with nvram --with basesystem`
4. Reboot

[Disabling System Integrity Protection - yabai](https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection#how-do-i-disable-system-integrity-protection)

## Resources

- [Homebrew](https://brew.sh)
- [Command Line Tools - Apple Developer](https://developer.apple.com/downloads/)
