-- https://github.com/nvim-treesitter/nvim-treesitter
--
-- required: TSInstall markdown

local ok, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
    print("Failed to load plugin: `nvim-treesitter/nvim-treesitter`.")
    return
end

nvim_treesitter.setup({
    ensure_installed = "all",
    highlight = {
        enable = true,
    },
    -- These are handled by `folke/todo-comments.nvim`.
    ignore_install = {
        "comment",
        "todotxt",
        "phpdoc",
    },
})
