vim.lsp.enable('pylsp')
vim.lsp.config('pylsp', {
    cmd = { vim.fn.expand('~/.virtual_py_envs/nvim/bin/pylsp') },
    filetypes = { 'python' },

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
    root_markers = {
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        'Pipfile',
    },
    root_dir = function(bufnr, on_dir)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        local markers = {
            'pyproject.toml', 'setup.py', 'setup.cfg',
            'requirements.txt', 'Pipfile',
        }
        local root = vim.fs.root(fname, markers)
            or vim.fs.root(fname, { '.git' })
            or vim.fs.dirname(fname) -- single file fallback
        on_dir(root)
    end,
})
