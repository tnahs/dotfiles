local opts = { noremap = true, silent = true }

-- Remap space as leader key.
vim.g.mapleader = " "
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", opts)

-- Normal ----------------------------------------------------------------------

-- Scroll faster and center cursor to screen.
vim.api.nvim_set_keymap("n", "<C-e>", "3<C-e>M", opts)
vim.api.nvim_set_keymap("n", "<C-y>", "3<C-y>M", opts)

-- Keep cursor centered when cycling matches.
vim.api.nvim_set_keymap("n", "n", "nzzzv", opts)
vim.api.nvim_set_keymap("n", "N", "Nzzzv", opts)

-- Maintain cursor position when joining lines.
vim.api.nvim_set_keymap("n", "J", "mzJ`z", opts)

-- Source current buffer.
vim.api.nvim_set_keymap("n", "<leader>l", ":source %<CR>", opts)

-- Save current buffer.
vim.api.nvim_set_keymap("n", "<leader>w", ":write<CR>", opts)

-- Create a vertical window split.
vim.api.nvim_set_keymap("n", "<A-v>", ":vsplit<CR>", opts)

-- Swap current window with next one.
vim.api.nvim_set_keymap("n", "<A-x>", "<C-w>x", opts)

-- Resize windows to defaults.
vim.api.nvim_set_keymap("n", "<A-=>", "<C-w>=", opts)
vim.api.nvim_set_keymap("n", "<A-->", "<C-w>_", opts)
vim.api.nvim_set_keymap("n", "<A-\\>", "<C-w>|", opts)

-- Resize windows with `Control` + arrows.
vim.api.nvim_set_keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-Down>", ":resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-Up>", ":resize +2<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-- Window navigation using `Control` + `hjkl`.
vim.api.nvim_set_keymap("n", "H", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "J", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "K", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "L", "<C-w>l", opts)

-- Cycle through Quickfix and Local list.
vim.api.nvim_set_keymap("n", "<C-j>", ":cnext<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-k>", ":cprev<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>j", ":lnext<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>k", ":lprev<CR>", opts)

-- Toggle spell checking.
vim.api.nvim_set_keymap("n", "<C-s>", ":set spell!<CR>", opts)

-- Insert ----------------------------------------------------------------------

-- Add an undo breakpoint at each character.
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

-- Misc ------------------------------------------------------------------------

local trim_opts = ":keepjumps keeppatterns "

-- WIP: Trim trailing whitespace.
vim.api.nvim_set_keymap("n", "<A-t>w", trim_opts .. [[%s/\s\+$//e<CR>]], opts)

-- WIP: Trim trailing lines.
vim.api.nvim_set_keymap("n", "<A-t>l", [[:0;/^\%(\n*.\)\@!/ + 0,$d]], opts)
