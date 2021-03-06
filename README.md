# dotfiles

## Install Homebrew

```console
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

During installation, `Homebrew` should ask to install `Command Line Tools`. If not, run:

```console
$ xcode-select --install
```

## Clone Repository

```console
$ git clone https://github.com/tnahs/dotfiles ~/.dotfiles
```

## Setup Home

```console
$ ~/.dotfiles/scripts/setup-home.sh
```

## Install Brewfile

```console
$ ~/.dotfiles/scripts/install-brewfile.sh
```

## Install Python

``` console
$ ~/.dotfiles/scripts/install-pipx-packages.sh
$ ~/.dotfiles/scripts/install-python.sh [VERSION ...]
```

## Config macOS

```console
$ ~/.dotfiles/scripts/config-macos-defaults.sh
```

## Restore Applications

```console
$ ~/.dotfiles/scripts/restore-apple-books-library.sh PATH_TO_LIBRARY_ARCHIVE
$ ~/.dotfiles/scripts/restore-anki-collection.sh PATH_TO_COLLECTION_ARCHIVE
```

## Misc Installs

- Eagle
- Affinity Photo
- Affinity Designer

<!--
## Disable SIP (Intel macOS 11.x)

1. Start up in Recovery Mode by holding down `command ⌘` + `R`.
2. In the menu bar, choose `Utilities`, then `Terminal`.
3. Run `csrutil disable --with kext --with dtrace --with nvram --with basesystem`
4. Reboot

via [Disabling System Integrity Protection - yabai](https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection#how-do-i-disable-system-integrity-protection)
-->
