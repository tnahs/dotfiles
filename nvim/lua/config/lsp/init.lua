-- https://github.com/neovim/nvim-lspconfig
--
-- required: brew install rust-analyzer
-- required: brew install pyright
-- required: brew install lua-language-server

local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
    print("Failed to load plugin: `neovim/nvim-lspconfig`.")
    return
end

local cmp_nvim_lsp = require("cmp_nvim_lsp")

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<leader>e", ":lua vim.diagnostic.open_float()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>q", ":lua vim.diagnostic.setloclist()<CR>", opts)
vim.api.nvim_set_keymap("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", opts)
vim.api.nvim_set_keymap("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opts)

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gh", ":lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gn", ":lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gf", ":lua vim.lsp.buf.formatting()<CR>", opts)

    -- Using null-ls` to take care of formatting. See `lua/config/null-ls.lua`.
    client.resolved_capabilities.document_formatting = false

    -- Uses the LSP to automaticallty highlight all occurances of the current
    -- word under the cursor.
    require("config.lsp.illuminate").setup(client)
end

-- Add additional capabilities supported by nvim-cmp`.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

-- Setup language servers.

local servers = { "pyright", "sumneko_lua" }
local server_default_opts = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
        -- This will be the default in neovim 0.7+
        debounce_text_changes = 150,
    },
}

for _, server in pairs(servers) do
    local server_settings = require("config.lsp.settings." .. server)
    local server_opts = vim.tbl_deep_extend("force", server_settings, server_default_opts)

    lspconfig[server].setup(server_opts)
end

-- required: rust-analyzer is setup using `rust-tools`.
require("config.lsp.rust-tools").setup(server_default_opts)
