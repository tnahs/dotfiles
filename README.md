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
```

## Configure Visual Studio Code

The [Settings Sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync) extension be installed at this point.

In Visual Studio Code press ++command+shift+p++ to invoke the Command Palette. Type `sync` and select `Sync: Download Settings`.

## Resources

- [Homebrew](https://brew.sh)
- [Command Line Tools - Apple Developer](https://developer.apple.com/downloads/)
