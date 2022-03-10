# Reference

You can use the `:cdo` command to execute the substitute command for each
item in the quickfix list as shown below. The `update` part causes the buffer to
be written to disk after each modification.

```vimscript
:cdo s/foo/bar/ | update
```
