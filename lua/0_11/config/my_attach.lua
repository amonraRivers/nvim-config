vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(args)
        local wk = require("which-key")
        wk.add({"<leader>l",group="lsp actions"})
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client.server_capabilities.documentFormattingProvider then
            -- using the recommended vim.keymap.set
            vim.keymap.set(
                "n",         -- mode
                "<leader>f", -- lhs: <leader>f for “format”
                function()
                    -- async = true means it won’t block Neovim
                    vim.lsp.buf.format({ async = true })
                end,
                { buffer = args.buf, desc = "LSP: Format buffer" }
            )
        end
        if client.server_capabilities.documentRangeFormattingProvider then
            vim.keymap.set("v", "<leader>f", function()
                    vim.lsp.buf.format({ async = true })
                end,
                { buffer = args.buf, desc = "LSP: Range format buffer" })
        end

        local opts = { buffer = args.buf, desc = "Here is Where the description of the keymap goes" }
        opts.desc = "LSP: Go to Declaration"
        vim.keymap.set('n', '<leader>lD', vim.lsp.buf.declaration, opts)
        opts.desc = "LSP: Go to Definition"
        vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, opts)
        opts.desc = "LSP: Hover"
        vim.keymap.set('n', '<leader>lK', vim.lsp.buf.hover, opts)
        opts.desc = "LSP: Go to implementation"
        vim.keymap.set('n', '<leader>lgi', vim.lsp.buf.implementation, opts)
        opts.desc = "LSP: signature help"
        vim.keymap.set({ 'n', 'i' }, '<leader>ls', vim.lsp.buf.signature_help, opts)
        opts.desc = "LSP: Add workspace folder"
        vim.keymap.set('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder, opts)
        opts.desc = "LSP: Remove workspace folder"
        vim.keymap.set('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder, opts)
        opts.desc = "LSP:list workspace folders"
        vim.keymap.set('n', '<leader>lwl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        opts.desc = "LSP:type definition"
        vim.keymap.set('n', '<leader>lD', vim.lsp.buf.type_definition, opts)
        opts.desc = "LSP:rename"
        vim.keymap.set('n', '<leader>lrn', vim.lsp.buf.rename, opts)
        opts.desc = "LSP:code action"
        vim.keymap.set({ 'n', 'v' }, '<leader>lca', vim.lsp.buf.code_action, opts)
        opts.desc = "LSP:references"
        vim.keymap.set('n', '<leader>lgr', vim.lsp.buf.references, opts)
        opts.desc = "LSP:open_float"
        vim.keymap.set('n', '<space>le', vim.diagnostic.open_float)
        opts.desc = "LSP:get previous"
        vim.keymap.set('n', '<leader>l[d', function()
            vim.diagnostic.jump({ count = -1 })
        end
        )
        opts.desc = "LSP:get next"
        vim.keymap.set('n', '<leader>l]d', function()
         vim.diagnostic.jump({ count = 1 })
        end
        )
        opts.desc = "LSP: set loc list"
        vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
    end,
})
