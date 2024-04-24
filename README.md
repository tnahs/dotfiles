# dotfiles

## Install Homebrew

Check <https://brew.sh/> for latest command.

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

During installation, `Homebrew` should ask to install `Command Line Tools`. If
not, run:

```shell
xcode-select --install
```

## Clone Repository

```shell
git clone https://github.com/tnahs/dotfiles ~/.dotfiles
```

## Setup Home

```shell
~/.dotfiles/scripts/setup-home.sh
```

## Install `Brewfile`

Install Rosetta. Some older applications will fail to install without Rosetta.

```shell
sudo softwareupdate --install-rosetta
```

Open a fresh shell and run:

```shell
~/.dotfiles/scripts/install-brewfile.sh
```

## Config macOS

```shell
~/.dotfiles/scripts/config-macos-defaults.sh
```

Restart if necessary.

## Rust

### Install Rust/Cargo

Check <https://www.rust-lang.org/tools/install> for latest command.

```shell
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### Install Crates

```shell
~/.dotfiles/scripts/install-crates.sh
```

## Python

### Install Python

```shell
pyenv install [VERSION]
```

## Applications

### KiKit for KiCad

Check <https://yaqwsx.github.io/KiKit/upstream/installation/macos/> for latest command.

```shell
curl -sSf https://raw.githubusercontent.com/yaqwsx/KiKit/master/scripts/installMacOS.bash | sudo bash
```

### Apple Books

```shell
~/.dotfiles/scripts/restore-apple-books-library.sh [PATH_TO_LIBRARY_ARCHIVE]
```

### Anki

```shell
~/.dotfiles/scripts/restore-anki-collection.sh [PATH_TO_COLLECTION_ARCHIVE]
```
