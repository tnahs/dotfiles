-- https://github.com/simrat39/symbols-outline.nvim

vim.g.symbols_outline = {
    auto_preview = false,
    symbols = {
        File = { icon = "F", hl = "TSURI" },
        Module = { icon = "M", hl = "TSNamespace" },
        Namespace = { icon = "N", hl = "TSNamespace" },
        Package = { icon = "P", hl = "TSNamespace" },
        Class = { icon = "C", hl = "TSType" },
        Method = { icon = "M", hl = "TSMethod" },
        Property = { icon = "P", hl = "TSMethod" },
        Field = { icon = "F", hl = "TSField" },
        Constructor = { icon = "C", hl = "TSConstructor" },
        Enum = { icon = "E", hl = "TSType" },
        Interface = { icon = "I", hl = "TSType" },
        Function = { icon = "F", hl = "TSFunction" },
        Variable = { icon = "V", hl = "TSConstant" },
        Constant = { icon = "C", hl = "TSConstant" },
        String = { icon = "S", hl = "TSString" },
        Number = { icon = "N", hl = "TSNumber" },
        Boolean = { icon = "B", hl = "TSBoolean" },
        Array = { icon = "A", hl = "TSConstant" },
        Object = { icon = "O", hl = "TSType" },
        Key = { icon = "K", hl = "TSType" },
        Null = { icon = "N", hl = "TSType" },
        EnumMember = { icon = "E", hl = "TSField" },
        Struct = { icon = "S", hl = "TSType" },
        Event = { icon = "E", hl = "TSType" },
        Operator = { icon = "O", hl = "TSOperator" },
        TypeParameter = { icon = "T", hl = "TSParameter" },
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
