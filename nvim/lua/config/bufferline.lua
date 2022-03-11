-- https://github.com/akinsho/bufferline.nvim

local ok, bufferline = pcall(require, "bufferline")
if not ok then
    print("Failed to load plugin: `akinsho/bufferline.nvim`.")
    return
end

bufferline.setup({
    options = {
        indicator_icon = " ",
        separator_style = { "", "" },
        show_close_icon = false,
        tab_size = 24,
        left_trunc_marker = "◀",
        right_trunc_marker = "▶",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, _, _)
            -- Returns LEVEL:COUNT
            -- error       E:#
            -- warning     W:#
            -- hint        H:#
            -- info        I:#
            return level:sub(1, 1):upper() .. ":" .. count
        end,
        offsets = {
            { filetype = "NvimTree", text = "" },
        },
    },
})

-- Keymaps ---------------------------------------------------------------------

local opts = { noremap = true, silent = true }

-- Close all other buffers.
vim.api.nvim_set_keymap("n", "cc", ":BufferLineCloseLeft<CR> | :BufferLineCloseRight<CR>", opts)

-- Navigate buffers.
vim.api.nvim_set_keymap("n", "<A-l>", ":BufferLineCycleNext<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-h>", ":BufferLineCyclePrev<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-Tab>", ":BufferLineCycleNext<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-S-Tab>", ":BufferLineCyclePrev<CR>", opts)
