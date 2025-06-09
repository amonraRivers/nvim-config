vim.lsp.config('*', {
    root_markers = { '.git' },
    --capabilities = { textDocument = { formatting = true } },
})
vim.lsp.enable('lua_ls')
vim.lsp.config('lua_ls', {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
})
vim.lsp.enable('zls')
vim.lsp.config('zls', {
    cmd = { 'zls' },
    filetypes = { 'zig', 'zir' },
    root_markers = { "zls.json", "build.zig" },
    workspace_required = false,
})

require("0_11.config.lsp.lsp_python")
require("0_11.config.lsp.lsp_efm")
require("0_11.config.lsp.lsp_ts")
require("0_11.config.lsp.lsp_julia")
require("0_11.config.lsp.lsp_php")
require("0_11.config.lsp.lsp_clang")
require("0_11.config.lsp.lsp_python")
require("0_11.config.lsp.lsp_md")
require("0_11.config.lsp.lsp_json")
require("0_11.config.lsp.lsp_eslint")
--rust using rustaceanvim require("0_11.config.lsp.lsp_rust")
