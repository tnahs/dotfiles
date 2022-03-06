-- https://github.com/kyazdani42/nvim-tree.lua

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    print("Failed to load plugin: `nvim-tree`.")
    return
end

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
