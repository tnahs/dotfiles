-- https://github.com/kazhala/close-buffers.nvim

local ok, _ = pcall(require, "close_buffers")
if not ok then
    print("Failed to load plugin: `kazhala/close-buffers.nvim`.")
    return
end

-- Keymaps ---------------------------------------------------------------------

-- Close current buffer.
vim.keymap.set("n", "<leader>xx", ":BDelete this<CR>")

-- Close other buffers.
vim.keymap.set("n", "<leader>xo", ":BDelete other<CR>")

-- Close all buffers.
vim.keymap.set("n", "<leader>xa", ":BDelete all<CR>")
