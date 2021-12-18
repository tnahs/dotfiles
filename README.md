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

## Install Rust

Check <https://www.rust-lang.org/tools/install> for latest command.

```console
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
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
$ ~/.dotfiles/scripts/restore-apple-books-library.sh [PATH_TO_LIBRARY_ARCHIVE]
$ ~/.dotfiles/scripts/restore-anki-collection.sh [PATH_TO_COLLECTION_ARCHIVE]
```
