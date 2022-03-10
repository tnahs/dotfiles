-- https://github.com/simrat39/rust-tools.nvim

M = {}
M.setup = function(server_default_opts)
    local ok, rust_tools = pcall(require, "rust-tools")
    if not ok then
        print("Failed to load plugin: `simrat39/rust-tools.nvim`.")
        return
    end

    local opts = {
        tools = {
            autoSetHints = true,
            hover_with_actions = false,
            inlay_hints = {
                show_parameter_hints = true,
                parameter_hints_prefix = "▪ ",
                other_hints_prefix = "▪ ",
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

    -- Enable if standalone support is needed.
    -- rust_tools.start_standalone_if_required()
end

return M
