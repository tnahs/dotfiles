function dump-books {

    root="$PROJECTS_ALWAYS/wiki"

    data="$root/data"
    templates="$data/templates"
    export="$data/export"
    databases="$data/databases"
    reading="$root/vault/reading"

    mkdir -p "$root"
    mkdir -p "$data"
    mkdir -p "$templates"
    mkdir -p "$export"
    mkdir -p "$databases"
    mkdir -p "$reading"

    echo " Rendering templates..."
    readstor                               \
        --output-directory "$reading"      \
        render                             \
        --templates-directory "$templates" \
        --template-group default           \
        --extract-tags                     \
        --normalize-whitespace             \
        --ascii-symbols                    \
        --trim-blocks                      \
        --wrap-text 100

    echo " ◆ Exporting data..."
    readstor                               \
        --output-directory "$export"       \
        export

    echo " ◆ Backing-up databases..."
    readstor                               \
        --output-directory "$databases"    \
        backup

    echo " ◆ Complete! Saved to: $root"
}
