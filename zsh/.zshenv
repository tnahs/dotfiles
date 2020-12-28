# Append ~/.dotfiles/scripts
export PATH="$HOME/.dotfiles/scripts:$PATH"
export PYTHONPATH="$HOME/.dotfiles/scripts:$PYTHONPATH"

# poetry
# https://python-poetry.org/docs/#installation
export PATH="$HOME/.poetry/bin:$PATH"

# pipx
# https://pipxproject.github.io/pipx/installation/
export PATH="$PATH:$HOME/.local/bin"

# For running `code` in the terminal to launch VSCode.
# https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Warning: Homebrew's sbin was not found in your PATH but you have installed
# formulae that put executables in /usr/local/sbin.
# Consider setting the PATH for example like so:
export PATH="/usr/local/sbin:$PATH"
