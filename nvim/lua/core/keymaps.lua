-- Remap space as leader key.
vim.g.mapleader = " "
vim.keymap.set("", "<Space>", "<Nop>")

-- Normal ----------------------------------------------------------------------

-- Scroll faster and center cursor to screen.
vim.keymap.set("n", "<C-e>", "3<C-e>M")
vim.keymap.set("n", "<C-y>", "3<C-y>M")

-- Keep cursor centered when cycling matches.
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Maintain cursor position when joining lines.
vim.keymap.set("n", "J", "mzJ`z")

-- Source current buffer.
vim.keymap.set("n", "<leader>l", ":source %<CR>")

-- Save current buffer.
vim.keymap.set("n", "<leader>w", ":write<CR>")

-- Resize windows.
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- Window navigation.
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Cycle through quickfix and location list.
vim.keymap.set("n", "<leader>j", ":cnext<CR>")
vim.keymap.set("n", "<leader>k", ":cprev<CR>")
-- vim.keymap.set("n", "<leader>j", ":lnext<CR>")
-- vim.keymap.set("n", "<leader>k", ":lprev<CR>")

-- Open quickfix list.
vim.keymap.set("n", "<leader>q", ":copen<CR>")

-- Toggle spell checking.
vim.keymap.set("n", "<C-s>", ":set spell!<CR>")

-- Insert ----------------------------------------------------------------------

-- Add an undo breakpoint at each character.
local chars = { ".", ",", "(", "[", "{", "!", "?" }
for _, char in ipairs(chars) do
    vim.keymap.set("i", char, char .. "<C-g>u")
end

-- Visual ----------------------------------------------------------------------

-- Indent selected text.
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- Move selected text up and down.
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Retain yanked text on paste.
vim.keymap.set("v", "p", '"_dP')

-- Misc ------------------------------------------------------------------------

local trim_opts = ":keepjumps keeppatterns "

-- WIP: Trim trailing whitespace.
vim.keymap.set("n", "<leader>zw", trim_opts .. [[%s/\s\+$//e<CR>]])

-- WIP: Trim trailing lines.
vim.keymap.set("n", "<leader>zl", [[:0;/^\%(\n*.\)\@!/ + 0,$d<CR>]])
