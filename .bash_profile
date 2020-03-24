if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# homebrew
export PATH="/usr/local/sbin:$PATH"

# poetry
export PATH="$HOME/.poetry/bin:$PATH"

# Append ~/.dotfiles/bin.
export PATH=$PATH":$HOME/bin"

# For running `code` in the terminal to launch VSCode.
export PATH=$PATH":/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# pyenv
# https://github.com/pyenv/pyenv#basic-github-checkout
# https://github.com/pyenv/pyenv#homebrew-on-macos
eval "$(pyenv init -)"

# Don't create Python binary files.
export PYTHONDONTWRITEBYTECODE=1

# Enable Terminal colors.
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Set prompt via http://bashrcgenerator.com
export PS1="\u@\h \w\n\[$(tput sgr0)\]"
