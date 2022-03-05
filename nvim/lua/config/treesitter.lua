-- https://github.com/nvim-treesitter/nvim-treesitter

local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
    ensure_installed = "maintained",
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    -- https://github.com/p00f/nvim-ts-rainbow
    rainbow = {
        enable = true,
        extended_mode = true,
    },
})
