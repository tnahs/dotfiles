-- Automatically install `packer`.
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing `packer`... Quit and restart Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Reloads Neovim's configuration and syncs `packer` when this file is saved.
vim.cmd([[
  augroup PackerAutoSourceNSync
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local ok, packer = pcall(require, "packer")
if not ok then
    return
end

return packer.startup({
    function(use)
        -- Utils
        use("nvim-lua/plenary.nvim")
        --
        -- `packer`
        use("wbthomason/packer.nvim")
        --
        -- Neovim LSP
        use("neovim/nvim-lspconfig")
        use("jose-elias-alvarez/null-ls.nvim")
        use("williamboman/mason.nvim")

        -- Completion/Snippets
        use("hrsh7th/nvim-cmp")
        use("hrsh7th/cmp-buffer")
        use("hrsh7th/cmp-path")
        use("hrsh7th/cmp-cmdline")
        use("hrsh7th/cmp-nvim-lsp")
        use("hrsh7th/cmp-nvim-lua")
        use("L3MON4D3/LuaSnip")
        use("saadparwaiz1/cmp_luasnip")

        -- `Telescope`
        use("nvim-telescope/telescope.nvim")

        -- `Treesitter`
        use({
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
        })
        use("lewis6991/spellsitter.nvim")

        -- Misc
        use("ThePrimeagen/harpoon")
        use("akinsho/toggleterm.nvim")
        use("b0o/schemastore.nvim")
        use("fladson/vim-kitty")
        use("folke/todo-comments.nvim")
        use("folke/trouble.nvim")
        use("j-hui/fidget.nvim")
        use("kazhala/close-buffers.nvim")
        use("kdheepak/tabline.nvim")
        use("lewis6991/gitsigns.nvim")
        use("lukas-reineke/indent-blankline.nvim")
        use("norcalli/nvim-colorizer.lua")
        use("numToStr/Comment.nvim")
        use("nvim-lualine/lualine.nvim")
        use("simrat39/rust-tools.nvim")
        use("simrat39/symbols-outline.nvim")
        use("stevearc/dressing.nvim")
        use("tpope/vim-repeat")
        use("tpope/vim-surround")
        use("windwp/nvim-autopairs")
        use("Glench/Vim-Jinja2-Syntax")
        use({
            "nvim-neo-tree/neo-tree.nvim",
            requires = {
                "MunifTanjim/nui.nvim",
            },
        })
        use({
            "iamcco/markdown-preview.nvim",
            run = {
                "cd app && npm install",
            },
        })
        -- Themes
        use("folke/tokyonight.nvim")
        use({ "dracula/vim", as = "dracula" })
        use({ "embark-theme/vim", as = "embark" })

        if PACKER_BOOTSTRAP then
            require("packer").sync()
        end
    end,

    config = {
        -- Use a floating window for `packer`.
        -- https://github.com/wbthomason/packer.nvim#using-a-floating-window
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
            -- keybindings = {
            --     quit = "q",
            --     toggle_info = "<CR>",
            --     diff = "d",
            --     prompt_revert = "r",
            -- },
        },
    },
})
