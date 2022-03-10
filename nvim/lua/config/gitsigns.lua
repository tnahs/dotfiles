-- https://github.com/lewis6991/gitsigns.nvim

local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
    print("Failed to load plugin: `lewis6991/gitsigns.nvim`.")
    return
end

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
