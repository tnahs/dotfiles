local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", opts)

-- Normal --

-- Window navigation
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)

-- Faster scrolling
vim.api.nvim_set_keymap("n", "<C-e>", "3<C-e>M", opts)
vim.api.nvim_set_keymap("n", "<C-y>", "3<C-y>M", opts)

-- Save current buffer
vim.api.nvim_set_keymap("n", "<leader>s", ":w<CR>", opts)

-- Source current buffer
vim.api.nvim_set_keymap("n", "<leader>r", ":source %<CR>", opts)

-- Split windows
vim.api.nvim_set_keymap("n", "<C-s>h", ":split<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-s>v", ":vsplit<CR>", opts)

-- Resize with arrows
vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Down>", ":resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Up>", ":resize +2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
vim.api.nvim_set_keymap("n", "<S-l>", ":bnext<CR>", opts)
vim.api.nvim_set_keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Open NvimTree
-- https://github.com/kyazdani42/nvim-tree.lua
vim.api.nvim_set_keymap("n", "<leader>b", ":NvimTreeToggle<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeFindFile<CR>", opts)

-- Open Telescope
-- https://github.com/nvim-telescope/telescope.nvim
-- Install `ripgrep` to use `live_grep` & `grep_string`: `brew install ripgrep`
vim.api.nvim_set_keymap("n", "<C-p>c", ":Telescope commands<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-p>f", ":Telescope find_files<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-p>g", ":Telescope live_grep<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-p>b", ":Telescope buffers<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-p>p", ":Telescope diagnostics<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-p>d", ":Telescope lsp_document_symbols<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-p>w", ":Telescope lsp_workspace_symbols<CR>", opts)

-- Visual --

-- Stay in indent mode
vim.api.nvim_set_keymap("v", "<Tab>", ">gv", opts)
-- TODO this does not work...
-- vim.api.nvim_set_keymap("v", "<S-Tab>", "<gv", opts)

-- Move text up and down
vim.api.nvim_set_keymap("v", "<A-j>", ":m .+1<CR>==", opts)
vim.api.nvim_set_keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Retain yanked text
vim.api.nvim_set_keymap("v", "p", '"_dP', opts)

-- Visual Block --

-- Move text up and down
vim.api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
vim.api.nvim_set_keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
vim.api.nvim_set_keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --

-- Better terminal navigation
vim.api.nvim_set_keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
vim.api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
vim.api.nvim_set_keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
vim.api.nvim_set_keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
