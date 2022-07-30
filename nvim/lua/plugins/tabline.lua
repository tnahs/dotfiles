-- https://github.com/kdheepak/tabline.nvim
-- https://github.com/famiu/bufdelete.nvim

local ok, tabline = pcall(require, "tabline")
if not ok then
    print("Failed to load plugin: `kdheepak/tabline.nvim`.")
    return
end

tabline.setup({
    options = {
        section_separators = { "", "" },
        component_separators = { "", "" },
        show_tabs_always = true,
        show_devicons = false,
        modified_icon = "• ",
    },
})

-- Keymaps ---------------------------------------------------------------------

vim.keymap.set("n", "L", ":TablineBufferNext<CR>")
vim.keymap.set("n", "H", ":TablineBufferPrevious<CR>")
vim.keymap.set("n", "<A-Tab>", ":TablineBufferNext<CR>")
vim.keymap.set("n", "<A-S-Tab>", ":TablineBufferPrevious<CR>")
