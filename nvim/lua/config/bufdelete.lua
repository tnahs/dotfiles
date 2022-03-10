-- https://github.com/famiu/bufdelete.nvim

local ok, bufdelete = pcall(require, "bufdelete")
if not ok then
    print("Failed to load plugin: `famiu/bufdelete.nvim`.")
    return
end

local opts = { noremap = true, silent = true }

-- Close current buffer.
vim.api.nvim_set_keymap("n", "<leader>d", ":Bdelete<CR>", opts)

-- Close all buffers.
vim.api.nvim_set_keymap("n", "<leader>da", ":%bdelete<CR>", opts)
