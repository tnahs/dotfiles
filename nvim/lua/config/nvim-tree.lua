-- https://github.com/kyazdani42/nvim-tree.lua

local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
    print("Failed to load plugin: `kyazdani42/nvim-tree.lua`.")
    return
end

vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_root_folder_modifier = ":t"
vim.g.nvim_tree_show_icons = { git = 0 }

nvim_tree.setup({
    view = {
        width = 35,
    },
    actions = {
        open_file = {
            resize_window = true,
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            error = "█",
            warning = "█",
            hint = "█",
            info = "█",
        },
    },
})

-- Keymaps ---------------------------------------------------------------------

local opts = { noremap = true, silent = true }

-- Toggle `NvimTree`.
vim.api.nvim_set_keymap("n", "<C-b>", ":NvimTreeToggle<CR>", opts)
