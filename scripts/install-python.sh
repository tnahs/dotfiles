#!/bin/zsh


function install_python {

    # 2020-12-26 NOTE: Python builds via pyenv fail on macOS BigSur. Adding the
    # env variable...

    export LDFLAGS='-L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib/'

    # ...before running pyenv fixed the issue. However older versions of Python
    # still did not work. Versions 3.8.6 and 3.9.0 confirmed working.
    #
    # Run `xcrun --show-sdk-path` to make sure the base-path is correct. Tried
    # a string interpolated version of the command...
    #
    #   export LDFLAGS='-L $(xcrun --show-sdk-path)/usr/lib/'
    #
    # ...but this did not work.
    #
    # via https://github.com/pyenv/pyenv/issues/1746#issuecomment-739316392

    local python_versions=($@)
    local python_packages=(
        "psutil"
    )

    for version in $python_versions; do
        printf "\nInstalling Python ${version} via pyenv...\n\n"
        pyenv install $version

        if [[ $? -ne 0 ]] then;
            printf "\nError: Installation of Python ${version} encountered an error. Skipping remainder of installation.\n\n"
            continue
        fi

        pyenv global $version

        printf "\nUpdating pip for Python ${version}...\n\n"
        pip install --upgrade pip
        pip install --upgrade setuptools

        for package in $python_packages; do
            printf "\nInstalling ${package} for Python ${version}...\n\n"
            pip install $package
        done

    done
}


function main {
    if [[ $# -lt 1 ]] then;
        echo "Error: Please provide atleast one version of Python to install."
        exit 2
    else
        install_python $@
    fi
}


main $@