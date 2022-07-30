-- https://github.com/nvim-neo-tree/neo-tree.nvim

local ok, neo_tree = pcall(require, "neo-tree")
if not ok then
    print("Failed to load plugin: `vim-neo-tree/neo-tree.nvim `.")
    return
end

local highlights = require("neo-tree.ui.highlights")
local components = require("neo-tree.sources.common.components")

-- Custom renderer compnent. Combines the `name`, `git_status` and `diagnostics`
-- components into a single component that displays the item's name highlighted
-- based on its status. The statuses are ranked from highest to lowest starting
-- from the LSP diagnostic state, to the git status and finally the
-- file/directory type.
--
-- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/v2.x/lua/neo-tree/sources/common/components.lua
local render_name = function(config, node, state)
    local highlight = config.highlight or highlights.FILE_NAME

    if node.type == "directory" then
        highlight = highlights.DIRECTORY_NAME
    end

    if node:get_depth() == 1 then
        highlight = highlights.ROOT_NAME
    else
        -- Git status
        local git_status = state.components.git_status({}, node, state)
        if git_status and git_status.highlight then
            highlight = git_status.highlight
        end

        -- LPS diagnostics
        local diagnostics = state.diagnostics_lookup or {}
        local diagnoistics_state = diagnostics[node:get_id()]

        if diagnoistics_state then
            highlight = "Diagnostic" .. diagnoistics_state.severity_string
        end
    end

    local filtered_by = components.filtered_by(config, node, state)

    return {
        text = node.name,
        highlight = filtered_by.highlight or highlight,
    }
end

neo_tree.setup({
    -- Using `stevearc/dressing.nvim` to style all the popups/ui elements.
    use_popups_for_input = false,
    popup_border_style = "single",
    default_component_configs = {
        indent = {
            highlight = "Whitespace",
        },
        icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
        },
    },
    window = {
        width = 35,
        mappings = {
            ["<Tab>"] = "open",
            ["<space>"] = false,
            -- ["<2-LeftMouse>"] = "open",
            -- ["<CR>"] = "open",
            -- ["<BS>"] = "navigate_up",
            -- ["."] = "set_root",
            -- ["A"] = "add_directory",
            -- ["a"] = "add",
            -- ["C"] = "close_node",
            -- ["c"] = "copy",
            -- ["d"] = "delete",
            -- ["m"] = "move",
            -- ["p"] = "paste_from_clipboard",
            -- ["q"] = "close_window",
            -- ["R"] = "refresh",
            -- ["r"] = "rename",
            -- ["S"] = "open_split",
            -- ["s"] = "open_vsplit",
            -- ["x"] = "cut_to_clipboard",
            -- ["y"] = "copy_to_clipboard",
            -- ["z"] = "close_all_nodes",
            -- ["<C-x>"] = "clear_filter",
            -- BUG: `fuzzy_finder` and `filter_on_submit` don't work.
            -- BUG: `fuzzy_finder` and `filter_on_submit` aren't using the `vim.input` api...
            -- ["/"] = "fuzzy_finder",
            -- ["f"] = "filter_on_submit",
        },
    },
    filesystem = {
        use_libuv_file_watcher = true,
        follow_current_file = true,
        filtered_items = {
            never_show = {
                ".DS_Store",
            },
        },
        renderers = {
            directory = {
                { "indent" },
                { "icon" },
                { "current_filter" },
                { "render_name" },
                { "clipboard" },
            },
            file = {
                { "indent" },
                { "render_name" },
                { "clipboard" },
            },
        },
        components = {
            render_name = render_name,
        },
    },
})

-- Remove the deprecated commands from v1.x
vim.g.neo_tree_remove_legacy_commands = 1

-- Remap colors to match colorscheme.
vim.cmd([[
  augroup LinkNeoTreeColors
    autocmd!
    autocmd VimEnter,ColorScheme * highlight! link NeoTreeGitUntracked Identifier
    autocmd VimEnter,ColorScheme * highlight! link NeoTreeGitModified Keyword
  augroup end
]])

-- Keymaps ---------------------------------------------------------------------

-- Toggle `Neotree`.
vim.keymap.set("n", "<C-b>", ":Neotree show toggle<CR>")
