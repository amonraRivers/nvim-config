local status, nvim_lsp = pcall(require, "lspconfig")
local my_attach = require("my_attach")
if (not status) then return end


local protocol = require('vim.lsp.protocol')


local tscapabilities = require('cmp_nvim_lsp').default_capabilities()
-- Remove formatting capabilities
tscapabilities.textDocument.formatting = nil
tscapabilities.textDocument.rangeFormatting = nil
tscapabilities.textDocument.onTypeFormatting = nil
local capabilities = require('cmp_nvim_lsp').default_capabilities()


nvim_lsp.tsserver.setup {
	--	on_attach = my_attach.on_attach,
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact",
		"typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio" },
	capabilites = tscapabilities,
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
	capabilities = tscapabilities
}
--nvim_lsp['null-ls'].setup({
--	on_attach=my_attach.on_attach
--	capabilities=
--}
