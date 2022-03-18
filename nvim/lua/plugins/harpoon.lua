-- https://github.com/ThePrimeagen/harpoon

local ok, _ = pcall(require, "harpoon")
if not ok then
    print("Failed to load plugin: `ThePrimeagen/harpoon`.")
    return
end

-- Keymaps ---------------------------------------------------------------------

local command = ":lua require('harpoon.ui').toggle_quick_menu()<CR>"
-- WIP: `Telescope` integration is a bit wonky. Revisit this later.
-- local ok_telescope, telescope = pcall(require, "telescope")
-- if ok_telescope then
--     telescope.load_extension("harpoon")
--     command = ":Telescope harpoon marks<CR>"
-- end

local opts = { noremap = true, silent = true }

-- Open `Harpoon` menu.
vim.api.nvim_set_keymap("n", "<leader>hh", command, opts)

-- Add current file to `Harpoon`.
vim.api.nvim_set_keymap("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>", opts)

-- Navigate marks.
vim.api.nvim_set_keymap("n", "<A-1>", ":lua require('harpoon.ui').nav_file(1)<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-2>", ":lua require('harpoon.ui').nav_file(2)<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-3>", ":lua require('harpoon.ui').nav_file(3)<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-4>", ":lua require('harpoon.ui').nav_file(4)<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-5>", ":lua require('harpoon.ui').nav_file(5)<CR>", opts)
