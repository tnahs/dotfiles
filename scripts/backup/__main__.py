import argparse
import sys

from . import main
from .src.backup import Backup


parser = argparse.ArgumentParser(
    add_help=False,
    prog=Backup.NAME_PRETTY,
    usage=f"{Backup.NAME} [RUN ...] [OPTIONS ...]",
    formatter_class=argparse.RawTextHelpFormatter,
    description=(
        f"""
        \r{Backup.NAME_PRETTY}: Automated backups & archiving!
        \r
        \rCommands:
        \r
        \r    {Backup.NAME}                 Run all backups.
        \r    {Backup.NAME} [RUN ...]       Run selected backup(s).
        \r    {Backup.NAME} ... --verbose   Run in verbose mode.
        \r    {Backup.NAME} --list          List all choices.
        \r
        \rChoices:
        \r
        \r{Backup.RUN_CHOICES_LL}
    """
    ),
)

parser.add_argument(
    "-r",
    "--run",
    nargs="+",
    choices=Backup.RUN_CHOICES,
    type=str,
    help=argparse.SUPPRESS,
)
parser.add_argument(
    "-l",
    "--list",
    action="store_true",
    default=False,
    help=argparse.SUPPRESS,
)
parser.add_argument(
    "-v",
    "--verbose",
    dest="is_verbose",
    action="store_true",
    default=False,
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


if __name__ == "__main__":

    if args.list is True:

        print(
            f"""
            \rAvailable {Backup.NAME} choices are:
            \r
            \r{Backup.RUN_CHOICES_LL}
        """
        )
        sys.exit()

    main(args=args)
