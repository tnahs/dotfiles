-- https://github.com/iamcco/markdown-preview.nvim

vim.g.mkdp_page_title = "${name}"
vim.g.mkdp_filetypes = { "markdown" }
vim.g.mkdp_auto_close = 0

vim.keymap.set("n", "<leader>yp", ":MarkdownPreview<CR>")
