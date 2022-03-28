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

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "L", ":TablineBufferNext<CR>", opts)
vim.api.nvim_set_keymap("n", "H", ":TablineBufferPrevious<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-Tab>", ":TablineBufferNext<CR>", opts)
vim.api.nvim_set_keymap("n", "<A-S-Tab>", ":TablineBufferPrevious<CR>", opts)
