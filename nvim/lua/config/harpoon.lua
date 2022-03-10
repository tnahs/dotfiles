-- https://github.com/ThePrimeagen/harpoon

local ok, harpoon = pcall(require, "harpoon")
if not ok then
    print("Failed to load plugin: `ThePrimeagen/harpoon`.")
    return
end

-- Keymaps ---------------------------------------------------------------------

local opts = { noremap = true, silent = true }

-- Open Harpoon menu.
vim.api.nvim_set_keymap("n", "<leader>h", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)

-- Add current file and line to Harpoon.
-- NOTE: Setting this to <C-m> triggered a bug when working with Quickfix lists.
vim.api.nvim_set_keymap("n", "<leader>m", ":lua require('harpoon.mark').add_file()<CR>", opts)

-- Navigate marks with `1-5`.
vim.api.nvim_set_keymap("n", "1", ":lua require('harpoon.ui').nav_file(1)<CR>", opts)
vim.api.nvim_set_keymap("n", "2", ":lua require('harpoon.ui').nav_file(2)<CR>", opts)
vim.api.nvim_set_keymap("n", "3", ":lua require('harpoon.ui').nav_file(3)<CR>", opts)
vim.api.nvim_set_keymap("n", "4", ":lua require('harpoon.ui').nav_file(4)<CR>", opts)
vim.api.nvim_set_keymap("n", "5", ":lua require('harpoon.ui').nav_file(5)<CR>", opts)
