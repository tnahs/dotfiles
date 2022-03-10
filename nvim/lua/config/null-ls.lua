-- https://github.com/jose-elias-alvarez/null-ls.nvim

-- Find additional formatters/diagnostics from:
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

local ok, null_ls = pcall(require, "null-ls")
if not ok then
    print("Faileds to load plugin: jose-elias-alvarez/null-ls.nvim`.")
    return
end

null_ls.setup({
    debug = false,
    sources = {
        --
        -- rust
        -- required: rustup component add rustfmt
        null_ls.builtins.formatting.rustfmt,
        --
        -- python
        -- required: pipx install black
        -- required: pipx install isort
        -- required: pipx install flake8 null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort.with({
            extra_args = { "--profile", "black", "--lines-after-imports", "2" },
        }),
        null_ls.builtins.diagnostics.flake8,
        --
        -- json
        -- required: brew install jsonlint
        null_ls.builtins.diagnostics.jsonlint,
        --
        -- markdown
        -- required: brew install markdownlint-cli
        null_ls.builtins.diagnostics.markdownlint,
        --
        -- markdown/json/yaml/html/css/javascript/typescript
        -- required: brew install prettier
        null_ls.builtins.formatting.prettier.with({
            -- TODO Should these be file extensions or names?
            filetypes = { "md", "json", "yaml", "html", "css", "js", "ts" },
        }),
        --
        -- lua
        -- required: brew install stylua
        null_ls.builtins.formatting.stylua.with({
            extra_args = { "--indent-type", "Spaces" },
        }),
        --
        -- *
        -- required: npm --global install cspell
        -- required: npm --global install write-good
        -- https://github.com/streetsidesoftware/cspell/tree/main/packages/cspell#options
        -- null_ls.builtins.diagnostics.cspell,
        -- null_ls.builtins.diagnostics.write_good,
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.formatting.trim_newlines,
        null_ls.builtins.formatting.trim_whitespace,
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
