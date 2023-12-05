local status, nvim_lsp = pcall(require, "lspconfig")
local my_attach = require("my_attach")
if (not status) then return end


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

--nvim_lsp['null-ls'].setup({
--	on_attach=my_attach.on_attach
--	capabilities=
--}
