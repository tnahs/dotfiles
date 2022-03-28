-- https://github.com/microsoft/pyright
-- required: brew install pyright

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
