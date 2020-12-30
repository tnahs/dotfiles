__version__ = "0.2.0"


import argparse
import logging
from typing import Dict

from .src.bup import Bup


logger = logging.getLogger()


logging.basicConfig(
    level=logging.INFO,
    format="{asctime} {name} {levelname}: {message}",
    datefmt="%Y-%m-%d %H:%M:%S",
    style="{",
)


def main(args: argparse.Namespace):

    verbosity: Dict[bool, int] = {
        True: logging.DEBUG,
        False: logging.INFO,
    }

    logger.setLevel(verbosity[args.is_verbose])

    try:
        bup = Bup(
            run=args.run,
            run_all=args.run_all,
            is_verbose=args.is_verbose,
        )
        bup.backup()
    except Exception:
        logger.exception(f"Exception raised while attempting to run {Bup.NAME_PRETTY}.")
        return
