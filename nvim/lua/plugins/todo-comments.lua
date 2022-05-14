-- https://github.com/folke/todo-comments.nvim

local ok, todo_comments = pcall(require, "todo-comments")
if not ok then
    print("Failed to load plugin: `folke/todo-comments.nvim`.")
    return
end

-- BUG: Report. Pressing `O` on a TODO comment directly under a non-commented
-- line causes the parser to bug out.
todo_comments.setup({
    keywords = {
        BUG = {
            icon = "█",
            color = "warning",
            alt = { "WARNING" },
        },
        FIX = {
            icon = "█",
            color = "error",
            alt = { "FIXME" },
        },
        NOTE = {
            icon = "█",
            color = "hint",
            alt = { "INFO" },
        },
        TODO = {
            icon = "█",
            color = "info",
        },
        WIP = {
            icon = "█",
            color = "default",
            alt = { "TEMP" },
        },
    },
    merge_keywords = false,
})

-- Keymaps ---------------------------------------------------------------------

local opts = { noremap = true, silent = true }

-- Open TODOs in `Telescope`.
vim.api.nvim_set_keymap("n", "<leader>tt", ":TodoTelescope<CR>", opts)
