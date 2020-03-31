import logging
import pathlib
import re
import shutil
import subprocess
import unicodedata
from typing import Iterator, List, Optional, Set, Union

import psutil


class OSUtils:
    def __init__(self, logger: logging.Logger) -> None:

        self._logger = logger

    def run(
        self,
        command: List[Union[str, pathlib.Path]],
        path: Optional[pathlib.Path] = None,
    ) -> None:
        """ Runs a terminal command.

        command -- Command to run.
        path -- Path to run the command in.

        Note: Shell features such as pipes, wildcards and `~` expansion etc.
        are *not* supported.

        subprocess.run()

            If shell is True, the specified command will be executed through
            the shell. This can be useful if you are using Python primarily for
            the enhanced control flow it offers over most system shells and
            still want convenient access to other shell features such as shell
            pipes, filename wildcards, environment variable expansion, and
            expansion of ~ to a user’s home directory.

            If `check` is true, and the process exits with a non-zero exit
            code, a CalledProcessError exception will be raised. Attributes of
            that exception hold the arguments, the exit code, and stdout and
            stderr if they were captured.

            If `capture_output` is true, stdout and stderr will be captured.

            If `cwd` is not None, the function changes the working directory to
            `cwd` before executing the child. `cwd` can be a string, bytes or
            path-like object. In particular, the function looks for executable
            (or for the first item in args) relative to `cwd` if the executable
            path is a relative path.

            via https://docs.python.org/3/library/subprocess.html#subprocess.run
        """

        command_normalized: List[str] = [str(s) for s in command]
        command_string: str = " ".join(command_normalized)

        self._logger.debug(f"Running command `{command_string}`...")

        try:
            subprocess.run(
                command_normalized, check=True, capture_output=True, cwd=path,
            )
        except subprocess.CalledProcessError:
            self._logger.exception(
                f"Exception raised while attempting to run command: {command_string}."
            )

    def make(self, path: pathlib.Path, as_file: bool = False) -> None:
        """ Makes a file or directory. By default directorties are created
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
            path component is not an existing non-directory file.

        via https://docs.python.org/3/library/pathlib.html#pathlib.Path.mkdir

        Path.touch()

            Create a file at this given path. If the file already exists, the
            function succeeds if `exist_ok` is true (and its modification time
            is updated to the current time), otherwise FileExistsError is
            raised.

        https://docs.python.org/3/library/pathlib.html#pathlib.Path.touch """

        if as_file:
            path.touch(exist_ok=True)
            return

        path.mkdir(parents=True, exist_ok=True)

    def remove(self, path: pathlib.Path) -> None:
        """ Removes a file or directory.

        path -- Path to file or directory to remove.

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

            via https://ss64.com/osx/cp.html """

        self.make(path=destination)

        flags: List[str] = ["-p"]

        if recursive:
            flags.append("-R")

        self.run(command=["cp", *flags, *sources, destination])

    def link(
        self, original: pathlib.Path, symbolic: pathlib.Path, force: bool = False
    ) -> None:
        """ Makes a symlink.

        original -- Path to original file.
        symbolic -- Path to where the symlink will reside.

        Path.symlink_to(target)

            Make this path a symbolic link to target.

        via https://docs.python.org/3/library/pathlib.html
        """
        try:
            symbolic.symlink_to(original)

        except FileExistsError:

            if force is True:
                self.remove(symbolic)
                symbolic.symlink_to(original)
                return

            self._logger.warning(
                f"Linking `{original}` -> `{symbolic}` skipped! Cannot create "
                f"a link to an existing item: `{symbolic}`. Or link already "
                f"exists. If so, run with force=True to refresh link. Use "
                f"with caution, this will *remove* `{symbolic}` permanantly!"
            )

    def archive(self, sources: List[pathlib.Path], destination: pathlib.Path) -> None:
        """ Writes a `tar` archives from list of files and/or directories.

        sources -- Paths to files and/or directories to archive.
        destination -- Path, with filename and extension, of archive.

        Why `tar`? After some research, it was the only way to archive a
        full directory while preserving symlinks. All other methods broke
        symlinks. Tried `zipfile`, `tarfile` and `shutil.make_archive()`.

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

        self.run(
            command=["tar", "--create", "--gzip", f"--file={destination}", *sources]
        )

    def prune(
        self,
        path: pathlib.Path,
        size: int,
        ignore_globs: Optional[List[str]] = None,
        ignore_files: bool = False,
        ignore_directories: bool = False,
    ) -> None:
        """ Removes (read: rm -f) items from a directory based on a size limit
        preserving the newest files based on metadata changes.

        Only runs if prunable contents are *greater than* `size`.

        path -- Path to prune.
        size -- Size to prune to.
        ignore_globs -- List of glob patterns to ignore.
        ignore_files -- Ignore pruning files.
        ignore_directories -- Ignore pruning directories. """

        self._logger.debug(
            f"Path `{path}` contains {len(list(path.iterdir()))} items..."
        )

        if ignore_globs is None:
            ignore_globs = [".*"]

        ignore: Set[pathlib.Path] = set()
        for glob in ignore_globs:
            globbed: Iterator[pathlib.Path] = path.glob(glob)
            ignore.update(globbed)

        prunables: List[pathlib.Path] = []
        for item in path.iterdir():

            if item in ignore:
                continue

            if item.is_file() and ignore_files is True:
                ignore.add(item)
                continue

            if item.is_dir() and ignore_directories is True:
                ignore.add(item)
                continue

            prunables.append(item)

        self._logger.debug(f"Ignoring {len(ignore)} items in `{path}`...")

        # Skip if the number of prunables items is under the size limit.
        if len(prunables) <= size:
            return

        self._logger.debug(f"Found {len(prunables)} prunable items in `{path}`...")

        # Sort by the time of most recent metadata change on Unix.
        # via https://docs.python.org/3/library/os.html#os.stat_result.st_ctime
        prunables = sorted(prunables, reverse=True, key=lambda p: p.stat().st_ctime)

        for count, path in enumerate(prunables, start=1):

            # Ignore the first n-files based on `size`.
            if count <= size:
                continue

            self.remove(path=path)

            self._logger.debug(f"Removed {path.name} from `{path}`...")

        self._logger.info(f"Pruned `{path}` to {size} items...")

    def process_is_running(self, process_names: List[str]) -> bool:
        """ Check to see an process is currently running.

        process_names -- A list of names process might appear as. """

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

    def slugify(self, string: str, delimiter: str = "-", lowercase: bool = True):
        """ Returns a normalized string. Converts to ASCII, strips non-word
        characters, lowers case and replaces spaces with `delimeter`.

        via. https://docs.djangoproject.com/en/3.0/_modules/django/utils/text/#slugify
        """

        string = str(string)

        string = (
            unicodedata.normalize("NFKD", string)
            .encode("ascii", "ignore")
            .decode("ascii")
        )

        if lowercase:
            string = string.lower()

        string = string.strip()
        string = re.sub(r"[^\w\s-]", "", string)
        string = re.sub(r"[\s-]+", delimiter, string)

        return string
