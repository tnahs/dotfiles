-- https://github.com/jose-elias-alvarez/null-ls.nvim

-- Find additional formatters/diagnostics from:
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    print("Failed to load plugin: `jose-elias-alvarez/null-ls.nvim`.")
    return
end

null_ls.setup({
    debug = false,
    sources = {
        --
        -- Rust
        -- `rustup component add rustfmt`
        null_ls.builtins.formatting.rustfmt,
        --
        -- Python
        -- `pipx install black`
        -- `pipx install isort`
        -- `pipx install flake8`
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort.with({
            extra_args = { "--profile", "black", "--lines-after-imports", "2" },
        }),
        null_ls.builtins.diagnostics.flake8,
        --
        -- Lua
        -- `brew install stylua`
        null_ls.builtins.formatting.stylua.with({
            extra_args = { "--indent-type", "Spaces" },
        }),
    },
    --
    -- Format file on save.
    -- https://github.com/jose-elias-alvarez/null-ls.nvim#how-do-i-format-files-on-save
    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd([[
                augroup LspFormatting
                    autocmd! * <buffer>
                    autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
                augroup END
            ]])
        end
    end,
})
