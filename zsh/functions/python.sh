function uv-reinstall {
  uv tool uninstall "$1" && uv tool install . --force --no-cache
}
