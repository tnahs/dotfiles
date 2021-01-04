import logging
import os
import pathlib
from datetime import datetime
from typing import Tuple

from .helpers import Shell
from .versions import Version


logger = logging.getLogger(__name__)


class Defaults:

    home = pathlib.Path().home()
    today: str = datetime.now().strftime("%Y-%m-%d")


class DotfilePaths:

    root = Defaults.home / ".dotfiles"


class MiscPaths:

    root = Defaults.home / "Workspace" / "misc"
    private = root / "private"


class ArchivePaths:

    root = Defaults.home / "Workspace" / "archives"
    anki = root / "anki-application-support"
    applebooks = root / "apple-books"


class BupKeys:
    DOTFILES = "dotfiles"
    MISC = "misc"
    ANKI = "anki"
    APPLEBOOKS = "applebooks"


class Bup:

    NAME = "bup"
    NAME_PRETTY = "BUP"
    RUN_CHOICES: Tuple[str, ...] = (
        BupKeys.DOTFILES,
        BupKeys.MISC,
        BupKeys.ANKI,
        BupKeys.APPLEBOOKS,
    )

    def __init__(
        self, run: list[str], run_all: bool = False, is_verbose: bool = False
    ) -> None:

        self._to_run = run if run_all is False else self.RUN_CHOICES
        self._is_verbose = is_verbose

        paths: list[pathlib.Path] = [
            ArchivePaths.applebooks,
            ArchivePaths.anki,
            MiscPaths.private,
        ]

        for path in paths:
            path.mkdir(parents=True, exist_ok=True)

    def backup(self) -> None:

        if self._ask_confirmation() is False:
            return

        for item in self._to_run:
            func = getattr(self, f"_run__{item}")
            logging.debug(f"Running {self.__class__.__name__}.{func.__name__}...")
            func()

    def _ask_confirmation(self) -> bool:

        confirm = input(
            f"{self.NAME_PRETTY} will run: {', '.join(self._to_run)}. Confirm? [y/N]: "
        )

        if confirm.lower().strip() not in ["y", "yes"]:
            print(f"{self.NAME_PRETTY} cancelled. Exiting!")
            return False

        return True

    def _run__dotfiles(self) -> None:

        logger.info("Dumping Brewfile...")

        path_brewfile = DotfilePaths.root / "homebrew" / "Brewfile"

        command: list[str] = [
            "brew",
            "bundle",
            "dump",
            "--force",
            f"--file={path_brewfile}",
        ]

        if self._is_verbose:
            command.append("--verbose")

        Shell.run(command=command)

        #

        logger.info("Backing up Moom preferences...")

        moom_source = Defaults.home / "Library/Preferences/com.manytricks.Moom.plist"
        moom_destination = DotfilePaths.root / "moom"

        Shell.copy(
            sources=[moom_source],
            destination=moom_destination,
            verbose=self._is_verbose,
        )

        #

        logger.info("Backing up VSCode `[settings|keybindings].json`...")

        vscode_user_root = Defaults.home / "Library/Application Support/Code/User/"
        vscode_sources = [
            vscode_user_root / "settings.json",
            vscode_user_root / "keybindings.json",
        ]
        vscode_destination = DotfilePaths.root / "vscode"

        Shell.copy(
            sources=vscode_sources,
            destination=vscode_destination,
            verbose=self._is_verbose,
        )

        #

        logger.info("Backing up VSCode snippets...")

        Shell.copy(
            sources=[(vscode_user_root / "snippets")],
            destination=vscode_destination,
            recursive=True,
            verbose=self._is_verbose,
        )

        #

        logger.info("Dumping up VSCode extensions list...")

        vscode_extensions = DotfilePaths.root / "vscode" / "extensions.txt"

        Shell.run(command=["code", "--list-extensions", ">", vscode_extensions])

    def _run__misc(self) -> None:

        logger.info("Backing up Firefox Profiles...")

        firefox_profiles_source = (
            # Temporary fix to force a trailing slash. By default, pathlib
            # strips all trailing slashes and provides no way of adding them.
            str(Defaults.home / "Library/Application Support/Firefox/Profiles")
            + os.sep
        )

        firefox_profiles_destination = MiscPaths.private / "profiles" / "firefox"

        Shell.copy(
            sources=[firefox_profiles_source],
            destination=firefox_profiles_destination,
            recursive=True,
            verbose=self._is_verbose,
        )

    def _run__anki(self) -> None:

        if Shell.process_is_running(process_names=["Anki"]):
            logging.warning("Anki is currently running! Skipping...")
            return

        logger.info("Backing up Anki `Application Support` directories...")

        source_root = Defaults.home / "Library" / "Application Support"

        directories = source_root.glob("Anki*")

        archive_sources: list[pathlib.Path] = list(directories)
        archive_sources = [s.relative_to(source_root) for s in archive_sources]

        archive_filename: str = (
            f"{Defaults.today}"
            f"--anki-v{Version.anki}"
            f"--macos-v{Version.macOS}.tar.gz"
        )

        destination = ArchivePaths.anki / archive_filename

        Shell.archive(
            sources=archive_sources,
            destination=destination,
            source_root=source_root,
            verbose=self._is_verbose,
        )

        Shell.prune(path=ArchivePaths.anki, size=5)

    def _run__applebooks(self) -> None:

        if Shell.process_is_running(
            process_names=["Books", "iBooks", "Apple Books", "AppleBooks"]
        ):
            logging.warning("Apple Books is currently running! Skipping...")
            return

        logger.info("Backing up Apple Books `Containers` directories...")

        source_root = Defaults.home / "Library" / "Containers"

        # Globs the directories containing all the EPUBs, PDFs and Audiobooks.
        # e.g. `~/Library/Containers/com.apple.BKAgentService`
        directories_bk = source_root.glob("com.apple.BK*")

        # Globs the directories containing the annotation databases.
        # e.g `~/Library/Containers/com.apple.iBooksX`
        directories_ibooks = source_root.glob("com.apple.iBooks*")

        archive_sources: list[pathlib.Path] = [
            *list(directories_bk),
            *list(directories_ibooks),
        ]

        archive_sources = [s.relative_to(source_root) for s in archive_sources]

        archive_filename: str = (
            f"{Defaults.today}"
            f"--apple-books-v{Version.applebooks}"
            f"--macos-v{Version.macOS}.tar.gz"
        )

        archive_destination = ArchivePaths.applebooks / archive_filename

        Shell.archive(
            sources=archive_sources,
            destination=archive_destination,
            source_root=source_root,
            verbose=self._is_verbose,
        )

        Shell.prune(path=ArchivePaths.applebooks, size=5)
