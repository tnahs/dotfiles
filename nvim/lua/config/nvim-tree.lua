-- https://github.com/kyazdani42/nvim-tree.lua

-- This needs to be set before the plug-in loads.
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_icons = {
    default = "",
    git = {
        unstaged = "M",
        staged = "S",
        unmerged = "M",
        renamed = "M",
        untracked = "U",
        deleted = "D",
        ignored = "I",
    },
    folder = {
        arrow_closed = "▸",
        arrow_open = "▾",
        default = "◆",
        open = "◆",
        empty = "◆",
        empty_open = "◆",
        symlink = "◆",
        symlink_open = "◆",
    },
}

local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
    print("Failed to load plugin: `kyazdani42/nvim-tree.lua`.")
    return
end

-- FIX: Opening a file with `<CR>` creates an evenly split tab.
nvim_tree.setup({
    view = {
        width = 30,
        hide_root_folder = true,
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = "H",
            info = "I",
            warning = "W",
            error = "E",
        },
    },
})

-- Keymaps ---------------------------------------------------------------------

local opts = { noremap = true, silent = true }

-- Toggle NvimTree.
vim.api.nvim_set_keymap("n", "B", ":NvimTreeToggle<CR>", opts)
