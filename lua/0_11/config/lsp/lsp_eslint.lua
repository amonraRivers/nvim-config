local function has_eslint_config_in_package_json(fname)
    local package_json = vim.fs.find("package.json", { upward = true, path = fname })[1]
    if not package_json then return false end
    local content = vim.fn.readfile(package_json)
    local ok, parsed = pcall(vim.json.decode, table.concat(content, "\n"))
    return ok and parsed["eslintConfig"] ~= nil
end

local configFunc = function()
    local util = vim.lsp.util --require 'lspconfig.util'
    local lsp = vim.lsp

    local config = {
        cmd = { 'vscode-eslint-language-server', '--stdio' },
        filetypes = {
            'javascript',
            'javascriptreact',
            'javascript.jsx',
            'typescript',
            'typescriptreact',
            'typescript.tsx',
            'vue',
            'svelte',
            'astro',
        },
        workspace_required = true,
        on_attach = function(client, bufnr)
            vim.api.nvim_buf_create_user_command(0, 'LspEslintFixAll', function()
                client:request_sync('workspace/executeCommand', {
                    command = 'eslint.applyAllFixes',
                    arguments = {
                        {
                            uri = vim.uri_from_bufnr(bufnr),
                            version = lsp.util.buf_versions[bufnr],
                        },
                    },
                }, nil, bufnr)
            end, {})
        end,
        -- https://eslint.org/docs/user-guide/configuring/configuration-files#configuration-file-formats
        root_dir = function(bufnr, on_dir)
            local root_file_patterns = {
                '.eslintrc',
                '.eslintrc.js',
                '.eslintrc.cjs',
                '.eslintrc.yaml',
                '.eslintrc.yml',
                '.eslintrc.json',
                'eslint.config.js',
                'eslint.config.mjs',
                'eslint.config.cjs',
                'eslint.config.ts',
                'eslint.config.mts',
                'eslint.config.cts',
            }

            local fname = vim.api.nvim_buf_get_name(bufnr)
            if (has_eslint_config_in_package_json(fname)) then
                table.insert(root_file_patterns, "package.json")
            end
            on_dir(vim.fs.dirname(vim.fs.find(root_file_patterns, { path = fname, upward = true })[1]))
        end,
        -- Refer to https://github.com/Microsoft/vscode-eslint#settings-options for documentation.
        settings = {
            validate = 'on',
            packageManager = nil,
            useESLintClass = false,
            experimental = {
                useFlatConfig = false,
            },
            codeActionOnSave = {
                enable = false,
                mode = 'all',
            },
            format = false,
            quiet = false,
            onIgnoredFiles = 'off',
            rulesCustomizations = {},
            run = 'onType',
            problems = {
                shortenToSingleLine = false,
            },
            -- nodePath configures the directory in which the eslint server should start its node_modules resolution.
            -- This path is relative to the workspace folder (root dir) of the server instance.
            nodePath = '',
            -- use the workspace folder location or the file location (if no workspace folder is open) as the working directory
            workingDirectory = { mode = 'location' },
            codeAction = {
                disableRuleComment = {
                    enable = true,
                    location = 'separateLine',
                },
                showDocumentation = {
                    enable = true,
                },
            },
        },
        before_init = function(_, config)
            -- The "workspaceFolder" is a VSCode concept. It limits how far the
            -- server will traverse the file system when locating the ESLint config
            -- file (e.g., .eslintrc).
            local root_dir = config.root_dir

            if root_dir then
                config.settings = config.settings or {}
                config.settings.workspaceFolder = {
                    uri = root_dir,
                    name = vim.fn.fnamemodify(root_dir, ':t'),
                }

                -- Support flat config
                local flat_config_files = {
                    'eslint.config.js',
                    'eslint.config.mjs',
                    'eslint.config.cjs',
                    'eslint.config.ts',
                    'eslint.config.mts',
                    'eslint.config.cts',
                }

                for _, file in ipairs(flat_config_files) do
                    if vim.fn.filereadable(root_dir .. '/' .. file) == 1 then
                        config.settings.experimental = config.settings.experimental or {}
                        config.settings.experimental.useFlatConfig = true
                        break
                    end
                end

                -- Support Yarn2 (PnP) projects
                local pnp_cjs = root_dir .. '/.pnp.cjs'
                local pnp_js = root_dir .. '/.pnp.js'
                if vim.uv.fs_stat(pnp_cjs) or vim.uv.fs_stat(pnp_js) then
                    local cmd = config.cmd
                    config.cmd = vim.list_extend({ 'yarn', 'exec' }, cmd)
                end
            end
        end,
        handlers = {
            ['eslint/openDoc'] = function(_, result)
                if result then
                    vim.ui.open(result.url)
                end
                return {}
            end,
            ['eslint/confirmESLintExecution'] = function(_, result)
                if not result then
                    return
                end
                return 4 -- approved
            end,
            ['eslint/probeFailed'] = function()
                vim.notify('[lspconfig] ESLint probe failed.', vim.log.levels.WARN)
                return {}
            end,
            ['eslint/noLibrary'] = function()
                vim.notify('[lspconfig] Unable to find ESLint library.', vim.log.levels.WARN)
                return {}
            end,
        },
    }
    return config
end

vim.lsp.enable('eslint')
vim.lsp.config('eslint', configFunc())
