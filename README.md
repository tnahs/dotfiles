# dotfiles

1. Install **Homebrew**:

    ``` zsh
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
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

## VSCode

    https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync

    Press Shift + Alt + D (macOS: Shift + Option + D)

    Type ">Sync" In Command Palette into order download / upload

    When downloading or uploading for the first time, the welcome page will automatically open, where you can configure the Settings Sync.

    Once you select download, after downloading. Settings Sync will display you Summary containing the list of each files and extension being downloaded.

    New popup will be opened to allow you to restart the code to apply the settings.