import argparse
import logging
import pathlib
import subprocess
from datetime import datetime
from typing import Dict, Tuple

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
    def __init__(self, choice: str, logger: logging.Logger) -> None:

        self._logger = logger
        self._choice = choice

        self._osutils = osutils.OSUtils(logger=logger)

    def backup(self) -> None:

        getattr(self, f"_run_{self._choice}")()

    def _run_all(self) -> None:
        self._run_dotfiles()
        self._run_anki()
        self._run_applebooks()

    def _run_dotfiles(self) -> None:

        self._logger.info("Dumping Brewfile...")

        try:
            subprocess.run(
                [
                    "brew",
                    "bundle",
                    "dump",
                    "--force",
                    f"--file={DotfilePaths.root}/Brewfile",
                ],
                check=True,
                capture_output=True,
            )
        except subprocess.CalledProcessError:
            self._logger.exception(
                "Exception raised while attempting to run `brew` command."
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

        try:
            subprocess.run(
                ["code", "--list-extensions", ">", str(vscode_extensions)],
                check=True,
                capture_output=True,
            )
        except subprocess.CalledProcessError:
            self._logger.exception(
                "Exception raised while attempting to run `code` command."
            )

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
        "choice", type=str, choices=Defaults.choices,
    )
    parser.add_argument(
        "-v", "--verbose", action="store_true", default=False,
    )
    parser.add_argument(
        "-h", "--help", action="help", help="Back-up stuff!", default=argparse.SUPPRESS,
    )
    args = parser.parse_args()

    #

    logger = logging.getLogger()
    logger.setLevel(Defaults.verbose[args.verbose])

    #

    backup = Backup(choice=args.choice, logger=logger)
    backup.backup()
