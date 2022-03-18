-- https://github.com/L3MON4D3/LuaSnip

local ok, _ = pcall(require, "luasnip")
if not ok then
    print("Failed to load plugin: `L3MON4D3/LuaSnip`.")
    return
end
