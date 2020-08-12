# Install Poetry

!!! quote

    Poetry provides a custom installer that will install poetry isolated from the rest of your system by vendorizing its dependencies. This is the recommended way of installing poetry.

    via <https://python-poetry.org/docs/#installation>

## Installation

Install Poetry via `curl`.

``` console
$ curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
```

## Setup

Append the following to `~/.zshrc` or `~/.bash_profile`:

``` shell
# poetry
export PATH="$HOME/.poetry/bin:$PATH"
```

## Resources

+ <https://python-poetry.org/docs/cli/#commands>
+ <https://www.pythoncheatsheet.org/blog/python-projects-with-poetry-and-vscode-part-1/>
+ <https://www.pythoncheatsheet.org/blog/python-projects-with-poetry-and-vscode-part-2/>
