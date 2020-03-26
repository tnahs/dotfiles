import argparse
import logging
import pathlib
import subprocess
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
    def __init__(self, logger: logging.Logger) -> None:

        self._logger = logger
        self._osutils = osutils.OSUtils(logger=logger)

    def rebuild(self) -> None:
        pass

    def _run_link_dotfiles(self) -> None:

        paths = [
            {
                "original": DotfilePaths.root / "bash" / ".bash_profile",
                "symbolic": Defaults.home / ".bash_profile",
            },
            {
                "original": DotfilePaths.root / "bash" / ".bashrc",
                "symbolic": Defaults.home / ".bashrc",
            },
            # {
            #     "original": DotfilePaths.root / "zsh" / ".zshrc",
            #     "symbolic": Defaults.home / ".zshrc",
            # },
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

        # profile_path = Defaults.home / ".zshrc"
        profile_path = Defaults.home / ".bash_profile"

        try:
            subprocess.run(
                ["source", str(profile_path)], check=True, capture_output=True,
            )
        except subprocess.CalledProcessError:
            self._logger.exception(
                "Exception raised while attempting to run `source` command."
            )

    def _run_install_brewfile(self) -> None:

        try:
            subprocess.run(["brew", "bundle"], check=True, cwd=pathlib.Path.home())
        except subprocess.CalledProcessError:
            self._logger.exception(
                "Exception raised while attempting to run `brew bundle` command."
            )

    def _restore_application_preferences(self) -> None:

        self._logger.info("Restoring iTerm2 preferences...")

        #

        self._logger.info("Restoring Moom preferences...")

        moom_source = DotfilePaths.root / "moom"
        moom_destination = (
            Defaults.home / "Library/Preferences/com.manytricks.Moom.plist"
        )

        self._osutils.copy(
            sources=[moom_source], destination=moom_destination,
        )

        #

        try:
            subprocess.run(
                ["code", "--install-extension", "Shan.code-settings-sync"], check=True,
            )
        except subprocess.CalledProcessError:
            self._logger.exception(
                "Exception raised while attempting to run `code` command."
            )

    def _install_global_packages(self) -> None:

        # Bothbrew `pipx` and `pyenv` should have already been installed
        # through the `Brewfile`.

        try:
            subprocess.run(["pipx", "install", "bpython"], check=True)
        except subprocess.CalledProcessError:
            self._logger.exception(
                "Exception raised while attempting to run `pipx` command."
            )

        try:
            subprocess.run(["pyenv", "install", "3.8.0"], check=True)
            subprocess.run(["pyenv", "global", "3.8.0"], check=True)
        except subprocess.CalledProcessError:
            self._logger.exception(
                "Exception raised while attempting to run `pyenv` command."
            )

        try:
            subprocess.run(["pip", "install", "psutil"], check=True)
        except subprocess.CalledProcessError:
            self._logger.exception(
                "Exception raised while attempting to run `pyenv` command."
            )


if __name__ == "__main__":

    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument(
        "-v", "--verbose", action="store_true", default=False,
    )
    parser.add_argument(
        "-h",
        "--help",
        action="help",
        default=argparse.SUPPRESS,
        help="Re-build stuff!",
    )
    args = parser.parse_args()

    #

    logger = logging.getLogger()
    logger.setLevel(Defaults.verbose[args.verbose])

    #

    rebuild = Build(logger=logger)
    rebuild.rebuild()
