-- https://github.com/kyazdani42/nvim-tree.lua

local nvim_tree = require("nvim-tree")

nvim_tree.setup({
    view = {
        width = 35,
    },
})

local opts = { noremap = true, silent = true }

-- Toggle NvimTree
vim.api.nvim_set_keymap("n", "<C-b>", ":NvimTreeToggle<CR>", opts)

-- Find current file in NvimTree
vim.api.nvim_set_keymap("n", "<C-f>", ":NvimTreeFindFile<CR>", opts)
