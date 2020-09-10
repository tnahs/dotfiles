# Create a Project

## Creating the Directory Structure

``` console
$ mkdir project-name
$ cd project-name
```

Set the python version with `pyenv`.

``` console
$ pyenv local 3.8.0
```

!!! note

    This create a `.python-version` file in the current directory telling `Poetry` that we'll be using Python 3.8.0 in this project and to ignore the global Python version.

Create a new project directory structure.

``` console
$ poetry new --src project-name
```

Our project directory should now look like this:

``` plaintext hl_lines="1 3"
project-name # Current directory.
├── .python-version
└── project-name # Directory created by Poetry.
    ├── README.rst
    ├── poetry.lock
    ├── pyproject.toml
    ├── src
    │   └── project_name
    │       └── __init__.py
    └── tests
        ├── __init__.py
        └── test_project_name.py
```

## Creating a Virtual Environment

``` console
$ cd project-name
```

Spawn a shell within the virtual environment

``` console
$ poetry shell
```

!!! note

    Running `poetry shell` activates a virtual environment if one exists for the current project, otherwise, it creates one.

Upgrade `pip` and `setuptools`.

``` console
$ poetry run pip install --upgrade pip
$ poetry run pip install --upgrade setuptools
```

## Installing dependancies

Add dev dependencies.

``` console
$ poetry add --dev black mypy flake8 pytest coverage
```

Add other dependencies.

``` console
$ poetry add ...
```

!!! warning

    If you plan on using `PySide2` make sure to explicitly declare your Python version e.g. `python = "3.8.0"` inside `pyproject.toml` otherwise the installation might fail with a `SolverProblemError`.

    <https://github.com/python-poetry/poetry/issues/1930#issuecomment-653885860> <br>
    <https://github.com/python-poetry/poetry/issues/1930#issuecomment-653906544>

## Final Project Structure

``` plaintext
project-name
├── .python-version
└── project-name
    ├── src
    │   ├── project_name
    │   │   └── __init__.py
    ├── tests
    │   ├── __init__.py
    │   └── test_project_name.py
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
