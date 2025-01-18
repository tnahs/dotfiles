#!/usr/bin/env zsh


# shellcheck disable=2296
NAME=$(basename "${(%):-%N}")

ROOT=${0:A:h:h}


function run_hello {
    echo "Hello from ${ROOT}!"
}


function run_goodbye {
    echo "Goodbye!"
}


function print_help {
    echo -e "Run template ZSH script.

\e[4mUsage:\e[0m ${NAME} [OPTIONS] <COMMAND>

\e[4mCommands:\e[0m
  hello    Print hello!
  goodbye  Print goodbye!

\e[4mOptions:\e[0m
  -h, --help   Show help"
}


function main {

    if [[ "$1" == "--help" || "$1" == "-h" ]]; then
        print_help
        exit 0
    fi

    if [[ $# -ne 1 ]]; then
        echo "Error: missing required positional argument 'command'"
        print_help
        exit 1
    fi

    case "$1" in
        "hello")
            run_hello
            ;;
        "goodbye")
            run_goodbye
            ;;
        *)
            echo "Error: invalid command '$1'"
            print_help
            exit 1
            ;;
    esac
}


main "$@"
