# npm

List installed `npm` pacakges.

``` console
$ npm list -global --depth=0
```

Export installed `npm` packages.

``` console
$ npm list --global --parseable --depth=0 | sed '1d' | awk '{gsub(/\/.*\//,"",$1); print}' > path/to/file
```

Reinstall `npm` packages.

``` console
$ xargs npm install --global < path/to/file
```
