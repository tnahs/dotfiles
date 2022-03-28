-- https://github.com/nvim-telescope/telescope.nvim
--
-- required: brew install ripgrep

local ok, telescope = pcall(require, "telescope")
if not ok then
    print("Failed to load plugin: `nvim-telescope/telescope.nvim`.")
    return
end

-- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/themes.lua#L25
local function build_dropdown(opts)
    local borderchars = {
        prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
        results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
        preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    }

    if opts.prompt_position == "bottom" then
        borderchars = {
            prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
            results = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
            preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        }
    end

    local dropdown_opts = {
        theme = "dropdown",
        sorting_strategy = "ascending",
        layout_strategy = "center",
        prompt_position = opts.prompt_position,
        borderchars = borderchars,
        layout_config = {
            width = 81,
            height = opts.height,
        },
    }

    -- Only affect the prompt title if one is supplied. This allows for the
    -- default value for the picker to pass through. This is primarily used for
    -- the `ui-select` extension.
    if opts.prompt_title then
        dropdown_opts.prompt_title = opts.prompt_title
    end

    -- BUG: This causes a crash when explicitly set to true.
    if not opts.previewer then
        dropdown_opts.previewer = opts.previewer
    end

    return dropdown_opts
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
                ["<C-p>"] = trouble.open_with_trouble,
                -- ["<C-c>"] = actions.close,
                -- ["<Down>"] = actions.move_selection_next,
                -- ["<Up>"] = actions.move_selection_previous,
                -- ["<CR>"] = actions.select_default,
                -- ["<C-x>"] = actions.select_horizontal,
                -- ["<C-v>"] = actions.select_vertical,
                -- ["<C-t>"] = actions.select_tab,
                -- ["<C-u>"] = actions.preview_scrolling_up,
                -- ["<C-d>"] = actions.preview_scrolling_down,
                -- ["<PageUp>"] = actions.results_scrolling_up,
                -- ["<PageDown>"] = actions.results_scrolling_down,
                -- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                -- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                -- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                -- ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                -- ["<C-l>"] = actions.complete_tag,
                -- ["<C-?>"] = actions.which_key,
            },
            --
            -- Normal Mode
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-p>"] = trouble.open_with_trouble,
                -- ["<Esc>"] = actions.close,
                -- ["<CR>"] = actions.select_default,
                -- ["<C-x>"] = actions.select_horizontal,
                -- ["<C-v>"] = actions.select_vertical,
                -- ["<C-t>"] = actions.select_tab,
                -- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                -- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                -- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                -- ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                -- ["j"] = actions.move_selection_next,
                -- ["k"] = actions.move_selection_previous,
                -- ["H"] = actions.move_to_top,
                -- ["M"] = actions.move_to_middle,
                -- ["L"] = actions.move_to_bottom,
                -- ["<Down>"] = actions.move_selection_next,
                -- ["<Up>"] = actions.move_selection_previous,
                -- ["gg"] = actions.move_to_top,
                -- ["G"] = actions.move_to_bottom,
                -- ["<C-u>"] = actions.preview_scrolling_up,
                -- ["<C-d>"] = actions.preview_scrolling_down,
                -- ["<PageUp>"] = actions.results_scrolling_up,
                -- ["<PageDown>"] = actions.results_scrolling_down,
                -- ["?"] = actions.which_key,
            },
        },
        borderchars = {
            prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
            results = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
            preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        },
        layout_config = {
            width = 0.8,
            height = 0.8,
            flex = { flip_columns = 280 },
            horizontal = { preview_width = 81 },
            vertical = { preview_height = 0.25 },
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
    pickers = {
        buffers = build_dropdown({
            prompt_position = "top",
            height = 16,
            previewer = false,
            prompt_title = "Buffers",
        }),
        find_files = build_dropdown({
            prompt_position = "top",
            height = 24,
            previewer = false,
            prompt_title = "Files",
        }),
        colorscheme = build_dropdown({
            prompt_position = "top",
            height = 16,
            -- BUG: Setting to false disables real-time previews of colorscheme.
            previewer = false,
            prompt_title = "Colorscheme",
        }),
        lsp_code_actions = build_dropdown({
            prompt_position = "top",
            height = 16,
            previewer = false,
            prompt_title = "LSP Code Actions",
        }),
    },
})

-- Extensions ------------------------------------------------------------------

telescope.load_extension("harpoon")

-- Keymaps ---------------------------------------------------------------------

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<leader>f", ":Telescope find_files<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>g", ":Telescope live_grep<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>a", ":Telescope lsp_code_actions<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>tb", ":Telescope buffers<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>tp", ":Telescope diagnostics<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>tr", ":Telescope lsp_references<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>ti", ":Telescope lsp_implementations<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>td", ":Telescope lsp_document_symbols<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>tw", ":Telescope lsp_workspace_symbols<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>tc", ":Telescope colorscheme enable_preview=true<CR>", opts)
