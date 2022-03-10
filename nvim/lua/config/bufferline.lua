-- https://github.com/akinsho/bufferline.nvim

local ok, bufferline = pcall(require, "bufferline")
if not ok then
    print("Failed to load plugin: `akinsho/bufferline.nvim`.")
    return
end

bufferline.setup({
    options = {
        indicator_icon = " ",
        separator_style = { "", "" },
        show_close_icon = false,
        tab_size = 24,
        left_trunc_marker = "◀",
        right_trunc_marker = "▶",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, _, _)
            -- Returns LEVEL:COUNT
            -- error       E:#
            -- warning     W:#
            -- hint        H:#
            -- info        I:#
            return level:sub(1, 1):upper() .. ":" .. count
        end,
        offsets = {
            { filetype = "NvimTree", text = "" },
        },
    },
})
