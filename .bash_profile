if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH":$HOME/bin"
export PATH=$PATH":/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Don't create Python binary files
export PYTHONDONTWRITEBYTECODE=1