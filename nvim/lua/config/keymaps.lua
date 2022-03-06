local opts = { noremap = true, silent = true }

-- Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", opts)

-- Normal ---------------------------------------------------------------------

-- Window navigation
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)

-- Faster scrolling
vim.api.nvim_set_keymap("n", "<C-e>", "3<C-e>M", opts)
vim.api.nvim_set_keymap("n", "<C-y>", "3<C-y>M", opts)

-- Save current buffer
vim.api.nvim_set_keymap("n", "<leader>w", ":w<CR>", opts)

-- Close all buffers
vim.api.nvim_set_keymap("n", "<leader>d", ":bdelete<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>da", ":%bdelete<CR>", opts)

-- Source current buffer
vim.api.nvim_set_keymap("n", "<leader>r", ":source %<CR>", opts)

-- Split windows
vim.api.nvim_set_keymap("n", "<C-s>h", ":split<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-s>v", ":vsplit<CR>", opts)

-- Resize with arrows
-- TODO Can we remap these using `hjkl`?
vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Down>", ":resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Up>", ":resize +2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
vim.api.nvim_set_keymap("n", "<S-l>", ":bnext<CR>", opts)
vim.api.nvim_set_keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Visual ---------------------------------------------------------------------

-- Stay in indent mode
vim.api.nvim_set_keymap("v", "<Tab>", ">gv", opts)
-- TODO this does not work...
-- vim.api.nvim_set_keymap("v", "<S-Tab>", "<gv", opts)

-- Move text up and down
vim.api.nvim_set_keymap("v", "<A-j>", ":m .+1<CR>==", opts)
vim.api.nvim_set_keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Retain yanked text
vim.api.nvim_set_keymap("v", "p", '"_dP', opts)

-- Visual Block ---------------------------------------------------------------

-- Move text up and down
vim.api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
vim.api.nvim_set_keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
vim.api.nvim_set_keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
