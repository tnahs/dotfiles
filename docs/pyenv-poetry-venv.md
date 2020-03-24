# Install `pyenv` and `poetry`


## `pyenv`

1. Install `pyenv` with `Homebrew`

    ``` bash
    brew install pyenv
    ```

2. Append to `~/.bash_profile` or `~/.zshrc`.

    ``` bash
    # pyenv
    "$(pyenv init -)"
    ```

3. In a fresh terminal.

    ``` bash
    pyenv install 3.8.0
    pyenv versions
    pyenv global 3.8.0
    python -V
    which python
    ```


## `poetry`

1. Install via curl

    ``` bash
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
    ```

    > Poetry provides a custom installer that will install poetry isolated from the rest of your system by vendorizing its dependencies. This is the recommended way of installing poetry.
    >
    >via https://python-poetry.org/docs/#installation


2. Append to `~/.bash_profile` or `~/.zshrc`.

    ``` bash
    # poetry
    export PATH="$HOME/.poetry/bin:$PATH"
    ```

# Making a new project!

``` bash
mkdir project-name

cd project-name

# Creates a `.python-version` file in the current directoy.
pyenv local 3.8.0

# Creates a src-type project directory structure.
poetry new --src project-name

# project-name (current directory)
# ├── .python-version
# └── project-name (directory created by poetry)
#     ├── README.rst
#     ├── poetry.lock
#     ├── pyproject.toml
#     ├── src
#     │   └── project_name
#     │       └── __init__.py
#     └── tests
#         ├── __init__.py
#         └── test_project_name.py

cd project-name

# (Optional)
# poetry config virtualenvs.in-project true

# Builds the virtual environment.
poetry install

#
poetry add --dev black mypy flake8 [other-packages]

#
poetry add [other-packages]

#
poerty env info

#
poetry shell

#
code .
```

# Setting up `VSCode`

1. Add `poetry` virtual environment to `VSCode Workspace Settings`

    In `project-name/project-name/.vscode/settings.json`:

    ``` bash
    # project-name
    # ├── .python-version
    # └── project-name (current directory)
    #     ...
    #     ├── .vscode
    #     │   └── settings.json
    #     ...
    ```

    Add:
    ``` json
    {
        "python.pythonPath": "~/Library/Caches/pypoetry/virtualenvs/[project-name]/bin/python"
    }
    ```

    Or in the GUI press `Command+Shift+P` and type `select interpreter` and choose your virtual environment from the dropdown.

2. (Optional) In `~/Library/Application Support/Code/User.settings.json`

    ``` json
    {
        "python.venvPath": "~/Library/Caches/pypoetry/virtualenvs",
        "python.formatting.provider": "black",
        "editor.formatOnSave": true,
        "python.linting.enabled": true,
        "python.linting.mypyEnabled": true,
        "python.linting.flake8Enabled": true,
        "python.linting.pylintEnabled": false,
        "files.associations": {
            "*.toml": "ini",
        },
        "files.exclude": {
            "**/.mypy_cache": true
        }
    }
    ```


# Final Project Structure

``` bash
project-name
├── .python-version
└── project-name
    ├── src
    │   ├── project_name
    │   │   └── __init__.py
    │   └── run.py
    │       └── # Entrypoint into `project_name`. For example:
    │           #
    │           # import project_name
    │           # app = project_name.App()
    │           # app.run()
    ├── tests
    │   └── __init__.py
    ├── poetry.lock
    ├── pyproject.toml
    ├── README.md
    ├── .vscode
    │   └── settings.json
    ├── .gitignore
    ├── .gitattributes
    ├── .git
    └── LICENSE.txt
```


# Resources

+ https://github.com/pyenv/pyenv#homebrew-on-macos
+ https://github.com/pyenv/pyenv#basic-github-checkout
+ https://python-poetry.org/docs/cli/#commands
+ https://www.pythoncheatsheet.org/blog/python-projects-with-poetry-and-vscode-part-1/
+ https://www.pythoncheatsheet.org/blog/python-projects-with-poetry-and-vscode-part-2/
