-- https://github.com/kazhala/close-buffers.nvim

local ok, _ = pcall(require, "close_buffers")
if not ok then
    print("Failed to load plugin: `kazhala/close-buffers.nvim`.")
    return
end

-- Keymaps ---------------------------------------------------------------------

local opts = { noremap = true, silent = true }

-- Close current buffer.
vim.api.nvim_set_keymap("n", "<leader>xx", ":BDelete this<CR>", opts)

-- Close other buffers.
vim.api.nvim_set_keymap("n", "<leader>xo", ":BDelete other<CR>", opts)

-- Close all buffers.
vim.api.nvim_set_keymap("n", "<leader>xa", ":BDelete all<CR>", opts)
