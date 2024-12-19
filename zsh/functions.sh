function list-modified-files {
    (git diff --name-only && git diff --name-only --cached) 2>/dev/null
}


function history-disable() {
    echo "Disabling Shell History..."
    setopt HIST_NO_STORE
    unsetopt INC_APPEND_HISTORY
    unsetopt SHARE_HISTORY
}


function history-enable() {
    echo "Enabling Shell History..."
    setopt HIST_NO_STORE
    unsetopt INC_APPEND_HISTORY
    unsetopt SHARE_HISTORY
}
