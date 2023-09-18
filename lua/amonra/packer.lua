-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'github/copilot.vim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'mbbill/undotree'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lsp'
    use { 'L3MON4D3/LuaSnip',
        requires = { "rafamadriz/friendly-snippets" },
    }
    use { 'saadparwaiz1/cmp_luasnip' }
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'MunifTanjim/prettier.nvim'
    use 'simrat39/rust-tools.nvim'

    -- Debugging
    use 'nvim-lua/plenary.nvim'
    use 'mfussenegger/nvim-dap'
    use 'alx741/vim-rustfmt'
    use 'windwp/nvim-autopairs'
    use 'nvim-treesitter/nvim-treesitter'
    use {
        'windwp/nvim-ts-autotag',
    }
    use 'leafgarland/typescript-vim'
    use 'peitalin/vim-jsx-typescript'
    use 'ThePrimeagen/vim-be-good'
    use { 'saecki/crates.nvim',
        tag = 'v0.3.0',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end,
    }
    use "fladson/vim-kitty"
    use "ziglang/zig.vim"
end)
