import argparse
import logging
import pathlib
import sys
from datetime import datetime
from typing import Dict, List, Optional

import helpers


logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s %(levelname)s: %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)


logger = logging.getLogger()


class Defaults:

    home = pathlib.Path().home()
    today: str = datetime.now().strftime("%Y-%m-%d")


class DotfilePaths:

    root = Defaults.home / ".dotfiles"


class Rebuild:
    def __init__(self, python_version: str) -> None:

        self._python_version = python_version

        if not DotfilePaths.root.exists():
            raise FileNotFoundError(DotfilePaths)

    def rebuild(self) -> None:

        self._link_dotfiles()
        self._source_zshrc()
        self._install_brewfile()
        self._install_python_packages()
        self._restore_application_preferences()

    def _link_dotfiles(self) -> None:

        paths: List[Dict[str, pathlib.Path]] = [
            {
                "original": DotfilePaths.root / "zsh" / ".zshrc",
                "symbolic": Defaults.home / ".zshrc",
            },
            {
                "original": DotfilePaths.root / "homebrew" / "Brewfile",
                "symbolic": Defaults.home / "Brewfile",
            },
            {
                "original": DotfilePaths.root / "skhd" / ".skhdrc",
                "symbolic": Defaults.home / ".skhdrc",
            },
            {
                "original": DotfilePaths.root / "yabai" / ".yabairc",
                "symbolic": Defaults.home / ".yabairc",
            },
        ]

        for path in paths:

            original: Optional[pathlib.Path] = path.get("original", None)
            symbolic: Optional[pathlib.Path] = path.get("symbolic", None)

            if not original or not symbolic:
                logging.error(f"Missing path in {path}. Skipping...")
                continue

            helpers.shell.link(original=original, symbolic=symbolic)

    def _source_zshrc(self) -> None:

        path = Defaults.home / ".zshrc"

        helpers.shell.run(command=["source", path])

    def _install_brewfile(self) -> None:

        helpers.shell.run(command=["brew", "bundle"], path=pathlib.Path.home())

    def _install_python_packages(self) -> None:

        # At this point pipx has been installed through Homebrew...
        helpers.shell.run(command=["pipx", "install", "bpython"])
        helpers.shell.run(command=["pipx", "install", "youtube-dl"])
        helpers.shell.run(command=["pipx", "install", "gallery-dl"])
        helpers.shell.run(command=["pipx", "install", "flake8"])
        helpers.shell.run(command=["pipx", "install", "black"])
        helpers.shell.run(command=["pipx", "install", "mypy"])
        helpers.shell.run(command=["pipx", "install", "isort"])

        # ...as well as pyenv.
        helpers.shell.run(command=["pyenv", "install", self._python_version])
        helpers.shell.run(command=["pyenv", "global", self._python_version])

        # Update pip for pyenv's active Python version.
        helpers.shell.run(command=["pip", "install", "--upgrade", "pip"])
        helpers.shell.run(command=["pip", "install", "--upgrade", "setuptools"])

        # Install packages to pyenv's active Python version.
        helpers.shell.run(command=["pip", "install", "psutil"])

    def _restore_application_preferences(self) -> None:

        logger.info("Restoring Moom preferences...")

        source_moom = DotfilePaths.root / "moom" / "com.manytricks.Moom.plist"
        destination_moom = Defaults.home / "Library" / "Preferences"

        helpers.shell.copy(
            sources=[source_moom],
            destination=destination_moom,
        )


if __name__ == "__main__":

    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument(
        "-p",
        "--python",
        metavar="VERSION",
        dest="python_version",
        type=str,
        required=True,
        help="Version to install (via pyenv).",
    )
    parser.add_argument(
        "-v",
        "--verbose",
        dest="is_verbose",
        action="store_true",
        default=False,
        help="Set logging to DEBUG.",
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

    verbosity: Dict[bool, int] = {
        True: logging.DEBUG,
        False: logging.INFO,
    }

    logger.setLevel(verbosity[args.is_verbose])

    #

    try:
        rebuild = Rebuild(python_version=args.python_version)
        rebuild.rebuild()
    except Exception:
        logger.exception("Exception raised while attempting to rebuild.")
        sys.exit(-1)
