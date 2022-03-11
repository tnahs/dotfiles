# Reference

- Populate the quickfix list.
- Use `:cdo` to execute a command for each item in the quickfix list.
- Use `update` to write the  buffer to disk after each modification.

```vimscript
:cdo s/foo/bar/ | update
```

---

`alt+O` / `alt+o` : Adds a new line above/below cursor while in Insert mode.

---

`lua print(vim.bo.filetype)` to get the current filetype.
