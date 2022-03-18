-- https://github.com/simrat39/symbols-outline.nvim

vim.g.symbols_outline = {
    width = 20,
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
}

-- Keymaps ---------------------------------------------------------------------

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<leader>yo", ":SymbolsOutline<CR>", opts)

-- Misc ------------------------------------------------------------------------

-- BUG: This should be automatically set by `symbols-outline`.
vim.cmd([[
  augroup DisableSyntax
    autocmd VimEnter * highlight clear FocusedSymbol
    autocmd VimEnter * highlight link FocusedSymbol Search
  augroup end
]])
