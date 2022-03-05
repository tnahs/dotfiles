-- https://github.com/lewis6991/gitsigns.nvim

local gitsigns = require("gitsigns")

gitsigns.setup({
    signs = {
        add = {
            hl = "GitSignsAdd",
            text = "┃",
        },
        change = {
            hl = "GitSignsChange",
            text = "┃",
        },
        delete = {
            hl = "GitSignsDelete",
            text = "◆",
        },
        topdelete = {
            hl = "GitSignsDelete",
            text = "◆",
        },
        changedelete = {
            hl = "GitSignsChange",
            text = "┃",
        },
    },
})
