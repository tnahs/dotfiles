function rip-video {
    for url in "$@"; do
        _rip-video $url "%(uploader)s--%(upload_date>%Y-%m-%d)s--%(title)s--%(id)s.%(ext)s"
    done
}

function dump-books {

    root="$HOME/Workspace/wiki"

    data="$root/data"
    templates="$data/templates"
    export="$data/export"
    databases="$data/databases"
    reading="$root/vault/reading"

    mkdir -p $root
    mkdir -p $data
    mkdir -p $templates
    mkdir -p $export
    mkdir -p $databases
    mkdir -p $reading

    printf " ◆ Rendering templates...\n"
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

    printf "\n ◆ Exporting data...\n"
    readstor                               \
        --output-directory "$export"       \
        export

    printf "\n ◆ Backing-up databases...\n"
    readstor                               \
        --output-directory "$databases"    \
        backup

    printf "\n ◆ Complete! Saved to: $root\n"
}

# https://stackoverflow.com/a/55171807
function _rip-video {
    yt-dlp                                             \
     --format "bestvideo[height<=1080]+bestaudio/best" \
     --verbose                                         \
     --force-ipv4                                      \
     --sleep-requests 1                                \
     --sleep-interval 5                                \
     --max-sleep-interval 5                            \
     --ignore-errors                                   \
     --no-continue                                     \
     --no-overwrites                                   \
     --add-metadata                                    \
     --parse-metadata "%(title)s:%(meta_title)s"       \
     --parse-metadata "%(uploader)s:%(meta_artist)s"   \
     --write-annotations                               \
     --embed-thumbnail                                 \
     --all-subs                                        \
     --embed-subs                                      \
     --check-formats                                   \
     --concurrent-fragments 5                          \
     --output ${2:?"Missing argument for OUTPUT"}      \
     --merge-output-format "mp4"                       \
     --throttled-rate 100K                             \
     --no-check-certificate                            \
     ${1:?"Missing argument for URL"}
}
