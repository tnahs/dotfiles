-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/williamboman/nvim-lsp-installer/

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    print("failed to load plugin: `lspconfig`.")
    return
end

local lsp_installer = require("nvim-lsp-installer")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

    -- Using `null-ls` to take care of formatting. See `lua/config/null-ls.lua`.
    client.resolved_capabilities.document_formatting = false
end

-- Add additional capabilities supported by `nvim-cmp`
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

-- Auto-install servers on start-up.
local servers = { "rust_analyzer", "pyright", "sumneko_lua" }
for _, name in ipairs(servers) do
    local exists, server = lsp_installer.get_server(name)
    if exists then
        server:install()
    end
end

lsp_installer.on_server_ready(function(server)
    local server_opts = {
        on_attach = on_attach,
        capabilities = capabilities,
    }

    if server.name == "rust_analyzer" then
        -- Handing off server initilization to `simrat39/rust-tools.nvim`.
        require("config.lsp.rust-tools").setup(server, server_opts)
        return
    end

    if server.name == "pyright" then
        local python_opts = require("config.lsp.settings.pyright")
        server_opts = vim.tbl_deep_extend("force", python_opts, server_opts)
    end

    if server.name == "sumneko_lua" then
        local lua_opts = require("config.lsp.settings.sumneko_lua")
        server_opts = vim.tbl_deep_extend("force", lua_opts, server_opts)
    end

    server:setup(server_opts)
end)
