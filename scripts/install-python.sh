#!/bin/zsh


function fix_libs() {
    # https://github.com/pyenv/pyenv/issues/1746#issuecomment-743689017

    path_openssl=$(brew --prefix openssl)
    path_readline=$(brew --prefix readline)
    path_xcode=$(xcrun --show-sdk-path)

    # 2020-12-26 NOTE: Python builds via pyenv fail on macOS BigSur. Adding the
    # env variables...

    export CFLAGS="-I${path_readline}/include -I${path_openssl}/include -I${path_xcode}/usr/include -O2"
    export LDFLAGS="-L${path_readline}/lib -L${path_openssl}/lib -L${path_xcode}/usr/lib"
    export PYTHON_CONFIGURE_OPTS=--enable-unicode=ucs2

    # ...before running pyenv fixed the issue. However older versions of Python
    # still did not work. Versions 3.8.6, 3.9.0 and 3.9-dev confirmed working.
}


function install_python {

    fix_libs

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