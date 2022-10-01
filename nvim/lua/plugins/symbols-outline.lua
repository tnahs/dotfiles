-- https://github.com/simrat39/symbols-outline.nvim

local ok, symbols_outline = pcall(require, "symbols-outline")
if not ok then
    print("Failed to load plugin: `simrat39/symbols-outline.nvim`.")
    return
end

symbols_outline.setup({
    width = 25,
    auto_preview = false,
    show_symbol_details = false,
    symbols = {
        Array = { icon = "" },
        Boolean = { icon = "ﱺ" },
        Class = { icon = "" },
        Constant = { icon = "" },
        Constructor = { icon = "" },
        Enum = { icon = "ﴯ" },
        EnumMember = { icon = "ﴯ" },
        Event = { icon = "﬉" },
        Field = { icon = "" },
        File = { icon = "" },
        Function = { icon = "" },
        Interface = { icon = "" },
        Key = { icon = "" },
        Method = { icon = "m" },
        Module = { icon = "" },
        Namespace = { icon = "" },
        Null = { icon = "∅" },
        Number = { icon = "" },
        Object = { icon = "" },
        Operator = { icon = "ﬦ" },
        Package = { icon = "" },
        Property = { icon = "" },
        String = { icon = "" },
        Struct = { icon = "" },
        TypeParameter = { icon = "" },
        Variable = { icon = "" },
    },
    keymaps = {
        -- close = { "<Esc>", "q" },
        -- code_actions = "a",
        -- focus_location = "o",
        -- goto_location = "<CR>",
        -- hover_symbol = "<C-Space>",
        -- rename_symbol = "r",
        -- toggle_preview = "K",
    },
})

-- Keymaps ---------------------------------------------------------------------

vim.keymap.set("n", "<leader>yo", ":SymbolsOutline<CR>")
