import logging
import pathlib
from datetime import datetime
from enum import Enum
from typing import Callable

from .shell import Shell
from .versions import Version


logger = logging.getLogger(__name__)


class ArgparseEnum(str, Enum):
    # https://stackoverflow.com/a/55500795
    @classmethod
    def argparse(cls, value: str):
        # def argparse(cls, value: str) -> "ArgparseEnum" | str:
        try:
            return cls[value.upper()]
        except KeyError:
            return value


class BupChoices(ArgparseEnum):
    ANKI = "anki"
    APPLEBOOKS = "applebooks"
    BREWFILE = "brewfile"
    DOWNLOADS = "downloads"
    MEDIA = "media"
    WORKSPACE = "workspace"


class Defaults:
    NAME = "bup"
    NAME_PRETTY = "BUP"
    HOME = pathlib.Path().home()
    TODAY = datetime.now().strftime("%Y-%m-%d")


class DotfilePaths:
    root = Defaults.HOME / ".dotfiles"


class ArchivePaths:
    root = Defaults.HOME / "Archives"
    anki = root / "anki"
    applebooks = root / "apple-books"
    downloads = root / "downloads"
    media = root / "media"
    workspace = root / "workspace"


class Bup:
    def __init__(
        self, run: list[BupChoices], run_all: bool = False, is_verbose: bool = False
    ) -> None:
        self._to_run = run if run_all is False else list(BupChoices)
        self._is_verbose = is_verbose

        paths = [
            ArchivePaths.applebooks,
            ArchivePaths.anki,
            ArchivePaths.media,
            ArchivePaths.workspace,
            ArchivePaths.downloads,
        ]

        for path in paths:
            path.mkdir(parents=True, exist_ok=True)

    def backup(self) -> None:
        if self._confirm() is False:
            return

        for choice in self._to_run:
            func: Callable[..., None] = getattr(self, f"_run__{choice.value}")
            logging.debug(f"Running {type(self).__name__}.{func.__name__}...")
            func()

    def _confirm(self) -> bool:
        confirm = input(
            f"{Defaults.NAME_PRETTY} will run: "
            f"{', '.join(self._to_run)}. Confirm? [y/N]: "
        )

        if confirm.lower().strip() not in ["y", "yes"]:
            print(f"{Defaults.NAME_PRETTY} cancelled.")
            return False

        return True

    def _run__workspace(self) -> None:
        logger.info("Backing up 'Workspace' directory...")

        source = Defaults.HOME / "Workspace"
        destination = ArchivePaths.workspace / f"{Defaults.TODAY}--workspace"

        Shell.rsync(
            sources=[source],
            destination=destination,
            verbose=self._is_verbose,
        )

    def _run__media(self) -> None:
        logger.info("Backing up 'Media' directory...")

        source = Defaults.HOME / "Media"
        destination = ArchivePaths.media / f"{Defaults.TODAY}--media"

        Shell.rsync(
            sources=[source],
            destination=destination,
            verbose=self._is_verbose,
        )

    def _run__downloads(self) -> None:
        logger.info("Backing up 'Downloads' directory...")

        source = Defaults.HOME / "Downloads"
        destination = ArchivePaths.downloads / f"{Defaults.TODAY}--downloads"

        Shell.rsync(
            sources=[source],
            destination=destination,
            verbose=self._is_verbose,
        )

    def _run__anki(self) -> None:
        if Shell.process_is_running(process_names=["Anki"]):
            logging.warning("Anki is currently running! Skipping...")
            return

        logger.info("Backing up Anki 'Application Support' directories...")

        source = Defaults.HOME / "Library" / "Application Support" / "Anki2"

        destination_name = (
            f"{Defaults.TODAY}--anki-v{Version.anki}--macos-v{Version.macOS}"
        )

        destination = ArchivePaths.anki / destination_name

        Shell.rsync(
            sources=[source],
            destination=destination,
            verbose=self._is_verbose,
        )

        Shell.prune(path=ArchivePaths.anki, size=5)

    def _run__applebooks(self) -> None:
        if Shell.process_is_running(
            process_names=["Books", "iBooks", "Apple Books", "AppleBooks"]
        ):
            logging.warning("Apple Books is currently running! Skipping...")
            return

        logger.info("Backing up Apple Books 'Containers' directories...")

        source_root = Defaults.HOME / "Library" / "Containers"

        # Globs the directories containing all the EPUBs, PDFs and Audiobooks.
        # e.g. '~/Library/Containers/com.apple.BKAgentService'
        source_bk = source_root.glob("com.apple.BK*")

        # Globs the directories containing the annotation databases.
        # e.g '~/Library/Containers/com.apple.iBooksX'
        source_ibooks = source_root.glob("com.apple.iBooks*")

        sources: list[pathlib.Path] = [*list(source_bk), *list(source_ibooks)]

        destination_name = (
            f"{Defaults.TODAY}"
            f"--apple-books-v{Version.applebooks}"
            f"--macos-v{Version.macOS}"
        )

        destination = ArchivePaths.applebooks / destination_name

        Shell.rsync(
            sources=sources,
            destination=destination,
            verbose=self._is_verbose,
        )

        Shell.prune(path=ArchivePaths.applebooks, size=5)

    def _run__brewfile(self) -> None:
        logger.info("Dumping Brewfile...")

        path_brewfile = DotfilePaths.root / "homebrew" / "Brewfile-dump"

        command = [
            "brew",
            "bundle",
            "dump",
            "--force",
            f"--file={path_brewfile}",
        ]

        if self._is_verbose:
            command.append("--verbose")

        Shell.run(command=command)  # type: ignore
