-- https://github.com/nvim-lualine/lualine.nvim

local ok, lualine = pcall(require, "lualine")
if not ok then
    print("Failed to load plugin: `nvim-lualine/lualine.nvim`.")
    return
end

lualine.setup({
    options = {
        icons_enabled = false,
        component_separators = { "", "" },
        section_separators = { "", "" },
        disabled_filetypes = { "NvimTree" },
    },
})
