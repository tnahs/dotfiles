# dotfiles

## Install Homebrew

Check <https://brew.sh/> for latest command.

```console
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

During installation, `Homebrew` should ask to install `Command Line Tools`. If
not, run:

```console
xcode-select --install
```

## Clone Repository

```console
git clone https://github.com/tnahs/dotfiles ~/.dotfiles
```

## Setup Home

```console
~/.dotfiles/scripts/setup-home.sh
```

## Install `Brewfile`

Install Rosetta. Some older applications will fail to install without Rosetta.

```console
sudo softwareupdate --install-rosetta
```

Open a fresh shell and run:

```console
~/.dotfiles/scripts/install-brewfile.sh
```

## Config macOS

```console
~/.dotfiles/scripts/config-macos-defaults.sh
```

Restart if necessary.

## Rust

### Install Rust/Cargo

Check <https://www.rust-lang.org/tools/install> for latest command.

```console
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### Install Crates

```console
~/.dotfiles/scripts/install-crates.sh
```

## Python

### Install Python

```console
~/.dotfiles/scripts/install-python.sh [VERSION ...]
```

### Install Packages Globally with `pipx`

```console
~/.dotfiles/scripts/install-pipx-packages.sh
```

## Restore Applications

```console
~/.dotfiles/scripts/restore-apple-books-library.sh [PATH_TO_LIBRARY_ARCHIVE]
~/.dotfiles/scripts/restore-anki-collection.sh [PATH_TO_COLLECTION_ARCHIVE]
```
