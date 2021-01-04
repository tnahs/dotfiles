source $HOME/.dotfiles/zsh/.aliases
source $HOME/.dotfiles/zsh/.functions

# pyenv
# https://github.com/pyenv/pyenv#homebrew-on-macos
eval "$(pyenv init -)"

# zsh-completions
# https://github.com/zsh-users/zsh-completions
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit
    compinit
fi

# zsh-syntax-highlighting
# http://github.com/zsh-users/zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# https://github.com/zsh-users/zsh-autosuggestions


# starship
# https://github.com/starship/starship
eval "$(starship init zsh)"
