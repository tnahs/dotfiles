-- https://github.com/L3MON4D3/LuaSnip

local ok, luasnip = pcall(require, "luasnip")
if not ok then
    print("Failed to load plugin: `L3MON4D3/LuaSnip`.")
    return
end

local types = require("luasnip.util.types")

-- WIP: Do we like these extra configs?
luasnip.config.set_config({
    -- This tells LuaSnip to remember to keep around the last snippet.
    -- You can jump back into it even if you move outside of the selection
    history = true,
    updateevents = "TextChanged,TextChangedI",
    ext_opts = {
        [types.insertNode] = {
            active = {
                virt_text = { { "◆", "DiagnosticError" } },
            },
        },
        [types.choiceNode] = {
            active = {
                virt_text = { { "◆", "DiagnosticError" } },
            },
        },
    },
})
