# Install pyenv

## Installation

Install `pyenv` with `Homebrew`.

``` shell
$ brew install pyenv
```

## Setup

Append to `~/.bash_profile` or `~/.zshrc`.

``` shell
# pyenv
"$(pyenv init -)"
```

## Configuration

List all available versions.

``` console
$ pyenv install --list
```

Install desired version.

``` console
$ pyenv install 3.8.0
```

List all installed versions.

``` console
$ pyenv versions
* system (set by /Users/[user]/.pyenv/version)
3.8.0
```

Set the system-wide version of python.

``` console
$ pyenv global 3.8.0
```

Show current system-wide version.

``` console
$ pyenv version
3.8.0 (set by /Users/[user]/.pyenv/version)
```

Now typing `python` invokes the system-wide version.

``` console
$ python --version
Python 3.8.0
$ which python
/Users/[user]/.pyenv/shims/python
```

## Resources

+ <https://github.com/pyenv/pyenv#homebrew-on-macos>
+ <https://github.com/pyenv/pyenv#basic-github-checkout>
