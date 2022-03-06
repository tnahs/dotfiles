-- https://github.com/nvim-telescope/telescope.nvim
-- `brew install ripgrep`

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
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
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,
            },
            --
            -- Normal Mode
            n = {
                -- TODO Keybindings
            },
        },
        pickers = {
            -- Default configuration for builtin pickers goes here:
            -- picker_name = {
            --   picker_config_key = value,
            --   ...
            -- }
            -- Now the picker_config_key will be applied every time you call this
            -- builtin picker
        },
        extensions = {
            -- Your extension configuration goes here:
            -- extension_name = {
            --   extension_config_key = value,
            -- }
            -- please take a look at the readme of the extension you want to configure
        },
    },
})

-- Keymaps --------------------------------------------------------------------

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<C-p>c", ":Telescope commands<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-p>f", ":Telescope find_files<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-p>b", ":Telescope buffers<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-p>p", ":Telescope diagnostics<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-p>d", ":Telescope lsp_document_symbols<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-p>w", ":Telescope lsp_workspace_symbols<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-p>g", ":Telescope live_grep<CR>", opts)
