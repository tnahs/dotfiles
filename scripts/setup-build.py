import argparse
import logging
import pathlib
from datetime import datetime
from typing import Dict

import osutils


logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s %(levelname)s: %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)


class Defaults:

    home: pathlib.Path = pathlib.Path().home()
    today: str = datetime.now().strftime("%Y-%m-%d")

    verbose: Dict[bool, int] = {
        True: logging.DEBUG,
        False: logging.INFO,
    }


class DotfilePaths:

    root = Defaults.home / ".dotfiles"


class Build:
    def __init__(self, python_version: str, logger: logging.Logger) -> None:

        self._python_version = python_version
        self._logger = logger
        self._osutils = osutils.OSUtils(logger=logger)

    def rebuild(self) -> None:
        self._run_link_dotfiles()
        self._run_source_profile()
        self._run_install_brewfile()
        self._restore_application_preferences()

    def _run_link_dotfiles(self) -> None:

        paths = [
            {
                "original": DotfilePaths.root / "zsh" / ".zshrc",
                "symbolic": Defaults.home / ".zshrc",
            },
            {
                "original": DotfilePaths.root / ".gitignore",
                "symbolic": Defaults.home / ".gitignore",
            },
            {
                "original": DotfilePaths.root / "Brewfile",
                "symbolic": Defaults.home / "Brewfile",
            },
        ]

        for path in paths:

            original = path.get("original", None)
            symbolic = path.get("symbolic", None)

            if not original or not symbolic:
                continue

            self._osutils.link(original=original, symbolic=symbolic)

    def _run_source_profile(self) -> None:

        path = Defaults.home / ".zshrc"

        self._osutils.run(command=["source", path])

    def _run_install_brewfile(self) -> None:

        self._osutils.run(command=["brew", "bundle"], path=pathlib.Path.home())

    def _restore_application_preferences(self) -> None:

        self._logger.info("Restoring iTerm2 preferences...")

        #

        self._logger.info("Restoring Moom preferences...")

        moom_source = DotfilePaths.root / "moom" / "com.manytricks.Moom.plist"
        moom_destination = Defaults.home / "Library/Preferences"

        self._osutils.copy(
            sources=[moom_source], destination=moom_destination,
        )

        #
        self._logger.info("Installing VSCode Settings Sync extension...")

        self._osutils.run(
            command=["code", "--install-extension", "Shan.code-settings-sync"]
        )

    def _install_python_packages(self) -> None:

        """ At this point `pipx` and `pyenv` have been installed through
        `Homebrew` via the `Brewfile`. """
        self._osutils.run(command=["pipx", "install", "bpython"])
        self._osutils.run(command=["pyenv", "install", self._python_version])
        self._osutils.run(command=["pyenv", "global", self._python_version])
        self._osutils.run(command=["pip", "install", "psutil"])


if __name__ == "__main__":

    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument(
        "-py",
        "--python",
        metavar="VERSION",
        dest="python_version",
        type=str,
        required=True,
        help="Version to install (via pyenv).",
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

    rebuild = Build(python_version=args.python_version, logger=logger)
    rebuild.rebuild()
