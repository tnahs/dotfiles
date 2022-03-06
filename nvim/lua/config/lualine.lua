-- https://github.com/nvim-lualine/lualine.nvim

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    print("Failed to load plugin: `nvim-lualine/lualine.nvim`.")
    return
end

lualine.setup({
    options = {
        icons_enabled = false,
        section_separators = "",
        component_separators = "",
    },
})
