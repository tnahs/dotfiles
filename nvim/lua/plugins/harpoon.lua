-- https://github.com/ThePrimeagen/harpoon

local ok, _ = pcall(require, "harpoon")
if not ok then
    print("Failed to load plugin: `ThePrimeagen/harpoon`.")
    return
end

-- Keymaps ---------------------------------------------------------------------

local opts = { noremap = true, silent = true }

-- Open `Harpoon` menu with `Telescope`.
vim.api.nvim_set_keymap("n", "<leader>hh", ":Telescope harpoon marks<CR>", opts)

-- Add current file to `Harpoon`.
vim.api.nvim_set_keymap("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>", opts)

-- Navigate marks.
vim.api.nvim_set_keymap("n", "<A-1>", ":lua require('harpoon.ui').nav_file(1)<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-2>", ":lua require('harpoon.ui').nav_file(2)<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-3>", ":lua require('harpoon.ui').nav_file(3)<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-4>", ":lua require('harpoon.ui').nav_file(4)<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-5>", ":lua require('harpoon.ui').nav_file(5)<CR>", opts)
