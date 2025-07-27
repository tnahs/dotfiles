function mkignore() {
    curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/"$1" > .gitignore
}


function git-modified {
    git_root=$(git rev-parse --show-toplevel 2>/dev/null)

    if [[ -z "$git_root" ]]; then
        return 1
    fi

    modified_files=$(                    \
        git diff --name-only             \
        && git diff --name-only --cached \
        2>/dev/null                      \
    )

    while IFS= read -r file; do

        file="$git_root/$file"

        if [[ -n "$file" && -e "$file" ]]; then
            echo "$file"
        fi

    done <<< "$modified_files"
}


function git-status-recursive() {
    local with_remote=false

    if [[ "$1" == "--with-remote" ]]; then
        with_remote=true
    fi

    echo

    for dir in */**/; do
        # Skip if not a git repo
        if [ ! -d "$dir/.git" ]; then
            continue
        fi

        local repo_color_code="30;43"
        local repo_suffix=""

        # Skip if repo has no remote, and --with-remote flag is set.
        if ! git -C "$dir" remote get-url origin &>/dev/null; then
            if $with_remote; then
                continue
            fi

            repo_color_code="30;44"
            repo_suffix=" (no-remote)"
        fi

        status_output="$(git -C "$dir" status --short)"

        # Print status only if it's not empty
        if [ -n "$status_output" ]; then
            echo -e "\033[${repo_color_code}m  $(basename "$dir")${repo_suffix}  \033[0m"

            while IFS= read -r line; do

                # Check the first character of the status to determine the color
                case "${line:0:2}" in
                    " A") color_code="32;49" ;;  # added:     green
                    " C") color_code="33:49" ;;  # copied:    yellow
                    " D") color_code="30;49" ;;  # deleted:   grey
                    " M") color_code="35;49" ;;  # modified:  pink
                    "R ") color_code="33;49" ;;  # renamed:   yellow
                    "??") color_code="36;49" ;;  # untracked: cyan
                    *)    color_code="37;49" ;;  # default:   white
                esac

                echo -e " \033[${color_code}m$line\033[0m"

            done <<< "$status_output"

            echo

        fi

    done
}
