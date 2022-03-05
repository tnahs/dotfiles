-- https://github.com/windwp/nvim-autopairs

local autopairs = require("nvim-autopairs")

autopairs.setup({
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
