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
