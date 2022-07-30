import logging
import pathlib
import plistlib
import subprocess


logger = logging.getLogger(__name__)


class _Versions:
    def _get_via_app_bundle(self, path: pathlib.Path | str) -> str:
        """
        Parses and returns an application's version based on its 'Info.plist'.

        Args:
            path:
        """

        path = pathlib.Path(path) / "Contents" / "Info.plist"

        if not path.exists():
            logger.warning(
                f"Could not determine application version. Missing: {path}..."
            )
            return "?"

        with open(path, "rb") as f:
            data = plistlib.load(f)

        bundle_short_version: str = data.get("CFBundleShortVersionString", "?")
        bundle_version: str = data.get("CFBundleVersion", None)

        if bundle_version is None:
            return f"{bundle_short_version}"

        return f"{bundle_short_version}-{bundle_version}"

    @property
    def macOS(self) -> str:
        """Returns the current macOS version."""

        result = subprocess.run(["sw_vers", "-productVersion"], stdout=subprocess.PIPE)

        return result.stdout.decode("utf-8").strip()

    @property
    def applebooks(self) -> str:
        """Returns the current Apple Books verion."""

        return self._get_via_app_bundle(path="/System/Applications/Books.app")

    @property
    def anki(self) -> str:
        """Returns the current Anki version."""

        return self._get_via_app_bundle(path="/Applications/Anki.app")


Version = _Versions()
