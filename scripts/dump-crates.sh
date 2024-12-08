#!/usr/bin/env zsh


CRATES_JSON="$HOME/.cargo/.crates2.json"
CRATES_TXT="$HOME/.dotfiles/cargo/crates.txt"


# Dump crates installed from crates.io.
function dump_crates {

    # Note how the "cargo-edit" entry contains the string "registry+https://"
    # whereas the one with "helix-term" contains "path+file:///". This string is
    # used below in the jq command to filter out any crates that are installed
    # from a local build of the application.
    #
    # {
    #   "installs": {
    #     "cargo-edit 0.11.3 (registry+https://github.com/rust-lang/crates.io-index)": {
    #         ...
    #     },
    #     "helix-term 0.6.0 (path+file:///path/to/helix/helix-term)": {
    #         ...
    #     },
    #     ...
    #   }
    # }
    jq_command='.installs | keys[]  | select( . | contains("registry+https://")) | split(" ")[0]'

    # Dump the results from the above command into a text file.
    cat "$CRATES_JSON" | jq -r "$jq_command" > "$CRATES_TXT"
}


function main {
    dump_crates
}


main
