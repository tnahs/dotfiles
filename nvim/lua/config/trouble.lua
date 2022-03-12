-- https://github.com/folke/trouble.nvim

local ok, trouble = pcall(require, "trouble")
if not ok then
    print("Failed to load plugin: `folke/trouble.nvim`.")
    return
end

trouble.setup({
    height = 16,
    auto_preview = true,
    icons = false,
    padding = false,
    signs = {
        error = "█",
        warning = "█",
        hint = "█ ",
        information = "█",
    },
    action_keys = {
        hover = "gh",
    },
})

-- Keymaps ---------------------------------------------------------------------

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<leader>p", ":TroubleToggle<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>pw", ":Trouble workspace_diagnostics<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>pd", ":Trouble document_diagnostics<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>pl", ":Trouble loclist<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>pq", ":Trouble quickfix<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>pr", ":Trouble lsp_references<CR>", { silent = true, noremap = true })
