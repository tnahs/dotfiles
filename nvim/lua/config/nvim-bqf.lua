-- https://github.com/kevinhwang91/nvim-bqf

local ok, nvim_bqf = pcall(require, "bqf")
if not ok then
    print("Failed to load plugin: `kevinhwang91/nvim-bqf`.")
    return
end

nvim_bqf.setup({
    auto_resize_height = true,
    preview = {
        win_height = 20,
    },
})
