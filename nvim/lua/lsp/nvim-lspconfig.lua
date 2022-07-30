-- https://github.com/neovim/nvim-lspconfig

local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
    print("Failed to load plugin: `neovim/nvim-lspconfig`.")
    return
end

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

-- Customize hover borders.
local border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }
local open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or border
    return open_floating_preview(contents, syntax, opts, ...)
end

-- Setup Language Servers ------------------------------------------------------

local opts = { noremap = true, silent = true }

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lh", ":lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ln", ":lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ld", ":lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lr", ":lua vim.lsp.buf.references()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>li", ":lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ls", ":lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>la", ":lua vim.lsp.buf.code_action()<CR>", opts)

    if client.resolved_capabilities.document_range_formatting then
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end

    -- Using `null-ls` to take care of formatting. See `lua/lsp/null-ls.lua`.
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
    "jsonls",
}

for _, server in pairs(servers) do
    local server_settings = require("lsp.settings." .. server)
    local server_opts = vim.tbl_deep_extend("force", server_settings, server_default_opts)

    lspconfig[server].setup(server_opts)
end

-- `rust-analyzer` is setup using `rust-tools`.
require("lsp.rust-tools").setup(server_default_opts)

-- Keymaps ---------------------------------------------------------------------

vim.keymap.set("n", "<leader>le", ":lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "<leader>l[", ":lua vim.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "<leader>l]", ":lua vim.diagnostic.goto_prev()<CR>")
-- vim.keymap.set("n", "<leader>q", ":lua vim.diagnostic.setloclist()<CR>")
