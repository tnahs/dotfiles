#!/usr/bin/env zsh


# TODO: Update.

function quit_anki {
    echo "Quitting Anki Books..."
    osascript -e 'tell application "Anki" to quit'
}


function extract_archive {
    tempdir=$(mktemp -d 2> /dev/null)
    echo "Extracting Anki collection archive to $tempdir..."
    tar             \
        --extract   \
        --file="$1" \
        --directory="$tempdir"
}


function restore_collection {
    echo "Deleting Anki collection..."
    rm -rf "$HOME/Library/Application Support/Anki2"
    echo "Retoring Anki collection..."
    mv "$tempdir/Anki2" "$HOME/Library/Application Support"
}


function delete_tempdir {
    echo "Deleting $tempdir..."
    rm -rf "$tempdir"
}


function main {
    if [[ $# -ne 1 ]]; then
        echo "Error: Please provide a single path to an Anki collection archive"
        echo
        exit 1
    else
        quit_anki
        extract_archive "$1"
        restore_collection
        delete_tempdir
        echo "Anki collection restored!"
        echo "Please restart before running Anki."
    fi
}


main "$@"
