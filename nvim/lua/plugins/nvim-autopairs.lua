-- https://github.com/windwp/nvim-autopairs

local ok, nvim_autopairs = pcall(require, "nvim-autopairs")
if not ok then
    print("Failed to load plugin: `windwp/nvim-autopairs`.")
    return
end

-- TODO: Prevent auto-pairs when cursor has text to its right.
nvim_autopairs.setup({
    check_ts = true,
    fast_wrap = {
        map = "<C-l>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = -1,
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "Search",
        highlight_grey = "Comment",
    },
})
