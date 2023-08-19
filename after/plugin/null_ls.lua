local null_ls = require("null-ls")

local my_attach = require("my_attach")
local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

null_ls.setup({
	on_attach = my_attach.on_attach,
	sources = {
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.phpcbf.with({
			prefer_local = "vendor/bin",
		})

	},
})
