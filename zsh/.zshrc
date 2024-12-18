# zsh history
HISTFILE=$HOME/.zhistory
HISTSIZE=999
SAVEHIST=999

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt SHARE_HISTORY             # Share history between all sessions.

# Enable if not using `zsh-vi-mode`
# bindkey '^K' history-search-backward
# bindkey '^J' history-search-forward
# bindkey '^[[A' history-search-backward  # Up
# bindkey '^[[B' history-search-forward   # Down

# shell
export EDITOR=hx

# homebrew
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}"
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"

# pyenv
# https://github.com/pyenv/pyenv#homebrew-on-macos
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# zsh-completions
# https://github.com/zsh-users/zsh-completions
if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"
    autoload -Uz compinit
    compinit
fi

# zsh-syntax-highlighting
# http://github.com/zsh-users/zsh-syntax-highlighting
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# zsh-autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# zsh-vi-mode
# https://github.com/jeffreytse/zsh-vi-mode
source "$(brew --prefix)/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh"

# starship
# https://github.com/starship/starship
eval "$(starship init zsh)"

# bup
export PYTHONPATH=$HOME/.dotfiles/bup/src:$PYTHONPATH

# project directories
export PROJECTS="$HOME/Projects/"
export PROJECTS_ALWAYS="$PROJECTS/00-always"
export PROJECTS_ACTIVE="$PROJECTS/10-active"
export PROJECTS_NEXTUP="$PROJECTS/20-next-up"
export PROJECTS_FUTURE="$PROJECTS/30-future"
export PROJECTS_ONHOLD="$PROJECTS/40-on-hold"
export PROJECTS_INACTIVE="$PROJECTS/50-inactive"
export PROJECTS_ARCHIVE="$PROJECTS/99-archive"

# aliases/functions
source "$HOME/.dotfiles/zsh/functions.sh"
source "$HOME/.dotfiles/zsh/aliases.sh"

for file in "$HOME/.dotfiles/zsh/functions"/*.sh; do
    source "$file"
done
