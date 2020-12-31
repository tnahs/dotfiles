#!/bin/zsh

autoload -U colors && colors

PROMPT=""
PROMPT+="%n in "
PROMPT+="%F{blue}%~%f %# "


source "$HOME/.dotfiles/zsh/.aliases"
source "$HOME/.dotfiles/zsh/.functions"

# zsh-completions
# https://github.com/zsh-users/zsh-completions
fpath=("$HOME/.dotfiles/zsh/plugins/zsh-completions/src" $fpath)

# zsh-autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions
source "$HOME/.dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

# zsh-syntax-highlighting
# http://github.com/zsh-users/zsh-syntax-highlighting
# https://coderwall.com/p/qmvfya/syntax-highlighting-for-zsh
source "$HOME/.dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# pyenv
# https://github.com/pyenv/pyenv#homebrew-on-macos
eval "$(pyenv init -)"
