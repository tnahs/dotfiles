-- https://github.com/norcalli/nvim-colorizer.lua

local ok, nvim_colorizer = pcall(require, "colorizer")
if not ok then
    print("Failed to load plugin: `norcalli/nvim-colorizer.lua`.")
    return
end

nvim_colorizer.setup({
    "*",
}, {
    -- Disable colorizing CSS names.
    names = false,
})
