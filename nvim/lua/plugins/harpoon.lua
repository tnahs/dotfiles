-- https://github.com/ThePrimeagen/harpoon

local ok, _ = pcall(require, "harpoon")
if not ok then
    print("Failed to load plugin: `ThePrimeagen/harpoon`.")
    return
end

-- Keymaps ---------------------------------------------------------------------

-- <C-d> Delete mark
-- <C-p> Move mark up
-- <C-n> Move mark down

-- Open `Harpoon` menu with `Telescope`.
vim.keymap.set("n", "<leader>hh", ":Telescope harpoon marks<CR>")

-- Add current file to `Harpoon`.
vim.keymap.set("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>")

-- Navigate marks.
vim.keymap.set("n", "<A-1>", ":lua require('harpoon.ui').nav_file(1)<CR>")
vim.keymap.set("n", "<A-2>", ":lua require('harpoon.ui').nav_file(2)<CR>")
vim.keymap.set("n", "<A-3>", ":lua require('harpoon.ui').nav_file(3)<CR>")
vim.keymap.set("n", "<A-4>", ":lua require('harpoon.ui').nav_file(4)<CR>")
vim.keymap.set("n", "<A-5>", ":lua require('harpoon.ui').nav_file(5)<CR>")
