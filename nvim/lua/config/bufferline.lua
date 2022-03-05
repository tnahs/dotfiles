-- https://github.com/akinsho/bufferline.nvim

local bufferline = require("bufferline")

bufferline.setup({
    options = {
        indicator_icon = " ",
        separator_style = { "", "" },
        show_close_icon = false,
        diagnostics = "nvim_lsp",
        offsets = {
            { filetype = "NvimTree", text = "" },
        },
    },
})
