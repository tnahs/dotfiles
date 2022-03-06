-- https://github.com/akinsho/bufferline.nvim

local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    print("Failed to load plugin: `akinsho/bufferline.nvim`.")
    return
end

bufferline.setup({
    options = {
        indicator_icon = " ",
        separator_style = { "", "" },
        show_close_icon = false,
        diagnostics = "nvim_lsp",
        offsets = {
            { filetype = "NvimTree", text = "" },
        },
    },
})
