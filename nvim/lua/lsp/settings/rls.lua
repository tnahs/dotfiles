-- https://github.com/rust-lang/rls
-- required: rustup component add rls rust-analysis rust-src

return {
    settings = {
        rust = {
            clippy_preference = "opt-in",
        },
    },
}
