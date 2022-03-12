-- https://github.com/folke/todo-comments.nvim

local ok, todo_comments = pcall(require, "todo-comments")
if not ok then
    print("Failed to load plugin: `folke/todo-comments.nvim`.")
    return
end

-- BUG: Report. Pressing `O` on a TODO comment directly under a non-commented
-- line throws and exception. It happens in `lua/config/lsp/init.lua`.
todo_comments.setup({
    keywords = {
        BUG = {
            icon = "█",
            color = "warning",
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
    -- BUG: Seems like the following settings don't work in `Telescope`.
    -- highlight = {
    --     keyword = "fg",
    --     after = "fg",
    -- },
})

-- Keymaps ---------------------------------------------------------------------

local opts = { noremap = true, silent = true }

-- Open TODOs in `Telescope`.
vim.api.nvim_set_keymap("n", "<leader>tt", ":TodoTelescope<CR>", opts)
