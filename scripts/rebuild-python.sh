#!/bin/zsh


# Install pipx packages -------------------------------------------------------

printf "\nInstalling pipx packages...\n\n"

pipx_packages="
bpython
youtube-dl
gallery-dl
flake8
black
mypy
isort
"

# `man zshexpn` : Parameter Expansion
for package in ${(f)pipx_packages}; do

    pipx install $package

done

# -----------------------------------------------------------------------------


# Install Python via pyenv ----------------------------------------------------
#
# 2020-12-26 NOTE: Python builds via pyenv fail on macOS BigSur. Adding the env
# variable...
#
export LDFLAGS='-L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib/'
#
# ...before running pyenv fixed the issue. However older versions of Python
# still did not work. Versions 3.8.6 and 3.9.0 confirmed working.
#
# Run `xcrun --show-sdk-path` to make sure the base-path is correct. Tried a
# string interpolated version of the command...
#
#   export LDFLAGS='-L $(xcrun --show-sdk-path)/usr/lib/'
#
# ...but this did not work.
#
# via https://github.com/pyenv/pyenv/issues/1746#issuecomment-739316392

python_versions='
3.8.6
3.9.0
'

for version in ${(f)python_versions}; do

    printf "\nInstalling Python ${version} via pyenv...\n\n"

    pyenv install $version
    pyenv global $version

    printf "\nUpdating pip for Python ${version}...\n\n"

    pip install --upgrade pip
    pip install --upgrade setuptools

    printf "\nInstalling psutil for Python ${version}...\n\n"

    pip install psutil

done

# -----------------------------------------------------------------------------
