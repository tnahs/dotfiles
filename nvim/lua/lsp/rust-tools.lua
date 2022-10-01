-- https://github.com/simrat39/rust-tools.nvim
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer

M = {}
M.setup = function(server_default_opts)
    local ok, rust_tools = pcall(require, "rust-tools")
    if not ok then
        print("Failed to load plugin: `simrat39/rust-tools.nvim`.")
        return
    end

    local opts = {
        tools = {
            hover_with_actions = false,
            inlay_hints = {
                parameter_hints_prefix = "• ",
                other_hints_prefix = "• ",
                highlight = "Whitespace",
            },
        },
        server = vim.tbl_deep_extend("force", server_default_opts, {
            settings = {
                ["rust-analyzer"] = {
                    checkOnSave = {
                        command = "clippy",
                    },
                },
            },
        }),
    }

    rust_tools.setup(opts)
end

return M
