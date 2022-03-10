local opts = { noremap = true, silent = true }

-- Remap space as leader key.
vim.g.mapleader = " "
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", opts)

-- Normal ----------------------------------------------------------------------

-- Scroll faster and center cursor to screen.
vim.api.nvim_set_keymap("n", "<C-e>", "3<C-e>M", opts)
vim.api.nvim_set_keymap("n", "<C-y>", "3<C-y>M", opts)

-- Keep cursor centered when cylcing matches.
vim.api.nvim_set_keymap("n", "n", "nzzzv", opts)
vim.api.nvim_set_keymap("n", "N", "Nzzzv", opts)

-- Maintain cursor position when joining lines.
vim.api.nvim_set_keymap("n", "J", "mzJ`z", opts)

-- Source current buffer.
vim.api.nvim_set_keymap("n", "<leader>l", ":source %<CR>", opts)

-- Save current buffer.
vim.api.nvim_set_keymap("n", "<leader>w", ":write<CR>", opts)

-- Navigate buffers.
vim.api.nvim_set_keymap("n", "L", ":bnext<CR>", opts)
vim.api.nvim_set_keymap("n", "H", ":bprevious<CR>", opts)

-- Create a window split.
vim.api.nvim_set_keymap("n", "<C-s>h", ":split<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-s>v", ":vsplit<CR>", opts)

-- Transform a horizontal to a vertical split and vice-versa.
vim.api.nvim_set_keymap("n", "<C-s>th", "<C-w>t<C-w>H", opts)
vim.api.nvim_set_keymap("n", "<C-s>tv", "<C-w>t<C-w>K", opts)

-- Resize windows to defaults.
vim.api.nvim_set_keymap("n", "<C-s>=", "<C-w>=", opts)
vim.api.nvim_set_keymap("n", "<C-s>-", "<C-w>_", opts)
vim.api.nvim_set_keymap("n", "<C-s>\\", "<C-w>|", opts)

-- Resize windows with `Control` + arrows.
vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Down>", ":resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Up>", ":resize +2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Window navigation using `Contrl` + `hjkl`.
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)

-- TODO: Find good keymappings for these.
-- Cycle through QuickFix list.
-- vim.api.nvim_set_keymap("n", "<C-l>", ":cnext<CR>", opts)
-- vim.api.nvim_set_keymap("n", "<C-L>", ":cprev<CR>", opts)

-- Insert ----------------------------------------------------------------------

-- Add an undo breakpoint at each `chars`.
local chars = { ".", ",", "(", "[", "{", "!", "?" }
for _, char in ipairs(chars) do
    vim.api.nvim_set_keymap("i", char, char .. "<C-g>u", opts)
end

-- Visual ----------------------------------------------------------------------

-- Indent selected text.
vim.api.nvim_set_keymap("v", ">", ">gv", opts)
vim.api.nvim_set_keymap("v", "<", "<gv", opts)

-- Move selected text up and down.
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", opts)

-- Retain yanked text on paste.
vim.api.nvim_set_keymap("v", "p", '"_dP', opts)
