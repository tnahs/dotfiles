-- https://github.com/nvim-treesitter/nvim-treesitter
--
-- required: TSInstall markdown

local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
    print("Failed to load plugin: `nvim-treesitter/nvim-treesitter`.")
    return
end

treesitter.setup({
    ensure_installed = "maintained",
    highlight = {
        enable = true,
    },
    -- These are handled by `folke/todo-comments.nvim`.
    ignore_install = {
        "comment",
        "todotxt",
    },
    -- https://github.com/p00f/nvim-ts-rainbow
    rainbow = {
        enable = true,
        extended_mode = true,
    },
})
