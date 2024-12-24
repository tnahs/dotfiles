# Enable vi-mode.
bindkey -v

# Unbind all keybindings.
bindkey -rp ''

# Unbind other keymaps. Keymaps via: bindkey -l.
for keymap in \
    main      \
    vicmd     \
    viins     \
    viopp     \
    visual    \
    emacs     \
    isearch   \
    command   \
    ; do

    bindkey -M $keymap -rp ''
done

# Shorten command timeout.
export KEYTIMEOUT=20


# Normal-mode --------------------------------------------------------------------------
# --------------------------------------------------------------------------------------


# vi toggle
bindkey -M vicmd '^[' vi-cmd-mode

# vi movement
bindkey -M vicmd "h"    vi-backward-char
bindkey -M vicmd "l"    vi-forward-char
bindkey -M vicmd "j"    down-line-or-history
bindkey -M vicmd "k"    up-line-or-history
bindkey -M vicmd "^[[A" up-line-or-history
bindkey -M vicmd "^[[B" down-line-or-history
bindkey -M vicmd "^[[D" vi-backward-char
bindkey -M vicmd "^[[C" vi-forward-char
bindkey -M vicmd "gg"   beginning-of-buffer-or-history
bindkey -M vicmd "G"    end-of-buffer-or-history
bindkey -M vicmd "w"    vi-forward-word
bindkey -M vicmd "W"    vi-forward-blank-word
bindkey -M vicmd "b"    vi-backward-word
bindkey -M vicmd "B"    vi-backward-blank-word
bindkey -M vicmd "e"    vi-forward-word-end
bindkey -M vicmd "E"    vi-forward-blank-word-end
bindkey -M vicmd "gh"   vi-beginning-of-line
bindkey -M vicmd "gl"   vi-end-of-line

# vi editing
bindkey -M vicmd "c"  vi-change
bindkey -M vicmd "C"  vi-change-eol
bindkey -M vicmd "D"  vi-kill-eol
bindkey -M vicmd "r"  vi-replace-chars
bindkey -M vicmd "R"  vi-replace
bindkey -M vicmd "y"  vi-yank
bindkey -M vicmd "Y"  vi-yank-whole-line
bindkey -M vicmd "wd" delete-word

# mon-vi toggle
bindkey '^[' vi-cmd-mode

# non-vi movement
bindkey "^A"      beginning-of-line
bindkey "^E"      end-of-line
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey "^[[C"    vi-forward-char
bindkey "^[[D"    vi-backward-char

# non-vi editing
bindkey '^?' backward-delete-char


# Insert-mode --------------------------------------------------------------------------
# --------------------------------------------------------------------------------------


bindkey -M vicmd "a" vi-add-next
bindkey -M vicmd "A" vi-add-eol
bindkey -M vicmd "i" vi-insert
bindkey -M vicmd "I" vi-insert-bol
bindkey -M vicmd "p" vi-put-after
bindkey -M vicmd "P" vi-put-before


# Visual-mode --------------------------------------------------------------------------
# --------------------------------------------------------------------------------------


bindkey -M vicmd "v" visual-mode
bindkey -M vicmd "x" visual-line-mode


# History ------------------------------------------------------------------------------
# --------------------------------------------------------------------------------------


# vi
bindkey -M vicmd "u"  undo
bindkey -M vicmd "U"  redo
bindkey -M vicmd "//" vi-history-search-backward
bindkey -M vicmd "n"  vi-repeat-search

# non-vi
bindkey "^[[A" up-line-or-history
bindkey "^[[B" down-line-or-history


# Misc ---------------------------------------------------------------------------------
# --------------------------------------------------------------------------------------


# vi
bindkey -M vicmd '^M' accept-line

# non-vi
bindkey "^J"               accept-line
bindkey "^M"               accept-line
bindkey '^I'               expand-or-complete
bindkey "^[[200~"          bracketed-paste
bindkey -R "^\\\\"-"~"     self-insert
bindkey -R "\M-^@"-"\M-^?" self-insert
bindkey -R "^S"-"^T"       self-insert
bindkey -R "^Y"-"^Z"       self-insert


# zsh-autosuggestions ------------------------------------------------------------------
# --------------------------------------------------------------------------------------


bindkey "^[[Z" end-of-line
bindkey "^L"   end-of-line


export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(
    end-of-line
    vi-end-of-line
)

export ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(
    forward-char
    forward-word
    vi-forward-char
    vi-forward-word
    vi-forward-word-end
    vi-forward-blank-word
    vi-forward-blank-word-end
)


# Widgets ------------------------------------------------------------------------------
# --------------------------------------------------------------------------------------


# Widget to handle 'd' key.
function zsh-delete-visual-selection {
    if [[ $REGION_ACTIVE == "1" ]]; then
        zle kill-region
    else
        zle delete-char
    fi

    zle reset-prompt
}

zle -N zsh-delete-visual-selection
bindkey -M vicmd 'd' zsh-delete-visual-selection
