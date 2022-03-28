-- https://github.com/stevearc/dressing.nvim

local ok, dressing = pcall(require, "dressing")
if not ok then
    print("Failed to load plugin: `stevearc/dressing.nvim`.")
    return
end

dressing.setup({
    input = {
        anchor = "NW",
        border = "single",
        winblend = 0,
    },
    select = {
        -- TODO: Customize this. Not quite sure where this dialog shows up.
        -- Options for telescope selector. These are passed into the telescope
        -- picker directly. Can be used like:
        --
        -- telescope = require('telescope.themes').get_ivy({...})
        telescope = nil,
    },
})
