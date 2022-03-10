-- https://github.com/j-hui/fidget.nvim

local ok, fidget = pcall(require, "fidget")
if not ok then
    print("Failed to load plugin: `j-hui/fidget.nvim`.")
    return
end

fidget.setup({
    text = {
        spinner = "dots",
    },
})
