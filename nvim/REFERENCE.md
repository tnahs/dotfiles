# Reference

- `<C-w>v` - Create a vertical window split.
- `<C-w>s` - Create a horizontal window split.
- `<C-w>=` - Make all windows equally high and wide
- `<C-w>_` - Set current window height to highest possible.
- `<C-w>|` - Set current window width to the widest possible
- `<C-w>o` - Make the current window the only one on the screen.
- `<C-w>x` - Swap current window with next one.

---

- Populate the quickfix list.
- Use `:cdo` to execute a command for each item in the quickfix list.
- Use `update` to write the buffer to disk after each modification.

```vimscript
:cdo s/foo/bar/ | update
```

---

`alt+O` / `alt+o` : Adds a new line above/below cursor while in Insert mode.

---

`lua print(vim.bo.filetype)` to get the current filetype.

---

Search for a word `/word<CR>`.
Type `cgn` to change that occurance of the word.
Type `n` or `N` to move to the next/previous occurance you want to change.
Type `.` to repeat the change.
