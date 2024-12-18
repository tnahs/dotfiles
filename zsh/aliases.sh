# eza
if hash eza 2>/dev/null; then
    alias ls="eza --all --color=always --git --group-directories-first --ignore-glob=.git"
    alias ll="ls --long"
    alias lt="ls --long --tree --git-ignore"
else
    alias ll="ls -alh"
fi

# shell
alias reload="source ~/.dotfiles/zsh/.zshrc"
alias rr=reload

# navigation
alias k="cd $HOME/Desktop && ll"
alias l="cd $HOME/Downloads && ll"
alias p="cd $HOME/Projects && ll"
alias a="cd $HOME/Projects/10-active && ll"
alias d="cd $HOME/.dotfiles"

# git
alias m="list-modified-files"

# gitui
alias g="gitui"
alias gg="git-graph"

# homebrew
alias brewski="brew update && brew upgrade && brew cleanup; brew doctor"

# helix
alias h="hx ."
alias hm="list-modified-files | xargs hx"

# bat
if command -v bat &> /dev/null; then
    alias cat="bat"
    alias less="bat"
    alias more="bat"
fi

# 3d-printing
alias slice-prusa="/Applications/PrusaSlicer.app/Contents/MacOS/PrusaSlicer"
alias slice-orca="/Applications/OrcaSlicer.app/Contents/MacOS/OrcaSlicer"

# python
alias vn="python -m venv .venv && pip install --upgrade pip"
alias va="source .venv/bin/activate"

# bup
export PYTHONPATH=$HOME/.dotfiles/bup/src:$PYTHONPATH
alias bup="python -m bup"

# rust
alias cr="cargo run"
alias cb="cargo build"
alias cc="cargo check"
alias cl="cargo lint"
alias ct="cargo test"
