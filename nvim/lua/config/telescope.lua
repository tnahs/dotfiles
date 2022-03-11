-- https://github.com/nvim-telescope/telescope.nvim
--
-- required: brew install ripgrep

local ok, telescope = pcall(require, "telescope")
if not ok then
    print("Failed to load plugin: `nvim-telescope/telescope.nvim`.")
    return
end

local actions = require("telescope.actions")

telescope.setup({
    defaults = {
        mappings = {
            --
            -- Insert Mode
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
            --
            -- Normal Mode
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
        },
        -- NOTE: Redefining to add `--trim`.
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--trim", -- This!
        },
        layout_config = {
            preview_width = 81,
        },
    },
    pickers = {
        lsp_code_actions = {
            theme = "cursor",
        },
        colorscheme = {
            theme = "ivy",
        },
    },
})

telescope.load_extension("harpoon")

-- Keymaps --------------------------------------------------------------------

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<leader>f", ":Telescope find_files<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>b", ":Telescope buffers<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>g", ":Telescope live_grep<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>p", ":Telescope diagnostics<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>a", ":Telescope lsp_code_actions<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>r", ":Telescope lsp_references<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>i", ":Telescope lsp_implementations<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>yd", ":Telescope lsp_document_symbols<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>yw", ":Telescope lsp_workspace_symbols<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>c", ":Telescope colorscheme enable_preview=true<CR>", opts)
