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

## Resources

- [Homebrew](https://brew.sh)
- [Command Line Tools - Apple Developer](https://developer.apple.com/downloads/)
