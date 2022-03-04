return {
	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				command = "clippy",
			},
			inlayHints = {
				enable = true,
			},
		},
	},
}
