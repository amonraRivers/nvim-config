local config = function()
	-- Global mappings.
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
	vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
	vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
	vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

	-- Use LspAttach autocommand to only map the following keys
	-- after the language server attaches to the current buffer
	vim.api.nvim_create_autocmd('LspAttach', {
		group = vim.api.nvim_create_augroup('UserLspConfig', {}),
		callback = function(ev)
			-- Enable completion triggered by <c-x><c-o>
			vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

			-- Buffer local mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local opts = { buffer = ev.buf }
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
			vim.keymap.set({ 'n', 'i' }, '<C-k>', vim.lsp.buf.signature_help, opts)
			vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
			vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
			vim.keymap.set('n', '<space>wl', function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, opts)
			vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
			vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
			vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
			vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
			vim.keymap.set('n', '<space>f', function()
				vim.lsp.buf.format { async = true }
			end, opts)
		end,
	})
	local nvim_lsp = require("lspconfig")
	local my_attach = require("my_attach")


	local protocol = require('vim.lsp.protocol')


	-- Remove formatting capabilities
	local capabilities = require('cmp_nvim_lsp').default_capabilities()

	function disableFormatting(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
		my_attach.on_attach(client)
	end

	nvim_lsp.tsserver.setup {
		on_attach = disableFormatting, --my_attach.on_attach,
		filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact",
			"typescript.tsx" },
		cmd = { "typescript-language-server", "--stdio" },
		capabilites = capabilities,
	}

	nvim_lsp.lua_ls.setup {
		on_attach = my_attach.on_attach,
		--cmd = {"/usr/bin/lua-language-server"},
		settings = {
			Lua = {
				runtime = {
					version = 'LuaJIT',
					path = vim.split(package.path, ';'),
				},
				diagnostics = {
					globals = { 'vim' },
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
					checkThirdParty = false
				},
			},
		},
		capabilities = capabilities,
	}

	nvim_lsp.phpactor.setup {
		on_attach = my_attach.on_attach,
		capabilities = capabilities
	}

	nvim_lsp.zls.setup {
		on_attach = my_attach.on_attach,
		capabilities = capabilities
	}

	nvim_lsp.clangd.setup {
		on_attach = my_attach.on_attach,
		capabilities = capabilities
	}

	nvim_lsp.pylsp.setup {
		on_attach = my_attach.on_attach,
		settings = {
			pylsp = {
				plugins = {
					-- formatter options
					black = { enabled = true },
					autopep8 = { enabled = false },
					yapf = { enabled = false },
					-- linter options
					pylint = { enabled = true, executable = "pylint" },
					pyflakes = { enabled = false },
					pycodestyle = { enabled = false },
					-- type checker
					pylsp_mypy = { enabled = true },
					-- auto-completion options
					jedi_completion = { fuzzy = true },
					-- import sorting
					pyls_isort = { enabled = true },
				},
			},
		},
		flags = {
			debounce_text_changes = 200,
		},
		capabilities = capabilities,
	}
end

return { "neovim/nvim-lspconfig", config = config }

