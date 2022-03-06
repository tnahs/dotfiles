-- https://github.com/nvim-treesitter/nvim-treesitter

local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    print("Failed to load plugin: `nvim-treesitter/nvim-treesitter`.")
    return
end

treesitter.setup({
    ensure_installed = "maintained",
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    -- https://github.com/p00f/nvim-ts-rainbow
    rainbow = {
        enable = true,
        extended_mode = true,
    },
})
