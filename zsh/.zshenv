# bin (used by pipx too)
export PATH=$PATH:$HOME/.local/bin

# Homebrew: M1 Macs
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}"
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"

# poetry
export PATH=$HOME/.poetry/bin:$PATH

# rust/cargo
export PATH=$HOME/.cargo/bin:$PATH
# . "$HOME/.cargo/env"

# starship
export STARSHIP_CONFIG=$HOME/.dotfiles/starship/starship.toml
