-- https://github.com/lukas-reineke/indent-blankline.nvim

local ok, indent_blankline = pcall(require, "indent_blankline")
if not ok then
    print("Failed to load plugin: `lukas-reineke/indent-blankline.nvim`.")
    return
end

vim.opt.list = true
vim.opt.listchars:append("space:⋅")

indent_blankline.setup({
    -- buftype_exclude = {
    --     "terminal",
    --     "nofile",
    -- },
    -- filetype_exclude = {
    --     "packer",
    --     "help",
    -- },
    show_current_context = true,
    show_current_context_start = true,
    show_first_indent_level = false,
    use_treesitter = true,
})
