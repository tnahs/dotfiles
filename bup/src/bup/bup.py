import logging
import pathlib
from datetime import datetime
from enum import Enum
from typing import Callable, Union

from .shell import Shell
from .versions import Version


logger = logging.getLogger(__name__)


class ArgparseEnum(str, Enum):
    # https://stackoverflow.com/a/55500795
    @classmethod
    def argparse(cls, value: str) -> Union["ArgparseEnum", str]:
        try:
            return cls[value.upper()]
        except KeyError:
            return value


class E_BupChoices(ArgparseEnum):
    ANKI = "anki"
    APPLEBOOKS = "applebooks"
    DOTFILES = "dotfiles"
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
        self, run: list[E_BupChoices], run_all: bool = False, is_verbose: bool = False
    ) -> None:

        self._to_run = run if run_all is False else list(E_BupChoices)
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
            func: Callable = getattr(self, f"_run__{choice}")
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

    def _run__anki(self) -> None:

        if Shell.process_is_running(process_names=["Anki"]):
            logging.warning("Anki is currently running! Skipping...")
            return

        logger.info("Backing up Anki `Application Support` directories...")

        source_root = Defaults.HOME / "Library" / "Application Support"
        archive_source = pathlib.Path("Anki2")

        archive_filename = (
            f"{Defaults.TODAY}"
            f"--anki-v{Version.anki}"
            f"--macos-v{Version.macOS}.tar.gz"
        )

        archive_destination = ArchivePaths.anki / archive_filename

        Shell.archive(
            sources=[archive_source],
            destination=archive_destination,
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

        source_root = Defaults.HOME / "Library" / "Containers"

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

        archive_filename = (
            f"{Defaults.TODAY}"
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

    def _run__dotfiles(self) -> None:
        self._run__dotfiles_brewfile()
        self._run__dotfile_vscode()

    def _run__dotfiles_brewfile(self) -> None:

        logger.info("Dumping Brewfile...")

        path_brewfile = DotfilePaths.root / "homebrew" / "Brewfile"

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

    def _run__dotfile_vscode(self) -> None:

        logger.info("Backing up VSCode `[settings|keybindings].json`...")

        vscode_user_root = Defaults.HOME / "Library/Application Support/Code/User/"
        vscode_sources = [
            vscode_user_root / "settings.json",
            vscode_user_root / "keybindings.json",
        ]
        vscode_destination = DotfilePaths.root / "vscode"

        Shell.copy(
            sources=vscode_sources,  # type: ignore
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

    def _run__media(self) -> None:

        logger.info("Backing up `Media` directory...")

        media_root = Defaults.HOME
        media_source = pathlib.Path("Media")
        media_destination = ArchivePaths.media / f"{Defaults.TODAY}--media.tar.gz"

        Shell.archive(
            sources=[media_source],
            destination=media_destination,
            source_root=media_root,
            verbose=self._is_verbose,
        )

    def _run__workspace(self) -> None:

        logger.info("Backing up `Workspace` directory...")

        workspace_root = Defaults.HOME
        workspace_source = pathlib.Path("Workspace")
        workspace_destination = (
            ArchivePaths.workspace / f"{Defaults.TODAY}--workspace.tar.gz"
        )

        Shell.archive(
            sources=[workspace_source],
            destination=workspace_destination,
            source_root=workspace_root,
            verbose=self._is_verbose,
        )

    def _run__downloads(self) -> None:

        logger.info("Backing up `Downloads` directory...")

        downloads_root = Defaults.HOME
        downloads_source = pathlib.Path("Downloads")
        downloads_destination = (
            ArchivePaths.downloads / f"{Defaults.TODAY}--downloads.tar.gz"
        )

        Shell.archive(
            sources=[downloads_source],
            destination=downloads_destination,
            source_root=downloads_root,
            verbose=self._is_verbose,
        )
