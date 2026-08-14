vim.lsp.enable('rust_analyzer')
vim.lsp.config('rust_analyzer', {
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
    root_markers = { '.git' },
    root_dir = function(bufnr, on_dir)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        local root = vim.fs.root(fname, { 'Cargo.toml', 'Cargo.lock' })
            or vim.fs.root(fname, { '.git' })
            or vim.fs.dirname(fname)
        on_dir(root)
    end,
    settings = {
        ['rust-analyzer'] = {
            checkOnSave = true,
            check = { command = 'clippy' },
            cargo = { allFeatures = true },
            procMacro = { enable = true },
            inlayHints = {
                bindingModeHints = { enable = true },
                chainingHints = { enable = true },
                closingBraceHints = { enable = true },
                closureReturnTypeHints = { enable = true },
                parameterHints = { enable = true },
                typeHints = { enable = true },
            },
        },
    },
})
