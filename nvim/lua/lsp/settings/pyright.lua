-- https://github.com/microsoft/pyright
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright

return {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",
                useLibraryCodeForTypes = true,
            },
        },
    },
}
