-- https://github.com/lukas-reineke/indent-blankline.nvim

local ok, indent_blankline = pcall(require, "indent_blankline")
if not ok then
    print("Failed to load plugin: `lukas-reineke/indent-blankline.nvim`.")
    return
end

indent_blankline.setup({
    show_current_context = true,
    show_current_context_start = true,
    show_first_indent_level = false,
    use_treesitter = true,
})
