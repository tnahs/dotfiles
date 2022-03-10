-- Automatically install packer
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

-- Reloads Neovim's configuration and syncs packer when this file is saved.
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use.
local ok, packer = pcall(require, "packer")
if not ok then
    return
end

return packer.startup(function(use)
    -- -- Utils
    use("nvim-lua/plenary.nvim")
    --
    -- -- Packer
    use("wbthomason/packer.nvim")
    --
    -- Neovim LSP
    use("neovim/nvim-lspconfig")
    use("jose-elias-alvarez/null-ls.nvim")

    -- Completion/Snippets
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")
    use("rafamadriz/friendly-snippets")

    -- Snippet Engine
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")

    -- Telescope
    use("nvim-telescope/telescope.nvim")

    -- Treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("p00f/nvim-ts-rainbow")

    -- Misc
    use("kyazdani42/nvim-tree.lua")
    use("nvim-lualine/lualine.nvim")
    use("lewis6991/gitsigns.nvim")
    use("akinsho/bufferline.nvim")
    use("ThePrimeagen/harpoon")
    use("numToStr/Comment.nvim")
    use("folke/todo-comments.nvim")
    use("windwp/nvim-autopairs")
    use("tpope/vim-surround") -- vimscript
    use("tpope/vim-repeat") -- vimscript
    use("j-hui/fidget.nvim")
    use("famiu/bufdelete.nvim")
    use("RRethy/vim-illuminate")
    use("lukas-reineke/indent-blankline.nvim")

    -- Rust
    use("simrat39/rust-tools.nvim")

    -- Themes
    use("dracula/vim")
    use("arcticicestudio/nord-vim")
    use("marko-cerovac/material.nvim")
    use("folke/tokyonight.nvim")
    use("sainnhe/gruvbox-material")

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
