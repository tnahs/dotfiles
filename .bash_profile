if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# Append ~/.dotfiles/bin.
export PATH="$PATH:$HOME/bin"

# poetry
# https://python-poetry.org/docs/#installation
export PATH="$HOME/.poetry/bin:$PATH"

# pipx
# https://pipxproject.github.io/pipx/installation/
export PATH="$PATH:$HOME/.local/bin"

# For running `code` in the terminal to launch VSCode.
# https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# pyenv
# https://github.com/pyenv/pyenv#homebrew-on-macos
eval "$(pyenv init -)"

# Don't create Python binary files.
export PYTHONDONTWRITEBYTECODE=1

# Set prompt via http://bashrcgenerator.com
export PS1="\u@\h \w\n\[$(tput sgr0)\]"
