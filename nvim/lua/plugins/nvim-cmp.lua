-- https://github.com/hrsh7th/nvim-cmp

local ok, nvim_cmp = pcall(require, "cmp")
if not ok then
    print("Failed to load plugin: `hrsh7th/nvim-cmp`.")
    return
end

local luasnip = require("luasnip")

-- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

nvim_cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<C-p>"] = nvim_cmp.mapping.complete(),
        ["<C-j>"] = nvim_cmp.mapping.select_next_item(),
        ["<C-k>"] = nvim_cmp.mapping.select_prev_item(),
        ["<C-d>"] = nvim_cmp.mapping.scroll_docs(-3),
        ["<C-f>"] = nvim_cmp.mapping.scroll_docs(3),
        ["<C-e>"] = nvim_cmp.mapping.close(),
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = nvim_cmp.mapping.confirm({ select = false }),
        -- WIP: Do we want to use `Tab` here?
        ["<Tab>"] = nvim_cmp.mapping(function(fallback)
            if nvim_cmp.visible() then
                nvim_cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                nvim_cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = nvim_cmp.mapping(function(fallback)
            if nvim_cmp.visible() then
                nvim_cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer", keyword_length = 5, max_item_count = 10 },
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                nvim_lua = "[LuaAPI]",
                luasnip = "[Snippet]",
                spell = "[Spell]",
                path = "[Path]",
                buffer = "[Buffer]",
            })[entry.source.name]
            return vim_item
        end,
    },
})
