# Append ~/.dotfiles/scripts
export PATH=$HOME/.dotfiles/scripts:$PATH
export PYTHONPATH=$HOME/.dotfiles/scripts:$PYTHONPATH

# poetry
export PATH=$HOME/.poetry/bin:$PATH

# pipx
export PATH=$PATH:$HOME/.local/bin

# VSCode.
export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin

# Homebrew
export PATH=/usr/local/sbin:$PATH

# starship
export STARSHIP_CONFIG=$HOME/.dotfiles/starship/starship.toml
