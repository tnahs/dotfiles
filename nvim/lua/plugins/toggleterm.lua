-- https://github.com/akinsho/toggleterm.nvim

local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
    print("Failed to load plugin: `akinsho/toggleterm.nvim `.")
    return
end

toggleterm.setup({
    size = 20,
    open_mapping = "<C-\\>",
    direction = "tab",
})

-- Keymaps ---------------------------------------------------------------------

local opts = { noremap = true, silent = true }

function _G.set_terminal_keymaps()
    vim.api.nvim_buf_set_keymap(0, "t", "<esc>", "<C-\\><C-n>", opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", "<C-\\><C-n><C-W>h", opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", "<C-\\><C-n><C-W>j", opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", "<C-\\><C-n><C-W>k", opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", "<C-\\><C-n><C-W>l", opts)
end

-- If you only want these mappings for toggleterm use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
