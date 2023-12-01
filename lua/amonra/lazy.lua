local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
    "folke/which-key.nvim",
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "github/copilot.vim",
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { "catppuccin/nvim",    name = "catppuccin", priority = 1000 },
    'mbbill/undotree',
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    {
        'L3MON4D3/LuaSnip',
        dependencies = { "rafamadriz/friendly-snippets" },
    },
    { 'saadparwaiz1/cmp_luasnip' },
    'jose-elias-alvarez/null-ls.nvim',
    'MunifTanjim/prettier.nvim',
    'simrat39/rust-tools.nvim',

    -- Debugging,
    'nvim-lua/plenary.nvim',
    'mfussenegger/nvim-dap',
    'alx741/vim-rustfmt',
    'windwp/nvim-autopairs',
    'nvim-treesitter/nvim-treesitter',
    {
        'windwp/nvim-ts-autotag',
    },
    'leafgarland/typescript-vim',
    'peitalin/vim-jsx-typescript',
    'ThePrimeagen/vim-be-good',
    {
        'saecki/crates.nvim',
        tag = 'v0.4.0',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end,
    },
    "fladson/vim-kitty",
    "ziglang/zig.vim",
})
