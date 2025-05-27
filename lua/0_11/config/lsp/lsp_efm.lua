vim.lsp.enable('efm')
vim.lsp.config('efm', {
    init_options = { documentFormatting = true },
    cmd={ "efm-langserver"},
    settings = {
        rootMarkers = { ".git/" },
        languages = {
            javascript = {
                {
                    formatCommand = 'prettierd "${INPUT}"',
                    formatStdin = true,
                }
            },
            javascriptreact = {
                {
                    formatCommand = 'prettierd "${INPUT}"',
                    formatStdin = true,
                }
            },
            typescript = {
                {
                    formatCommand = 'prettierd "${INPUT}"',
                    formatStdin = true,
                }
            },
            typescriptreact = {
                {
                    formatCommand = 'prettierd "${INPUT}"',
                    formatStdin = true,
                }
            },
            markdown = {
                {
                    formatCommand = 'pandoc -f markdown -t gfm -sp --tab-stop=2'
                }
            }
        }
    },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact",
        "typescript.tsx", "markdown" },
})
