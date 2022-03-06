-- https://github.com/simrat39/rust-tools.nvim

local status_ok, rust_tools = pcall(require, "rust-tools")
if not status_ok then
    print("Failed to load plugin: `simrat39/rust-tools.nvim`.")
    return
end

rust_tools.setup({
    server = {
        standalone = false,
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy",
            },
        },
    },
})
