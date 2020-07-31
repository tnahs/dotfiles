# Python Projects

## Installation

### pyenv

1. Install pyenv with Homebrew.

    ``` zsh
    $ brew install pyenv
    ```

2. Append to `~/.bash_profile` or `~/.zshrc`.

    ``` zsh
    # pyenv
    "$(pyenv init -)"
    ```

3. Install python and configure pyenv.

    ``` zsh
    # List all available versions.
    $ pyenv install --list

    # Install desired version.
    $ pyenv install 3.8.0

    # List all installed versions.
    $ pyenv versions
    * system (set by /Users/[user]/.pyenv/version)
    3.8.0

    # Set the system-wide version of python.
    $ pyenv global 3.8.0

    # Show current system-wide version.
    $ pyenv version
    3.8.0 (set by /Users/[user]/.pyenv/version)

    # Now typing 'python' invokes the system-wide version.
    $ python --version
    Python 3.8.0

    $ which python
    /Users/[user]/.pyenv/shims/python
    ```

### Poetry

1. Install Poetry via curl.

    ``` zsh
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
    ```

    > Poetry provides a custom installer that will install poetry isolated from the rest of your system by vendorizing its dependencies. This is the recommended way of installing poetry.
    >
    >via https://python-poetry.org/docs/#installation


2. Append to `~/.zshrc` or `~/.bash_profile`.

    ``` zsh
    # poetry
    export PATH="$HOME/.poetry/bin:$PATH"
    ```


## Making a new project

1. Create the project directory.

    ``` zsh
    $ mkdir project-name
    $ cd project-name

    # Create a `.python-version` file in the current directory.
    # This tells Poetry that we'll be using python 3.8.0 in this project and
    # to ignore the global python version.
    $ pyenv local 3.8.0

    # Create a blank 'src' project directory structure.
    $ poetry new --src project-name
    ```

    Our project directory should now look like this:

    ``` zsh
    project-name # Current directory.
    ├── .python-version
    └── project-name # Directory created by poetry.
        ├── README.rst
        ├── poetry.lock
        ├── pyproject.toml
        ├── src
        │   └── project_name
        │       └── __init__.py
        └── tests
            ├── __init__.py
            └── test_project_name.py
    ```

2. Create virtual environment and install packages.

    ``` zsh
    $ cd project-name

    # Create a virtual environment and installs dependencies in pyproject.toml.
    $ poetry install

    # Upgrade pip.
    $ poetry run pip install --upgrade pip

    # Optional: Updates setuptools for publishing/building.
    $ poetry run pip install --upgrade setuptools

    # Add development dependencies to pyproject.toml.
    $ poetry add --dev black mypy flake8

    # Add a new dependency to pyproject.toml.
    $ poetry add cowsay

    # Spawn a shell within the virtual environment.
    $ poetry shell
    ```

> Note: If you plan on using pyside2 make sure to explicitly declare your python version e.g. `python = "3.8.0"` inside pyproject.toml otherwise the installation might fail with a SolverProblemError.
>
> https://github.com/python-poetry/poetry/issues/1930#issuecomment-653885860 <br>
> https://github.com/python-poetry/poetry/issues/1930#issuecomment-653906544


## Project structure

``` zsh
project-name
├── .python-version
└── project-name
    ├── src
    │   ├── project_name
    │   │   └── __init__.py
    │   └── run.py
    │       └── # Entry point into `project_name`. For example:
    │           #
    │           # import project_name
    │           # app = project_name.App()
    │           # app.run()
    ├── tests
    │   └── __init__.py
    ├── README.md
    ├── LICENSE.txt
    ├── pyproject.toml
    ├── poetry.lock
    ├── .git
    ├── .gitignore
    ├── .gitattributes
    └── .vscode
        └── settings.json
```


## Setting up Visual Studio Code

1. Use Poetry's virtual environment inside Visual Studio Code

    Assuming the Python Extension is installed, press `Command+Shift+P` type `select interpreter` and choose the virtual environment from the dropdown.

    Or in your terminal, type:

    ``` zsh
    $ poetry env info
    # ...
    Path: /Users/[user]/Library/Caches/pypoetry/virtualenvs/[project-venv-name]
    # ...
    ```
    Open `project-name/project-name/.vscode/settings.json` and add the path from above to the attribute `python.pythonPath`:

    ``` json
    {
        "python.pythonPath": "/Users/[user]/Library/Caches/pypoetry/virtualenvs/[project-venv-name]/bin/python"
    }
    ```


2. Press `Command+,` and add the following to the global `settings.json`.

    ``` json
    {
        // Tells Visual Studio Code where all of Poetry's virtual environments are located.
        "python.venvPath": "~/Library/Caches/pypoetry/virtualenvs",
        "files.associations": {
            // Provides syntax highlighting for TOML files.
            "*.toml": "ini",
        },
    }
    ```


## Publishing to PyPI

First, build the package:

``` zsh
$ poetry build
```

Optionally you can install your own package using `pip`. Make sure you do it in a fresh virtual environment.

``` zsh
$ pip install /path/to/project-name-0.1.0.tar.gz
Processing /path/to/project-name-0.1.0.tar.gz
  Installing build dependencies ... done
  Getting requirements to build wheel ... done
    Preparing wheel metadata ... done
Successfully built project-name
Installing collected packages: # ...
Successfully installed # ...
```

Next, add Test PyPI as an alternate package repository:

``` zsh
$ poetry config repositories.testpypi https://test.pypi.org/simple/
```

You can check your current configuration by typing:
``` zsh
$ poetry config --list
cache-dir = "/Users/[user]/Library/Caches/pypoetry"
repositories.testpypi.url = "https://test.pypi.org/simple/"
virtualenvs.create = true
virtualenvs.in-project = false
virtualenvs.path = "{cache-dir}/virtualenvs"  # /Users/[user]/Library/Caches/pypoetry/virtualenvs
```

Now, publish the package to Test PyPI:

``` zsh
$ poetry publish -repository testpypi

Publishing project-name (0.1.0) to testpypi
Username:
Password:
 - Uploading project-name-0.1.0-py3-none-any.whl 100%
 - Uploading project-name-0.1.0.tar.gz 100%
```

Finally, verify that the package looks and works as intended by viewing it on testpypi.pypi.org and installing the test version in a separate virtual environment:


``` zsh
$ pip install --index-url https://test.pypi.org/simple/ project-name
```

If the package looks great on Test PyPI and works to boot, publishing to PyPI is as easy as:

``` zsh
$ poetry publish
```


## Resources

### pyenv
+ https://github.com/pyenv/pyenv#homebrew-on-macos
+ https://github.com/pyenv/pyenv#basic-github-checkout

### Poetry
+ https://python-poetry.org/docs/cli/#commands
+ https://www.pythoncheatsheet.org/blog/python-projects-with-poetry-and-vscode-part-1/
+ https://www.pythoncheatsheet.org/blog/python-projects-with-poetry-and-vscode-part-2/

### Publishing
+ https://python-poetry.org/docs/repositories/
+ https://johnfraney.ca/posts/2019/05/28/create-publish-python-package-poetry/
+ https://packaging.python.org/guides/using-testpypi/