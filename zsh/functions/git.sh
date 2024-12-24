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
