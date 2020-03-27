import argparse
import logging
import pathlib
from datetime import datetime
from typing import Dict, Tuple, List

import osutils

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s %(levelname)s: %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)


class Defaults:

    home: pathlib.Path = pathlib.Path().home()
    today: str = datetime.now().strftime("%Y-%m-%d")

    choices: Tuple[str, ...] = (
        "all",
        "dotfiles",
        "anki",
        "applebooks",
    )
    verbose: Dict[bool, int] = {
        True: logging.DEBUG,
        False: logging.INFO,
    }


class DotfilePaths:

    root = Defaults.home / ".dotfiles"


class ArchivePaths:

    root = Defaults.home / "Workspace" / "archives"
    anki = root / "anki-application-support"
    applebooks = root / "apple-books"


class Backup:
    def __init__(self, choices: List[str], logger: logging.Logger) -> None:

        self._choices = choices
        self._logger = logger

        self._osutils = osutils.OSUtils(logger=logger)

    def backup(self) -> None:

        for choice in self._choices:
            getattr(self, f"_run_{choice}")()

    def _run_all(self) -> None:
        self._run_dotfiles()
        self._run_anki()
        self._run_applebooks()

    def _run_dotfiles(self) -> None:

        self._logger.info("Dumping Brewfile...")

        self._osutils.run(
            command=[
                "brew",
                "bundle",
                "dump",
                "--force",
                f"--file={DotfilePaths.root}/Brewfile",
            ],
        )

        #

        self._logger.info("Backing up Moom preferences...")

        moom_source = Defaults.home / "Library/Preferences/com.manytricks.Moom.plist"
        moom_destination = DotfilePaths.root / "moom"

        self._osutils.copy(
            sources=[moom_source], destination=moom_destination,
        )

        #

        self._logger.info("Backing up VSCode `[settings|projects|keybindings].json`...")

        vscode_user_root = Defaults.home / "Library/Application Support/Code/User/"
        vscode_sources = [
            vscode_user_root / "projects.json",
            vscode_user_root / "settings.json",
            vscode_user_root / "keybindings.json",
        ]
        vscode_destination = DotfilePaths.root / "vscode"

        self._osutils.copy(sources=vscode_sources, destination=vscode_destination)

        #

        self._logger.info("Dumping up VSCode extensions list...")

        vscode_extensions = DotfilePaths.root / "vscode" / "extensions.txt"

        self._osutils.run(command=["code", "--list-extensions", ">", vscode_extensions])

    def _run_anki(self) -> None:

        if self._osutils.process_is_running(process_names=["Anki"]):
            logging.warning("Anki is currently running! Skipping...")
            return

        self._logger.info(f"Backing up Anki `Application Support` folder...")

        # Anki deck and addons folder
        source = Defaults.home / "Library/Application Support/Anki2/"
        destination = ArchivePaths.anki / f"anki-{Defaults.today}.tar.gz"

        self._osutils.archive(sources=[source], destination=destination)
        self._osutils.prune(path=ArchivePaths.anki, size=5)

    def _run_applebooks(self) -> None:

        if self._osutils.process_is_running(
            process_names=["Books", "iBooks", "Apple Books"]
        ):
            logging.warning("Apple Books is currently running! Skipping...")
            return

        self._logger.info(f"Backing up Apple Books...")

        # Apple Books databases / EPUBs
        db_source = Defaults.home / "Library/Containers/com.apple.iBooksX/"
        epubs_source = Defaults.home / "Library/Containers/com.apple.BKAgentService/"
        destination = ArchivePaths.applebooks / f"apple-books-{Defaults.today}.tar.gz"

        self._osutils.archive(
            sources=[db_source, epubs_source], destination=destination
        )
        self._osutils.prune(path=ArchivePaths.applebooks, size=5)


if __name__ == "__main__":

    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument(
        "choices",
        nargs="+",
        choices=Defaults.choices,
        type=str,
        help="Thing(s) to backup.",
    )
    parser.add_argument(
        "-v", "--verbose", action="store_true", default=False,
    )
    parser.add_argument(
        "-h",
        "--help",
        action="help",
        help="Show help message.",
        default=argparse.SUPPRESS,
    )
    args = parser.parse_args()

    #

    logger = logging.getLogger()
    logger.setLevel(Defaults.verbose[args.verbose])

    #

    backup = Backup(choices=args.choices, logger=logger)
    backup.backup()
