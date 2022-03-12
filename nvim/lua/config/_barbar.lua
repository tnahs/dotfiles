-- NOTE: Currently disabled. `barbar` required alot more customization to get
-- basic UI needs. Keeping this around in case I'd like to revisit it later on.

-- https://github.com/romgrk/barbar.nvim

vim.g.bufferline = {
    animation = false,
    closable = false,
    clickable = false,
    icons = false,
    icon_separator_active = "",
    icon_separator_inactive = "",
    maximum_padding = 8,
}

-- Keymaps ---------------------------------------------------------------------

local opts = { noremap = true, silent = true }

-- Custom toggle function to offset barbar by `NvimTree`'s width.
OffsetFileTree = {}
OffsetFileTree.toggle = function()
    local nvim_tree = require("nvim-tree")
    local nvim_tree_view = require("nvim-tree.view")
    local barbar_state = require("bufferline.state")

    if nvim_tree_view.is_visible() then
        barbar_state.set_offset(0)
        nvim_tree_view.close()
    else
        barbar_state.set_offset(nvim_tree_view.View.width + 1)
        nvim_tree.open()
    end
end

vim.cmd([[command! ToggleFileTree lua OffsetFileTree.toggle()]])

-- Toggle `NvimTree`.
vim.api.nvim_set_keymap("n", "<C-b>", ":ToggleFileTree<CR>", opts)

-- Closing buffers.
vim.api.nvim_set_keymap("n", "<leader>x", ":BufferClose<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>xa", ":%bdelete<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>xo", ":BufferCloseAllButCurrent<CR>", opts)

-- Navigate buffers.
vim.api.nvim_set_keymap("n", "L", ":BufferNext<CR>", opts)
vim.api.nvim_set_keymap("n", "H", ":BufferPrevious<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-Tab>", ":BufferNext<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-S-Tab>", ":BufferPrevious<CR>", opts)
