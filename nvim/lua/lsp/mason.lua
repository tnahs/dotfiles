-- Mason Install:
-- black
-- css-lsp
-- flake8
-- isort
-- markdownlint-cli
-- prettier
-- pyright
-- rust-analyzer
-- stylua
-- sumneko_lua
-- taplo
--
-- Manual Install:
-- brew install jsonlint
-- npm i -g vscode-langservers-extracted

local ok, mason = pcall(require, "mason")
if not ok then
    print("Failed to load plugin: `williamboman/mason.nvim`.")
    return
end

mason.setup()
