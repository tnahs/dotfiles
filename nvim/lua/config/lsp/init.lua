-- https://github.com/neovim/nvim-lspconfig
--
-- required: brew install pyright
-- required: brew install rust-analyzer
-- required: brew install lua-language-server
-- optional: rustup component add rls rust-analysis rust-src

local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
    print("Failed to load plugin: `neovim/nvim-lspconfig`.")
    return
end

local opts = { noremap = true, silent = true }

-- Setup Language Servers ------------------------------------------------------

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gh", ":lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gf", ":lua vim.lsp.buf.formatting()<CR>", opts)

    -- Using `null-ls` to take care of formatting. See `lua/config/null-ls.lua`.
    client.resolved_capabilities.document_formatting = false

    -- Highlight all occurances of the symbol currently under cursor.
    if client.resolved_capabilities.document_highlight then
        vim.cmd([[
            highlight! link LspReferenceText Visual
            highlight! link LspReferenceRead Visual
            highlight! link LspReferenceWrite Visual

            augroup LspDocumentHighlight
                autocmd! * <buffer>
                autocmd! CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd! CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup end
        ]])
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local server_default_opts = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
        -- This will be the default in Neovim 0.7+.
        debounce_text_changes = 150,
    },
}

local servers = {
    "pyright",
    "sumneko_lua",
    -- "rls", -- `rust-analyzer` alternative. Disable `rust-tools` below.
}

for _, server in pairs(servers) do
    local server_settings = require("config.lsp.settings." .. server)
    local server_opts = vim.tbl_deep_extend("force", server_settings, server_default_opts)

    lspconfig[server].setup(server_opts)
end

-- `rust-analyzer` is setup using `rust-tools`.
require("config.lsp.rust-tools").setup(server_default_opts)

-- UI Customizations -----------------------------------------------------------
-- https://github.com/neovim/nvim-lspconfig/wiki/UI-customization

vim.diagnostic.config({
    severity_sort = true,
    virtual_text = {
        prefix = "•",
        spacing = 0,
    },
    float = {
        source = true,
    },
})

-- Change diagnostic symbols in the sign column (gutter).
local signs = { "Error", "Warn", "Hint", "Info" }
for _, type in ipairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = "█▌", texthl = hl, numhl = hl })
end

-- Keymaps ---------------------------------------------------------------------

vim.api.nvim_set_keymap("n", "<leader>e", ":lua vim.diagnostic.open_float()<CR>", opts)
-- vim.api.nvim_set_keymap("n", "<leader>q", ":lua vim.diagnostic.setloclist()<CR>", opts)
-- vim.api.nvim_set_keymap("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", opts)
-- vim.api.nvim_set_keymap("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opts)
