-- https://github.com/folke/todo-comments.nvim

local ok, todo_comments = pcall(require, "todo-comments")
if not ok then
    print("Failed to load plugin: `folke/todo-comments.nvim`.")
    return
end

todo_comments.setup({
    keywords = {
        -- BUG: comment...
        BUG = {
            icon = "●",
            color = "warning",
        },
        -- FIX: comment...
        FIX = {
            icon = "●",
            color = "error",
            alt = { "FIXME" },
        },
        -- NOTE: comment...
        NOTE = {
            icon = "●",
            color = "hint",
            alt = { "INFO" },
        },
        -- TODO: comment...
        TODO = {
            icon = "●",
            color = "info",
        },
        -- WIP: comment...
        WIP = {
            icon = "●",
            color = "default",
            alt = { "TEMP" },
        },
    },
    -- BUG: Seems like the following settings don't work in `Telescope`.
    highlight = {
        keyword = "fg",
        after = "fg",
    },
})

-- Keymaps ---------------------------------------------------------------------

local opts = { noremap = true, silent = true }

-- Open TODOs in Telescope.
vim.api.nvim_set_keymap("n", "<leader>t", ":TodoTelescope<CR>", opts)
