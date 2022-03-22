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
        other = "█",
    },
    action_keys = {
        -- Matches the LSP hover keymap. See `lua/lsp/nvim-lspconfig.lua`.
        hover = "lh",
    },
})

-- Keymaps ---------------------------------------------------------------------

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<leader>pp", ":TroubleToggle<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>pl", ":Trouble loclist<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>pq", ":Trouble quickfix<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>pw", ":Trouble workspace_diagnostics<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>pd", ":Trouble document_diagnostics<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>pr", ":Trouble lsp_references<CR>", opts)
