if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# For Homebrew installs.
export PATH="/usr/local/sbin:$PATH"

# Connects to $HOME/.dotfiles/bin.
export PATH=$PATH":$HOME/bin"

# For running `code` in the terminal to launch VSCode.
export PATH=$PATH":/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Don't create Python binary files.
export PYTHONDONTWRITEBYTECODE=1

# Enable Terminal colors.
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Set prompt via http://bashrcgenerator.com
export PS1="\[\033[38;5;244m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;244m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;129m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\n\\$ \[$(tput sgr0)\]"