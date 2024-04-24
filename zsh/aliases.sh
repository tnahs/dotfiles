# eza
if hash eza 2>/dev/null; then
    alias ls="eza --all --color=always --git --group-directories-first --ignore-glob=.git"
    alias ll="ls --long"
    alias lt="ls --long --tree --git-ignore"
else
    alias ll="ls -alh"
fi

# Navigation
alias k="cd $HOME/Desktop && ll"
alias l="cd $HOME/Downloads && ll"
alias w="cd $HOME/Workspace && ll"
alias p="cd $HOME/Workspace/projects && ll"
alias r="cd $HOME/Workspace/repos && ll"
alias d="cd $HOME/.dotfiles"

# Homebrew
alias brewski="brew update && brew upgrade && brew cleanup; brew doctor"

# helix
alias h="hx ."

# gitui
alias g="gitui"

# bat
if command -v bat &> /dev/null; then
    alias cat="bat"
    alias less="bat"
    alias more="bat"
fi

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
