-- https://github.com/akinsho/bufferline.nvim
-- https://github.com/famiu/bufdelete.nvim

local ok, bufferline = pcall(require, "bufferline")
if not ok then
    print("Failed to load plugin: `akinsho/bufferline.nvim`.")
    return
end

bufferline.setup({
    options = {
        indicator_icon = " ",
        separator_style = { "", "" },
        show_buffer_close_icons = false,
        modified_icon = "",
        show_close_icon = false,
        tab_size = 32,
        left_trunc_marker = "◀",
        right_trunc_marker = "▶",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count)
            return tostring(count)
        end,
        offsets = {
            { filetype = "NvimTree", text = "" },
        },
    },
})

-- Keymaps ---------------------------------------------------------------------

local opts = { noremap = true, silent = true }

-- Close buffers.
vim.api.nvim_set_keymap("n", "<leader>x", ":Bdelete<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>xo", ":BufferLineCloseLeft<CR> | :BufferLineCloseRight<CR>", opts)

-- Navigate buffers.
vim.api.nvim_set_keymap("n", "L", ":BufferLineCycleNext<CR>", opts)
vim.api.nvim_set_keymap("n", "H", ":BufferLineCyclePrev<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-Tab>", ":BufferLineCycleNext<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-S-Tab>", ":BufferLineCyclePrev<CR>", opts)
