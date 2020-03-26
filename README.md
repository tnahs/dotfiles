# dotfiles

1. Install Homebrew

    ``` bash
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ```

    via https://brew.sh

2. During install of **Homebrew**, the script should install **Command Line Tools**. If not, run:
3.
    ``` bash
    xcode-select --install
    ```
    or install via https://developer.apple.com/downloads/


3. Clone [`tnahs/dotfiles`](https://github.com/tnahs/dotfiles) repository

    ``` bash
    git clone https://github.com/tnahs/dotfiles $HOME"/.dotfiles"
    ```

4. Init and Install

    ``` bash
    python ~/.dotfiles/scripts/init.py --verbose
    ```

5. Configure Mojave

    ``` bash
    bash ~/.dotfiles/scripts/macos-config.sh
    ```
