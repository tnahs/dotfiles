import argparse

from . import main
from .src.backup import Backup


parser = argparse.ArgumentParser(
    add_help=False,
    prog=Backup.NAME_PRETTY,
    usage="backup [OPTIONS ...]",
    formatter_class=argparse.RawTextHelpFormatter,
    description=(
        f"""
        \rAutomated backups & archiving!
        \r
        \rCommands:
        \r
        \r    {Backup.NAME} --run-all            Run all backups.
        \r    {Backup.NAME} --run [CHOICE ...]   Run selected backup.
        \r    {Backup.NAME} ... --verbose        Run in verbose mode.
        \r    {Backup.NAME} --list               List all choices.
        \r
        \rChoices:
        \r
        \r    {" ".join(Backup.RUN_CHOICES)}
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
    "-a",
    "--run-all",
    action="store_true",
    default=False,
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

    main(args=args)
