-- https://github.com/microsoft/pyright
-- required: brew install pyright

return {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "strict",
                diagnosticMode = "workspace",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            },
        },
    },
}
