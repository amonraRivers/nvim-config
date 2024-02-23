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
require("lazy").setup("amonra.lazy_plugins")
--[[
require("lazy").setup({
     "folke/which-key.nvim",
     { "folke/neoconf.nvim", cmd = "Neoconf" },
     "folke/neodev.nvim",
     {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
         -- your configuration comes here
         -- or leave it empty to use the default settings
         -- refer to the configuration section below
        },
       },
    -- "github/copilot.vim",
    -- {
    --     'nvim-telescope/telescope.nvim',
    --     tag = '0.1.4',
    --     dependencies = { 'nvim-lua/plenary.nvim' }
    -- },
    { "catppuccin/nvim",
    lazy=false,
        name = "catppuccin", 
        priority = 1000 ,
    config = function()
       vim.cmd([[colorscheme catppuccin])
    end,
    },

      {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      -- vim.cmd([[colorscheme tokyonight])
    end,
  },
    -- 'mbbill/undotree',
    -- 'neovim/nvim-lspconfig',
    -- 'hrsh7th/nvim-cmp',
    -- 'hrsh7th/cmp-buffer',
    -- 'hrsh7th/cmp-nvim-lsp',
    -- {
    --     'L3MON4D3/LuaSnip',
    --     dependencies = { "rafamadriz/friendly-snippets" },
    -- },
    -- { 'saadparwaiz1/cmp_luasnip' },
    -- 'jose-elias-alvarez/null-ls.nvim',
    -- 'MunifTanjim/prettier.nvim',
    -- 'simrat39/rust-tools.nvim',

    -- -- Debugging,
    -- 'nvim-lua/plenary.nvim',
    -- 'mfussenegger/nvim-dap',
    -- 'alx741/vim-rustfmt',
    -- 'windwp/nvim-autopairs',
    -- 'nvim-treesitter/nvim-treesitter',
    -- {
    --     'windwp/nvim-ts-autotag',
    -- },
    -- 'leafgarland/typescript-vim',
    -- 'peitalin/vim-jsx-typescript',
    -- 'ThePrimeagen/vim-be-good',
    -- {
    --     'saecki/crates.nvim',
    --     tag = 'v0.4.0',
    --     dependencies = { 'nvim-lua/plenary.nvim' },
    --     config = function()
    --         require('crates').setup()
    --     end,
    -- },
    -- "fladson/vim-kitty",
    -- "ziglang/zig.vim",
})
  --]]
