import argparse
import logging
import sys
import textwrap

from . import __version__
from .bup import Bup, BupChoices, Defaults


logger = logging.getLogger()


def main() -> int:
    parser = argparse.ArgumentParser(
        add_help=False,
        prog=Defaults.NAME,
        usage=argparse.SUPPRESS,
        formatter_class=argparse.RawTextHelpFormatter,
        description=textwrap.dedent(
            f"""
            {Defaults.NAME_PRETTY}: Backup User Protocol

            Usage:
                {Defaults.NAME} <run ...> [OPTIONS ...]

            Arguments:
                <run ...>    Run one or more {Defaults.NAME_PRETTY}s.

            Options:
                --all            Run all {Defaults.NAME_PRETTY}s.
                --list           List all {Defaults.NAME_PRETTY} choices.
                --verbose        Run in verbose mode.
                -v / --version   Print version.
                -h / --help      Show help.

            Available {Defaults.NAME_PRETTY}s:
                {BupChoices.ANKI.value}
                {BupChoices.APPLEBOOKS.value}
                {BupChoices.BREWFILE.value}
                {BupChoices.DOWNLOADS.value}
                {BupChoices.MEDIA.value}
                {BupChoices.WORKSPACE.value}
        """.rstrip()
        ),
    )

    parser.add_argument(
        "run",
        nargs="*",
        type=BupChoices.argparse,
        choices=[
            # TODO: Hack to allow choices to be empty. There might be a better
            # way to do this using argparse.
            [],
            *[choice.value for choice in BupChoices],
        ],
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
        "-v",
        "--version",
        action="version",
        version=f"{Defaults.NAME_PRETTY} v{__version__}",
        help=argparse.SUPPRESS,
    )
    parser.add_argument(
        "-h",
        "--help",
        action="help",
        help=argparse.SUPPRESS,
        default=argparse.SUPPRESS,
    )

    args = parser.parse_args()

    if args.list is True:
        print(
            textwrap.dedent(
                f"""
                {Defaults.NAME_PRETTY}: Backup User Protocol

                Available {Defaults.NAME_PRETTY}s:
                    {BupChoices.ANKI}
                    {BupChoices.APPLEBOOKS}
                    {BupChoices.BREWFILE}
                    {BupChoices.DOWNLOADS}
                    {BupChoices.MEDIA}
                    {BupChoices.WORKSPACE}
            """.rstrip()
            )
        )
        return 0

    if args.run_all and args.run:
        parser.error("option --all cannot be called with argument: run")

    if not args.run_all and not args.run:
        parser.error("missing required argument: run")

    logger.setLevel(
        {
            True: logging.DEBUG,
            False: logging.INFO,
        }.get(args.is_verbose, False)
    )

    bup = Bup(
        run=args.run,
        run_all=args.run_all,
        is_verbose=args.is_verbose,
    )

    try:
        bup.backup()
    except Exception:
        logger.exception(
            f"Exception raised while attempting to run {Defaults.NAME_PRETTY}."
        )
        return 1

    logger.info("BUP Complete!")

    return 0


if __name__ == "__main__":
    sys.exit(main())
