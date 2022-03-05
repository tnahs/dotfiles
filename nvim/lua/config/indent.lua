-- https://github.com/lukas-reineke/indent-blankline.nvim

-- TODO Indicators are too bright, find a dimmer color.

local indent_blankline = require("indent_blankline")

-- vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"

indent_blankline.setup({
    buftype_exclude = {
        "terminal",
        "nofile",
    },
    filetype_exclude = {
        "NvimTree",
        "packer",
        "help",
    },
    show_current_context = true,
    show_current_context_start = true,
    show_first_indent_level = false,
    use_treesitter = true,
})
