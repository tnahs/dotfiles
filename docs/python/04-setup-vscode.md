# Setup Visual Studio Code

## Setting up the Virtual Environment

### Via the Command Palette

Install the [Python Extension for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=ms-python.python).

Press ++command+comma++ and add the following to the global `settings.json`.

``` json
{
    // ...
    // Tells Visual Studio Code where all of Poetry's virtual environments are located.
    "python.venvPath": "~/Library/Caches/pypoetry/virtualenvs",
    "files.associations": {
        // Provide syntax highlighting for TOML files.
        "*.toml": "ini",
    },
    // ...
}
```

Press ++command+shift+p++ to invoke the Command Palette. Type `select interpreter` and select `Python: Select Interpreter`.

In the new dropdown select the virtual environment corresponding to your project. It should look something like this:

``` plaintext
Python 3.8.0 64-bit ([project-venv-name]: venv)
~/Library/Caches/pypoetry/virtualenvs/[project-venv-name]/bin/python
```

### Via `settings.json`

In the terminal, type:

``` console
$ poetry env info

Virtualenv
Python:         3.8.0
Implementation: CPython
Path:           /Users/[user]/Library/Caches/pypoetry/virtualenvs/[project-venv-name]
Valid:          True

System
Platform: darwin
OS:       posix
Python:   /Users/[user]/.pyenv/versions/3.8.0
```

Open `.vscode/settings.json` inside your project directory and add the path from above to the attribute `python.pythonPath`:

``` json
{
    // ...
    "python.pythonPath": "/Users/[user]/Library/Caches/pypoetry/virtualenvs/[project-venv-name]/bin/python"
    // ...
}
```

!!! note

    Note that `/bin/python` has been added to the end of the path.

## Configuring Python Settings

Press ++command+comma++ and add the following to the global `settings.json`.

``` json
    // ...
    "[python]": {
        "editor.formatOnSave": true,
        "editor.tabSize": 4,
        "editor.insertSpaces": true,
        "editor.detectIndentation": false,
    },
    "python.formatting.provider": "black",
    "python.linting.mypyEnabled": true,
    "python.linting.enabled": true,
    "python.linting.flake8Enabled": true,
    "python.linting.flake8Args": [],
    // ...
```
