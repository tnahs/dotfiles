__version__ = "0.2.1"


import argparse
import logging

from .src.bup import Bup


def _format_choices(tab_width: int = 4) -> str:
    spacing = " " * tab_width
    choices = [f"{spacing}{c}" for c in Bup.RUN_CHOICES]
    return "\n".join(choices).rstrip()


logger = logging.getLogger()

logging.basicConfig(
    level=logging.INFO,
    format="{asctime} {name} {levelname}: {message}",
    datefmt="%Y-%m-%d %H:%M:%S",
    style="{",
)

logging_verbosity: dict[bool, int] = {
    True: logging.DEBUG,
    False: logging.INFO,
}


def main(args: argparse.Namespace) -> int:

    if args.version is True:
        print(f"{Bup.NAME_PRETTY} v{__version__}")
        return 0

    if args.list is True:
        print(
            f"""
            \rAvailable {Bup.NAME_PRETTY}s:
            \r{_format_choices()}
        """.lstrip()
        )
        return 0

    logger.setLevel(logging_verbosity[args.is_verbose])

    try:
        bup = Bup(
            run=args.run,
            run_all=args.run_all,
            is_verbose=args.is_verbose,
        )
        bup.backup()
    except Exception:
        logger.exception(f"Exception raised while attempting to run {Bup.NAME_PRETTY}.")
        return 1

    return 0
