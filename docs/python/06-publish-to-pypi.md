# Publish to PyPI

First, build the package:

``` console
$ poetry build
```

!!! tip

    You can install your own package using `pip`. Make sure you do it in a fresh virtual environment.

    ``` console
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

``` console
$ poetry config repositories.testpypi https://test.pypi.org/simple/
```

You can check your current configuration by typing:

``` console
$ poetry config --list
cache-dir = "/Users/[user]/Library/Caches/pypoetry"
repositories.testpypi.url = "https://test.pypi.org/simple/"
virtualenvs.create = true
virtualenvs.in-project = false
virtualenvs.path = "{cache-dir}/virtualenvs"  # /Users/[user]/Library/Caches/pypoetry/virtualenvs
```

Now, publish the package to Test PyPI:

``` console
$ poetry publish -repository testpypi

Publishing project-name (0.1.0) to testpypi
Username:
Password:
 - Uploading project-name-0.1.0-py3-none-any.whl 100%
 - Uploading project-name-0.1.0.tar.gz 100%
```

Finally, verify that the package looks and works as intended by viewing it on test.pypi.org and installing the test version in a separate virtual environment:

``` console
$ pip install --index-url https://test.pypi.org/simple/ project-name
```

If everything looks good, publishing to PyPI is as easy as:

``` console
$ poetry publish
```

## Resources

+ <https://python-poetry.org/docs/repositories/>
+ <https://johnfraney.ca/posts/2019/05/28/create-publish-python-package-poetry/>
+ <https://packaging.python.org/guides/using-testpypi/>
