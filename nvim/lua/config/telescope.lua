-- https://github.com/nvim-telescope/telescope.nvim
--
-- required: brew install ripgrep

local ok, telescope = pcall(require, "telescope")
if not ok then
    print("Failed to load plugin: `nvim-telescope/telescope.nvim`.")
    return
end

local actions = require("telescope.actions")

local trouble = require("trouble.providers.telescope")

telescope.setup({
    defaults = {
        mappings = {
            --
            -- Insert Mode
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                -- WIP: Make this dynamically detected.
                ["<C-q>"] = trouble.open_with_trouble,
            },
            --
            -- Normal Mode
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = trouble.open_with_trouble,
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
    },
    -- WIP: Customize each picker.
    -- BUG: `preview_width` doesn't seem to be working...
    pickers = {
        find_files = {
            theme = "dropdown",
            previewer = false,
            prompt_title = false,
        },
        buffers = {
            preview_width = 81,
        },
        live_grep = {
            preview_width = 81,
        },
        diagnostics = {
            preview_width = 81,
        },
        lsp_code_actions = {
            -- TODO: Increate the results count.
            theme = "cursor",
        },
        lsp_references = {
            preview_width = 81,
        },
        lsp_implementations = {
            preview_width = 81,
        },
        lsp_document_symbols = {
            preview_width = 81,
        },
        lsp_workspace_symbols = {
            preview_width = 81,
        },
        colorscheme = {
            theme = "ivy",
            -- BUG: Disables real-time preview of colorscheme.
            -- previewer = false,
        },
    },
})

-- Keymaps --------------------------------------------------------------------

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<leader>f", ":Telescope find_files<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>g", ":Telescope live_grep<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>a", ":Telescope lsp_code_actions<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>tb", ":Telescope buffers<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>td", ":Telescope diagnostics<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>tr", ":Telescope lsp_references<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>ti", ":Telescope lsp_implementations<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>td", ":Telescope lsp_document_symbols<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>tw", ":Telescope lsp_workspace_symbols<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>tc", ":Telescope colorscheme enable_preview=true<CR>", opts)