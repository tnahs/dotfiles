__version__ = "0.1.0"

import argparse
import logging
import sys
from typing import Dict

from .src.backup import Backup


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
        backup = Backup(
            run=args.run,
            is_verbose=args.is_verbose,
        )
        backup.backup()
    except Exception:
        logger.exception("Exception raised while attempting to backup.")
        return
