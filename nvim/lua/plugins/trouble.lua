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
        hover = "<leader>lh",
        -- cancel = "<Esc>",
        -- close = "q",
        -- close_folds = { "zM", "zm" },
        -- jump = { "<CR>", "<Tab>" },
        -- jump_close = { "o" },
        -- next = "j",
        -- open_folds = { "zR", "zr" },
        -- open_split = { "<C-x>" },
        -- open_tab = { "<C-t>" },
        -- open_vsplit = { "<C-v>" },
        -- preview = "p",
        -- previous = "k",
        -- refresh = "r",
        -- toggle_fold = { "zA", "za" },
        -- toggle_mode = "m",
        -- toggle_preview = "P",
    },
})

-- Keymaps ---------------------------------------------------------------------

vim.keymap.set("n", "<leader>pp", ":TroubleToggle<CR>")
vim.keymap.set("n", "<leader>pl", ":Trouble loclist<CR>")
vim.keymap.set("n", "<leader>pq", ":Trouble quickfix<CR>")
vim.keymap.set("n", "<leader>pw", ":Trouble workspace_diagnostics<CR>")
vim.keymap.set("n", "<leader>pd", ":Trouble document_diagnostics<CR>")
vim.keymap.set("n", "<leader>pr", ":Trouble lsp_references<CR>")
