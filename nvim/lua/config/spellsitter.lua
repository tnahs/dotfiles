-- https://github.com/lewis6991/spellsitter.nvim

local ok, spellsitter = pcall(require, "spellsitter")
if not ok then
    print("Failed to load plugin: `nvim-treesitter/nvim-treesitter`.")
    return
end

spellsitter.setup()
