function list-todo-files() {
    find . -type f | rg "todo.(md|txt)$" --ignore-case
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


# TODO: Add color over default
#
# ANSI 4-bit Color
#
# \033 [FOREGROUND] ; [BACKGROUND] ; [EFFECT] m [TEXT] \033[0m
# ^^^^------------+                           ^        ^^^^^^^
#                 |                           |        |
#                 |                           |        |
# start escape ---+                           |        |
# end escape -------------------------------- +        |
# reset -----------------------------------------------+
function print-colors-4bit() {
    local space="   "

    printf "\033[40;49;1mANSI 4-bit Color Tables:\033[0m\n\n"

    # Basic Colors -------------------------------------------------------------

    printf " \033[40;49;4mBasic Colors: 40-47+49:\033[0m\n\n"

    for bg in {40..47}; do
        # color code: white text on black background.
        printf " \033[37;40m color-code: ${bg} \033[0m"

        # black text over the color background.
        printf "  \033[30;${bg}m 30;${bg} sample-text ${space} \033[0m"

        printf "\n"
    done

    printf "\n"

    for bg in {40..47}; do
        # color code: white text on black background.
        printf " \033[37;40m color-code: ${bg} \033[0m"

        # white text over the color background.
        printf "  \033[37;${bg}m 37;${bg} sample-text ${space} \033[0m"

        printf "\n"
    done

    printf "\n"

    for fg in {30..37}; do
        # color code: white text on black background.
        printf " \033[37;40m color-code: ${fg} \033[0m"

        # color text over the default background.
        printf "  \033[${fg};49m ${fg};49m sample-text ${space} \033[0m"

        printf "\n"
    done

    printf "\n\n"

    # Bright Colors ------------------------------------------------------------

    printf " \033[40;49;4mBright Colors: 100-107+109:\033[0m\n\n"

    for bg in {100..107}; do
        # color code: white text on black background.
        printf " \033[97;100m color-code: ${bg} \033[0m"

        # black text over the color background.
        printf "  \033[90;${bg}m 30;${bg}m sample-text ${space} \033[0m"

        printf "\n"
    done

    printf "\n"

    for bg in {100..107}; do
        # color code: white text on black background.
        printf " \033[97;100m color-code: ${bg} \033[0m"

        # white text over the color background.
        printf "  \033[97;${bg}m 37;${bg}m sample-text ${space} \033[0m"

        printf "\n"
    done

    printf "\n"

    for fg in {90..97}; do
        # color code: white text on black background.
        printf " \033[97;100m color-code:  ${fg} \033[0m"

        # color text over the default background.
        printf "  \033[${fg};109m ${fg};109m sample-text ${space} \033[0m"

        printf "\n"
    done
}


# ANSI 8-bit Color
#
# \033 [FOREGROUND] ; 48;5 [BACKGROUND] m [TEXT] \033[0m
# ^^^^------------+   ^^^^              ^        ^^^^^^^
#                 |   |                 |        |
#                 |   |                 |        |
# start escape ---+   |                 |        |
# use 8-bit colors ---+                 |        |
# end escape ---------------------------+        |
# reset -----------------------------------------+
function print-colors-8bit() {
    local space="   "

    printf "\033[40;49;1mANSI 8-bit Color Table:\033[0m\n\n"

    for color in {0..255}; do
        # color number: black text on white background.
        printf " \033[30;48;5;15m %3s \033[0m" "$color"

        # black text over the color background.
        printf "\033[30;48;5;${color}m 30;48;5;${color}m sample-text ${space} \033[0m" "$color"

        # white text over the color background.
        printf "\033[37;48;5;${color}m 37;48;5;${color}m sample-text ${space} \033[0m" "$color"

        printf "\n"
    done
}
