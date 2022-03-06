-- https://github.com/simrat39/rust-tools.nvim
-- https://github.com/simrat39/rust-tools.nvim/issues/89#issuecomment-955790243
-- https://github.com/williamboman/nvim-lsp-installer/wiki/Rust

M = {}
M.setup = function(server, server_opts)
    local status_ok, rust_tools = pcall(require, "rust-tools")
    if not status_ok then
        print("Failed to load plugin: `simrat39/rust-tools.nvim`.")
        return
    end

    local opts = {
        tools = {
            autoSetHints = true,
            hover_with_actions = false,
            inlay_hints = {
                show_parameter_hints = true,
                parameter_hints_prefix = "",
                other_hints_prefix = "",
            },
        },
        server = vim.tbl_deep_extend("force", server:get_default_options(), server_opts, {
            settings = {
                ["rust-analyzer"] = {
                    completion = {
                        postfix = {
                            enable = false,
                        },
                    },
                    checkOnSave = {
                        command = "clippy",
                    },
                },
            },
        }),
    }

    rust_tools.setup(opts)
    server:attach_buffers()
    -- Only if standalone support is needed
    -- require("rust-tools").start_standalone_if_required()
end

return M
