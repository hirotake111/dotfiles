-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- color theme
    -- use ({"rose-pine/neovim", as = "rose-pine" })
    use { "catppuccin/nvim", as = "catppuccin" }
    -- harpoon
    use("theprimeagen/harpoon")
    -- undotree
    use("mbbill/undotree")
    -- vim-fugitive (git integration)
    use("tpope/vim-fugitive")
    -- treesitter
    use ({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    })
    -- autopairs (automatic closing brackets)
    use("windwp/nvim-autopairs")

    -- lsp
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            --- Uncomment these if you want to manage LSP servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            -- snippet
            {'L3MON4D3/LuaSnip'},
            {'saadparwaiz1/cmp_luasnip'}
        }
    }

    -- vim-go
    -- use {"fatih/vim-go"}
    -- rust.vim
    -- use {"rust-lang/rust.vim"}

    -- lualine
    -- use {
    --     'nvim-lualine/lualine.nvim',
    --     requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    -- }

end)
