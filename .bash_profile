if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# For Homebrew installs.
export PATH="/usr/local/sbin:$PATH"

# Connects to $HOME/.dotfiles/bin.
export PATH=$PATH":$HOME/bin"

# For running `code` in the terminal to launch VSCode.
export PATH=$PATH":/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Don't create Python binary files
export PYTHONDONTWRITEBYTECODE=1