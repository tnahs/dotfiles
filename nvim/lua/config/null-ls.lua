-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

local null_ls = require("null-ls")

null_ls.setup({
	debug = false,
	sources = {
        --
        -- Rust
        -- `rustup component add rustfmt`
		null_ls.builtins.formatting.rustfmt,
        --
		-- Python
        -- `pipx install black`
        -- `pipx install isort`
        -- `pipx install flake8`
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort.with({
			extra_args = { "--profile=black", "--lines-after-imports=2" },
		}),
		null_ls.builtins.diagnostics.flake8,
        --
		-- Lua
        -- `brew install stylua`
		null_ls.builtins.formatting.stylua,
	},
})
