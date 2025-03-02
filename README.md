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

## Run Setup

```shell
~/.dotfiles/setup.sh
```

## Install `Brewfile`

First, install Rosetta. Some older applications will fail to install without Rosetta.

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
