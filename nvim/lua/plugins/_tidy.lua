-- NOTE: Currently disabled. `tidy` ends up muddying the undo history. Keeping
-- this around in case I'd like to revisit it later on.

-- https://github.com/mcauley-penney/tidy.nvim/tree/cfg

local ok, tidy = pcall(require, "tidy")
if not ok then
    print("Failed to load plugin: `mcauley-penney/tidy.nvim`.")
    return
end

tidy.setup({
    eof_quant = 0,
    fmts = {
        "eof",
        "sof",
        "ws",
    },
})
