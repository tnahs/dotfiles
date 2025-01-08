# ~/.zshrc
#
# Sourced for interactive shells only (not for login shells).
# Use it for aliases, shell options, and interactive shell configurations.
#
# .zshenv -> .zprofile -> .zshrc -> .zlogin


# history
HISTFILE="$HOME/.zhistory"
HISTSIZE=9999                    # Size of in-memory history.
SAVEHIST=9999                    # Size of history saved to HISTFILE.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.

# zsh keybinding
if [[ $KEYBINDINGS_LOADED -ne 1 ]]; then
    source "$DOTFILES/zsh/keybindings.sh"
    export KEYBINDINGS_LOADED=1
fi

# shell
export EDITOR=hx

# homebrew
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}"
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"

# zsh-completions
# https://github.com/zsh-users/zsh-completions
if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"
    autoload -Uz compinit
    compinit
fi

# zsh-syntax-highlighting
# http://github.com/zsh-users/zsh-syntax-highlighting
# shellcheck disable=SC1091
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# zsh-autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions
# shellcheck disable=SC1091
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# starship
# https://github.com/starship/starship
eval "$(starship init zsh)"

# aliases/functions
source "$DOTFILES/zsh/functions.sh"
source "$DOTFILES/zsh/aliases.sh"

# python
export PYTHONDONTWRITEBYTECODE=1

# shellcheck disable=SC1090
for file in "$DOTFILES/zsh/functions"/*.sh; do
    source "$file"
done


# skim
# https://github.com/catppuccin/skim/tree/main
skim_colors=(
  "fg:#cad3f5"
  "bg:#24273a"
  "matched:#363a4f"
  "matched_bg:#f0c6c6"
  "current:#cad3f5"
  "current_bg:#494d64"
  "current_match:#24273a"
  "current_match_bg:#f4dbd6"
  "spinner:#a6da95"
  "info:#c6a0f6"
  "prompt:#8aadf4"
  "cursor:#ed8796"
  "selected:#ffffff"
  "header:#8bd5ca"
  "border:#6e738d"
)

skim_color_flag="--color=$(IFS=,; echo "${skim_colors[*]}")"
export SKIM_DEFAULT_OPTIONS="$skim_color_flag"

# fzf
# https://github.com/catppuccin/fzf
fzf_colors=(
    "bg+:#363a4f"
    "bg:#24273a"
    "spinner:#f4dbd6"
    "hl:#ed8796"
    "fg:#cad3f5"
    "header:#ed8796"
    "info:#c6a0f6"
    "pointer:#f4dbd6"
    "marker:#b7bdf8"
    "fg+:#cad3f5"
    "prompt:#c6a0f6"
    "hl+:#ed8796"
    "selected-bg:#494d64"
)

fzf_color_flag="--color=$(IFS=,; echo "${fzf_colors[*]}") --multi"
export FZF_DEFAULT_OPTS="$fzf_color_flag"
