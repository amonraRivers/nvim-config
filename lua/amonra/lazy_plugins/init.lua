return { {

	"folke/which-key.nvim", },
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	{ "folke/neodev.nvim" },
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{ "github/copilot.vim" },
	{ 'mbbill/undotree' },

	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-nvim-lsp' },

	{ 'saadparwaiz1/cmp_luasnip' },
	{ 'MunifTanjim/prettier.nvim' },


	-- Debugging,
	{ 'nvim-lua/plenary.nvim' },
	{ 'mfussenegger/nvim-dap' },
	{ 'alx741/vim-rustfmt' },
	{ 'windwp/nvim-autopairs' },
	{
		'nvim-treesitter/nvim-treesitter',
		build = ":TSUpdate",
		ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

	},
	{
		'windwp/nvim-ts-autotag',
	},
	{ 'leafgarland/typescript-vim' },
	{ 'peitalin/vim-jsx-typescript' },
	{ 'ThePrimeagen/vim-be-good' },

	{ "fladson/vim-kitty" },
	{ "ziglang/zig.vim" },
}
