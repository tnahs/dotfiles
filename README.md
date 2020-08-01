# dotfiles

1. Install **Homebrew**:

    ``` zsh
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ```

    via https://brew.sh

2. During installation, **Homebrew** should ask to install **Command Line Tools**. If not, run:

    ``` zsh
    xcode-select --install
    ```
    or install via https://developer.apple.com/downloads/

3. Clone this repository:

    ``` zsh
    git clone https://github.com/tnahs/dotfiles ~/.dotfiles
    ```

4. Rebuild **dotfiles**:

    ``` zsh
    python ~/.dotfiles/scripts/rebuild.py --verbose
    ```

5. Configure **macOS**:

    ``` zsh
    zsh ~/.dotfiles/scripts/defaults.sh
    ```
