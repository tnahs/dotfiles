import argparse
import logging
import pathlib
import shutil
import subprocess
from datetime import datetime
from typing import Dict, List, Tuple

import psutil


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


class OSUtils:
    def make_directory(self, path: pathlib.Path) -> None:
        """ Makes a directory.

        Path.mkdir()

            Create a new directory at this given path.

            If `parents` is true, any missing parents of this path are created
            as needed; they are created with the default permissions without
            taking mode into account (mimicking the POSIX mkdir -p command).

            If `exist_ok` is true, FileExistsError exceptions will be ignored
            (same behavior as the POSIX mkdir -p command), but only if the last
            path component is not an existing non-directory file.

        via https://docs.python.org/3/library/pathlib.html#pathlib.Path.mkdir
        """

        path.mkdir(parents=True, exist_ok=True)

    def remove(self, path: pathlib.Path) -> None:
        """ Removes a file or directory.

        shutil.rmtree(path)

            Delete an entire directory tree; path must point to a directory
            (but not a symbolic link to a directory). If ignore_errors is true,
            errors resulting from failed removals will be ignored.

        via https://docs.python.org/3/library/shutil.html#shutil.rmtree

        Path.unlink()

            Remove this file or symbolic link.

            If missing_ok is true, FileNotFoundError exceptions will be ignored
            (same behavior as the POSIX rm -f command).

        via https://docs.python.org/3/library/pathlib.html#pathlib.Path.unlink
        """

        if path.is_dir():
            shutil.rmtree(path)

        elif path.is_file():
            path.unlink(missing_ok=True)

    def copy(
        self,
        sources: List[pathlib.Path],
        destination: pathlib.Path,
        recursive: bool = False,
    ) -> None:
        """ Copies a list of files and/or directories.

        cp [options] source_file(s) target_folder

            Copy files.

            -p
                Cause cp to preserve the following attributes of each source
                file in the copy: modification time, access time, file flags,
                file mode, user ID, and group ID, as allowed by permissions.

                Access Control Lists (ACLs) will also be preserved.

            -R
                Copy the folder and subtree (recursive).

                If `source_file` designates a directory, cp copies the
                directory and the entire subtree connected at that point. If
                the `source_file` ends in a /, the contents of the directory
                are copied rather than the directory itself.

                This option also causes symbolic links to be copied, rather
                than indirected through, and for cp to create special files
                rather than copying them as normal files.

                Created directories have the same mode as the corresponding
                source directory, unmodified by the process' umask.

            -v   Verbose - show files as they are copied.

            via https://ss64.com/osx/cp.html """

        self.make_directory(destination)

        flags: List[str] = ["-p"]

        if recursive:
            flags.append("-R")

        try:
            subprocess.run(
                ["cp", *flags, *[str(s) for s in sources], destination],
                check=True,
                capture_output=True,
            )
        except subprocess.CalledProcessError:
            logging.exception("Exception raised while attempting to run `cp` command.")

    def archive(self, sources: List[pathlib.Path], destination: pathlib.Path,) -> None:
        """ Writes a `tar` archives from list of files and/or directories.

        tar [options] source_files

            Create, add files to, or extract files from an archive file in
            gnutar format, called a tarfile. Tape ARchiver; manipulate "tar"
            archive files.

            --create
                Create a new archive containing the specified items.

            --gzip
                (create mode only) Compress the resulting archive with gzip(1).

            via https://ss64.com/osx/tar.html """

        # Ensure the destination path has a tar-like file extension.
        if destination.suffixes not in [[".tar", ".gz"], [".tgz"]]:
            # Path.suffixes returns a list of the path’s file extensions.
            #   "tar.gz" -> [".tar", ".gz"]
            #   ".tgz"   -> [".tgz"]
            destination = destination.with_suffix(".tar.gz")

        try:
            subprocess.run(
                [
                    "tar",
                    "--create",
                    "--gzip",
                    f"--file={destination}",
                    *[str(s) for s in sources],
                ],
                check=True,
                capture_output=True,
            )
        except subprocess.CalledProcessError:
            logging.exception("Exception raised while attempting to run `tar` command.")

    def trim_folder(self, path: pathlib.Path, size: int) -> None:

        # Filter out any `.DS_Store` or like files.
        items: List[pathlib.Path] = [
            i for i in path.iterdir() if not i.name.startswith(".")
        ]

        # Skip if the folder size under the size limit.
        if len(items) <= size:
            return

        log.debug(f"Trimming {path} to {size} items...")

        # Sort by creation time so the first item is the newest file.
        # via https://docs.python.org/3/library/os.html#os.stat_result.st_ctime
        items = sorted(items, reverse=True, key=lambda p: p.stat().st_ctime)

        for count, item in enumerate(items, start=1):

            # Ignore the first n-files based on `size`.
            if count <= size:
                continue

            self.remove(path=item)

            log.debug(f"Removed {item.name} from {path}...")

    def process_is_running(self, process_names: List[str]) -> bool:
        """ Check to see an process is currently running. """

        process_names = [name.lower() for name in process_names]

        for proc in psutil.process_iter():

            try:
                pinfo = proc.as_dict(attrs=["name"])
            except psutil.NoSuchProcess:
                """ When a process doesn't have a name it might mean it's a
                zombie process which ends up raising a NoSuchProcess exception
                or its subclass the ZombieProcess exception. """
                pass
            except Exception:
                raise

            if pinfo["name"].lower() in process_names:
                return True

        return False


class Backup:

    osutils = OSUtils()

    def __init__(self, choice: str) -> None:

        self._choice = choice

    def backup(self) -> None:

        getattr(self, f"_run_{self._choice}")()

    def _run_all(self) -> None:
        self._run_dotfiles()
        self._run_anki()
        self._run_applebooks()

    def _run_dotfiles(self) -> None:

        log.info("Writing up Brewfile...")

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
            logging.exception(
                "Exception raised while attempting to run `brew` command."
            )

        #

        log.info("Backing up Moom Preferences...")

        moom_source = Defaults.home / "Library/Preferences/com.manytricks.Moom.plist"
        moom_destination = DotfilePaths.root / "moom"

        self.osutils.copy(
            sources=[moom_source], destination=moom_destination,
        )

        #

        log.info("Backing up VSCode `[settings|projects|keybindings].json`...")

        vscode_user_root = Defaults.home / "Library/Application Support/Code/User/"
        vscode_sources = [
            vscode_user_root / "projects.json",
            vscode_user_root / "settings.json",
            vscode_user_root / "keybindings.json",
        ]
        vscode_destination = DotfilePaths.root / "vscode"

        self.osutils.copy(sources=vscode_sources, destination=vscode_destination)

    def _run_anki(self) -> None:

        if self.osutils.process_is_running(process_names=["Anki"]):
            logging.warning("Anki is currently running! Skipping...")
            return

        log.info(f"Backing up Anki `Application Support` folder...")

        # Anki deck and addons folder
        source = Defaults.home / "Library/Application Support/Anki2/"
        destination = ArchivePaths.anki / f"anki-{Defaults.today}.tar.gz"

        self.osutils.archive(sources=[source], destination=destination)
        self.osutils.trim_folder(path=ArchivePaths.anki, size=5)

    def _run_applebooks(self) -> None:

        if self.osutils.process_is_running(
            process_names=["Books", "iBooks", "Apple Books"]
        ):
            logging.warning("Apple Books is currently running! Skipping...")
            return

        log.info(f"Backing up Apple Books...")

        # Apple Books databases / EPUBs
        db_source = Defaults.home / "Library/Containers/com.apple.iBooksX/"
        epubs_source = Defaults.home / "Library/Containers/com.apple.BKAgentService/"
        destination = ArchivePaths.applebooks / f"apple-books-{Defaults.today}.tar.gz"

        self.osutils.archive(sources=[db_source, epubs_source], destination=destination)
        self.osutils.trim_folder(path=ArchivePaths.applebooks, size=5)


if __name__ == "__main__":

    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument(
        "choice", type=str, choices=Defaults.choices,
    )
    parser.add_argument(
        "-v", "--verbose", action="store_true", default=False,
    )
    parser.add_argument(
        "-h", "--help", action="help", default=argparse.SUPPRESS, help="Backup stuff!",
    )
    args = parser.parse_args()

    #

    log = logging.getLogger()
    log.setLevel(Defaults.verbose[args.verbose])

    #

    backup = Backup(choice=args.choice)
    backup.backup()
