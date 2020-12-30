import argparse
import sys

from . import __version__, main
from .src.bup import Bup


def format_choices(width: int = 4) -> str:
    spacing = " " * width
    choices = [f"{spacing}{c}" for c in Bup.RUN_CHOICES]
    return "\n".join(choices).rstrip()


parser = argparse.ArgumentParser(
    add_help=False,
    prog=Bup.NAME,
    usage=argparse.SUPPRESS,
    formatter_class=argparse.RawTextHelpFormatter,
    description=(
        f"""
        \r{Bup.NAME_PRETTY}: Backup User Protocol
        \r
        \rUsage:
        \r    {Bup.NAME} <run ...> [OPTIONS ...]
        \r
        \rArguments:
        \r    <run ...>    Run one or more {Bup.NAME_PRETTY}s.
        \r
        \rGlobal Options:
        \r    --run-all    Run all {Bup.NAME_PRETTY}s.
        \r    --list       List all {Bup.NAME_PRETTY}s choices.
        \r    --verbose    Run in verbose mode.
        \r    --version    Print version.
        \r    --help       Show help.
        \r
        \rAvailable {Bup.NAME_PRETTY}s:
        \r{format_choices()}
    """.lstrip()
    ),
)

parser.add_argument(
    "run",
    nargs="*",
    choices=[[], *Bup.RUN_CHOICES],
    help=argparse.SUPPRESS,
)
parser.add_argument(
    "--all",
    dest="run_all",
    action="store_true",
    default=False,
    help=argparse.SUPPRESS,
)
parser.add_argument(
    "--list",
    action="store_true",
    default=False,
    help=argparse.SUPPRESS,
)
parser.add_argument(
    "--verbose",
    dest="is_verbose",
    action="store_true",
    default=False,
    help=argparse.SUPPRESS,
)
parser.add_argument(
    "--version",
    action="store_true",
    default=False,
    help=argparse.SUPPRESS,
)
parser.add_argument(
    "--help",
    action="help",
    help=argparse.SUPPRESS,
    default=argparse.SUPPRESS,
)
args = parser.parse_args()


if __name__ == "__main__":

    if args.version is True:
        print(f"{Bup.NAME_PRETTY} v{__version__}")
        sys.exit()

    if args.list is True:
        print(
            f"""
            \rAvailable {Bup.NAME_PRETTY}s:
            \r{format_choices()}
        """.lstrip()
        )
        sys.exit()

    if args.run_all and args.run:
        parser.error("option --all cannot be called with argument: run")

    if not args.run_all and not args.run:
        parser.error("missing required argument: run")

    main(args=args)
