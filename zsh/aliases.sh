# shell
alias reload="source \$DOTFILES/zsh/.zshrc"
alias rr=reload
alias fresh="zsh -idf"

alias hd="history-disable"
alias he="history-enable"
alias hs="hx \$HOME/.zhistory"

if hash sk 2> /dev/null; then
    alias hs="bat \$HOME/.zhistory | sk"
else
    alias hs=eh
fi

# eza
if hash eza 2> /dev/null; then
    alias ls="eza                 \
        --all                     \
        --group-directories-first
    "

    alias ll="eza                 \
        --all                     \
        --long                    \
        --icons=always            \
        --no-user                 \
        --no-time                 \
        --no-filesize             \
        --git                     \
        --git-ignore              \
        --git-repos-no-status     \
        --group-directories-first
    "

    alias lla="eza                \
        --all                     \
        --long                    \
        --icons=always            \
        --no-user                 \
        --no-time                 \
        --no-filesize             \
        --git                     \
        --git-repos-no-status     \
        --group-directories-first
    "

    alias lt="eza                 \
        --all                     \
        --tree                    \
        --level=3                 \
        --icons=always            \
        --no-user                 \
        --no-time                 \
        --no-filesize             \
        --git                     \
        --git-ignore              \
        --git-repos-no-status     \
        --group-directories-first
    "
else
    alias ll="ls -alh"
fi

# navigation
alias k="cd \$HOME/Desktop && ll"
alias l="cd \$HOME/Downloads && ll"
alias m="cd \$HOME/Media && ll"
alias d="cd \$HOME/.dotfiles"

# navigation - projects
alias p="cd \$PROJECTS && ll"
alias pw="cd \$PROJECTS_ALWAYS && ll"
alias pa="cd \$PROJECTS_ACTIVE && ll"
alias pc="cd \$PROJECTS_COLLAB && ll"
alias pm="cd \$PROJECTS_MAINTN && ll"

# navigation - lighthouse
alias pl="cd \$PROJECTS_ALWAYS/lighthouse && ll"
alias pv="cd \$PROJECTS_ALWAYS/lighthouse/vault && ll"

# yazi
alias y="yazi"

# rg
alias rga="rg --no-ignore-dot --hidden --glob"
alias rgf="rg --no-ignore-dot --hidden --files --glob"

# ghosty
alias gc="hx \$HOME/.dotfiles/ghostty/config"

# git
alias gm="git-modified"

# gitui
alias g="gitui"
alias gg="git-graph"

# helix
alias h="hx ."
alias hm="git-modified | xargs hx"

# bat
if hash bat 2> /dev/null; then
    alias cat="bat"
    alias less="bat"
    alias more="bat"
fi

# homebrew
alias brewski="brew update && brew upgrade && brew cleanup; brew doctor"

# rust
alias cr="cargo run"
alias cb="cargo build"
alias cc="cargo check"
alias cl="cargo lint"
alias ct="cargo test"

# python
alias vn="uv init"
alias vnp="uv init --package --build-backend setuptools"
alias va="source .venv/bin/activate"

# 3d-printing
alias slice-prusa="/Applications/PrusaSlicer.app/Contents/MacOS/PrusaSlicer"
alias slice-orca="/Applications/OrcaSlicer.app/Contents/MacOS/OrcaSlicer"
