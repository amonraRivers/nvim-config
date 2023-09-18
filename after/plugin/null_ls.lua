local null_ls = require("null-ls")
local my_attach = require("my_attach")

null_ls.setup({
    on_attach = my_attach.on_attach,
    sources = {
        null_ls.builtins.formatting.prettierd,
    },
})
