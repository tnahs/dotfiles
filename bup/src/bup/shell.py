import logging
import pathlib
import shutil
import subprocess
from typing import Iterator, Optional, Union

import psutil


logger = logging.getLogger(__name__)


class _Shell:

    TRASH = pathlib.Path().home() / ".Trash"

    def run(
        self,
        command: list[Union[str, pathlib.Path]],
        path: Optional[pathlib.Path] = None,
    ) -> None:
        """Runs a terminal command.

        command -- Command to run.
        path -- Path to run the command in.

        TODO:MED Document `Popen`."""

        command_normalized: list[str] = [str(s) for s in command]

        command_string: str = " ".join(command_normalized)

        # https://stackoverflow.com/a/28319191
        with subprocess.Popen(
            command_normalized,
            cwd=path,
            bufsize=1,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            universal_newlines=True,
        ) as process:

            logger.debug(f"Running command `{command_string}`.")

            for line in process.stdout:
                logger.debug(line.strip("\n"))

        if process.returncode != 0:
            raise subprocess.CalledProcessError(process.returncode, process.args)

    def make(self, path: pathlib.Path, as_file: bool = False) -> None:
        """Makes a file or directory. By default directorties are created
        unless `as_file=True`. Does not raise an Exception if the file or
        directory exists.

        path -- Path to a file or directory.
        as_file -- Make a file instead.

        Path.mkdir()

            Create a new directory at this given path.

            If `parents` is true, any missing parents of this path are created
            as needed; they are created with the default permissions without
            taking mode into account (mimicking the POSIX mkdir -p command).

            If `exist_ok` is true, FileExistsError exceptions will be ignored
            (same behavior as the POSIX mkdir -p command), but only if the last
            path component is not an existing non file.

        https://docs.python.org/3/library/pathlib.html#pathlib.Path.mkdir

        Path.touch()

            Create a file at this given path. If the file already exists, the
            function succeeds if `exist_ok` is true (and its modification time
            is updated to the current time), otherwise FileExistsError is
            raised.

        https://docs.python.org/3/library/pathlib.html#pathlib.Path.touch"""

        logger.debug(f"Making `{path}`.")

        if as_file:
            path.touch(exist_ok=True)
        else:
            path.mkdir(parents=True, exist_ok=True)

    def move(
        self, source: pathlib.Path, destination: pathlib.Path, force: bool = True
    ) -> None:
        """Move files and/or directories.

        source -- Path to file and/or directory to move.
        destination -- Path to move to.

        mv [options] source target

            Move files and/or folders.

            -i
                Prompt before moving a file that would overwrite an existing
                file. A response of `y` or `Y`, will allow the move to proceed.

        https://ss64.com/osx/mv.html"""

        flags: list[str] = []

        if force is False:
            flags.append("-i")

        logger.debug(f"Moving `{source}` to `{destination}`.")

        self.run(command=["mv", *flags, source, destination])

    def remove(self, path: pathlib.Path) -> None:
        """Removes a file or directory.

        path -- Path to file or directory to remove.

        shutil.rmtree(path)

            Delete an entire directory tree; path must point to a directory
            (but not a symbolic link to a directory). If ignore_errors is true,
            errors resulting from failed removals will be ignored.

        https://docs.python.org/3/library/shutil.html#shutil.rmtree

        Path.unlink()

            Remove this file or symbolic link.

            If missing_ok is true, FileNotFoundError exceptions will be ignored
            (same behavior as the POSIX rm -f command).

        https://docs.python.org/3/library/pathlib.html#pathlib.Path.unlink"""

        logger.debug(f"Removing `{path}`.")

        if path.is_dir():
            shutil.rmtree(path)

        elif path.is_file():
            path.unlink(missing_ok=True)

    def trash(self, path: pathlib.Path) -> None:
        """Move an item to the Trash."""

        logger.debug("Moving `{path}` to Trash.")

        self.move(source=path, destination=self.TRASH)

    def copy(
        self,
        sources: list[Union[pathlib.Path, str]],
        destination: pathlib.Path,
        recursive: bool = False,
        verbose: bool = False,
    ) -> None:
        """Copies a list of files and/or directories.

        sources -- Paths to files and/or directories to copy.
        destination -- Path to place copies.
        recursive -- Copy directories recursively.

        Why `cp`? It's fast, it can handle recursion easily and most
        importantly it can preserves file attributes.

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

        https://ss64.com/osx/cp.html"""

        self.make(path=destination)

        flags: list[str] = ["-p"]

        if recursive:
            flags.append("-R")

        if verbose:
            flags.append("-v")

        sources_string = ", ".join([f"`{source}`" for source in sources])
        logger.debug(f"Copying {sources_string} to `{destination}`.")

        self.run(command=["cp", *flags, *sources, destination])

    def link(
        self, original: pathlib.Path, symbolic: pathlib.Path, force: bool = False
    ) -> None:
        """Makes a symlink.

        original -- Path to original file.
        symbolic -- Path to where the symlink will reside.

        Path.symlink_to(target)

            Make this path a symbolic link to target.

        https://docs.python.org/3/library/pathlib.html"""

        logger.debug(f"Linking `{original}` to `{symbolic}`.")

        try:
            symbolic.symlink_to(original)

        except FileExistsError:

            if force is not True:
                logger.warning(
                    f"Linking `{original}` to `{symbolic}` skipped! Cannot create "
                    f"a link to an existing item: `{symbolic}`. Or link already "
                    f"exists. If so, run with force=True to refresh link. Use "
                    f"with caution, this will *remove* `{symbolic}` permanently!"
                )
                return

            self.remove(symbolic)
            symbolic.symlink_to(original)

    def archive(
        self,
        sources: list[pathlib.Path],
        destination: pathlib.Path,
        source_root: Optional[pathlib.Path] = None,
        verbose: bool = False,
    ) -> None:
        """Writes a `tar` archives from list of files and/or directories.

        sources -- Paths to files and/or directories to archive.
        destination -- Path, with filename and extension, of archive.

        Why `tar`? After some research, it was the only way to archive a
        full directory while preserving symlinks. All other methods broke
        symlinks. Tried `zipfile`, `tarfile` and `shutil.make_archive()`.

        tar [options] source_files

            Create, add files to, or extract files from an archive file in
            gnutar format, called a tarfile.

            --create
                Create a new archive containing the specified items.

            --gzip
                (create mode only) Compress the resulting archive with gzip(1).

            --directory DIRECTORY
                [T]his changes the directory before adding the following files.

            --file FILE
                [W]rite the archive to the specified file.

            --verbose
                Produce verbose output. In create and extract modes, tar will
                list each file name as it is read from or written to the
                archive.

        https://ss64.com/osx/tar.html"""

        # TODO:LOW Unexpected results when the filename includes periods.
        #
        # Ensure the destination path has a tar-like file extension.
        # if destination.suffixes not in [[".tar", ".gz"], [".tgz"]]:
        # Path.suffixes returns a list of the path’s file extensions.
        #   "tar.gz" -> [".tar", ".gz"]
        #   ".tgz"   -> [".tgz"]
        # destination = destination.with_suffix(".tar.gz")

        logger.debug(f"Creating archive `{destination}`.")

        # TODO:MED Test adding --xattrs.
        flags: list[str] = ["--create", "--gzip"]

        if verbose:
            flags.append("--verbose")

        if source_root is not None:
            flags.append(f"--directory={source_root}")

        self.run(command=["tar", *flags, f"--file={destination}", *sources])

    def prune(
        self,
        path: pathlib.Path,
        size: int,
        trash: bool = True,
        ignore_globs: Optional[list[str]] = None,
        ignore_files: bool = False,
        ignore_directories: bool = False,
    ) -> None:
        """Removes items from a directory based on a size limit, preserving
        the newest files based on metadata changes.

        Only runs if prunable contents are *greater than* `size`.

        path -- Path to prune.
        size -- Size to prune down to.
        trash -- Send pruned files to the Trash.
        ignore_globs -- Ignore files/directories that match these glob patterns.
        ignore_files -- Do not prune files.
        ignore_directories -- Do not prune directories."""

        logger.debug(f"Path `{path}` contains {len(list(path.iterdir()))} items.")

        if ignore_globs is None:
            # Ignore system files be default.
            ignore_globs = [".*"]

        ignoring: set[pathlib.Path] = set()
        for glob in ignore_globs:
            items: Iterator[pathlib.Path] = path.glob(glob)
            ignoring.update(items)

        prunable: list[pathlib.Path] = []
        for item in path.iterdir():

            if item in ignoring:
                continue

            if item.is_file() and ignore_files is True:
                ignoring.add(item)
                continue

            if item.is_dir() and ignore_directories is True:
                ignoring.add(item)
                continue

            prunable.append(item)

        logger.debug(f"Ignoring {len(ignoring)} items in `{path}`.")

        if len(prunable) <= size:
            logger.debug(
                "Pruning skipped! Number of prunable items is under the size limit."
            )
            return

        logger.debug(f"Found {len(prunable)} prunable items in `{path}`.")

        # Sort by the time of most recent metadata change on Unix.
        # https://docs.python.org/3/library/os.html#os.stat_result.st_ctime
        prunable = sorted(prunable, reverse=True, key=lambda p: p.stat().st_ctime)

        logger.info(f"Pruning `{path}` to {size} items.")

        for count, path in enumerate(prunable, start=1):

            # Ignore the first n-files based on `size`.
            if count <= size:
                continue

            logger.debug(f"Removing `{path.name}` from `{path}`.")

            # This explicit block is more of a safety measure to help prevent
            # un-wanted removal on incorrect use of the API.
            if trash is False:
                self.remove(path=path)
            else:
                self.trash(path=path)

    def process_is_running(self, process_names: list[str]) -> bool:
        """Check to see an process is currently running.

        process_names -- A list of names process might appear as."""

        process_names = [name.lower() for name in process_names]

        for process in psutil.process_iter():

            try:
                process_info = process.as_dict(attrs=["name"])
            except psutil.NoSuchProcess:
                """When a process doesn't have a name it might mean it's a
                zombie process which ends up raising a NoSuchProcess exception
                or its subclass the ZombieProcess exception."""
                continue

            process_name = process_info["name"].lower()

            if process_name in process_names:
                logger.debug(f"Process `{process_name}` currently running.")
                return True

        process_names_string = ", ".join([f"`{name}`" for name in process_names])
        logger.debug(
            f"No process with name(s) {process_names_string} currently running."
        )

        return False


Shell = _Shell()
