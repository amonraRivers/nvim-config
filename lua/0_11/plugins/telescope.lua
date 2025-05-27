return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim',
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = 'make',
            enabled = true,
            config = function(plugin)
                require('telescope').load_extension('fzf')
            end,
        },
    },
    config = function(plugin, opts)
        local wk = require("which-key")
        wk.add({"<leader>p",group="telescope"})
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>p.', function()
            builtin.find_files({
                find_command = { 'rg', '--files', '--glob', '!.git', '--glob', '.env*', '--hidden' },
            });
        end, {})
        vim.keymap.set('n', '<leader>pa', function()
            builtin.find_files({
                find_command = { 'rg', '--files', '--glob', '!.git', '--no-ignore', '--hidden' },
            });
        end, {})
        vim.keymap.set('n', '<leader>pf', function()
            builtin.find_files({
                find_command = { 'rg', '--files', '--glob', '!.git', '--glob', '!.ccls-cache', '--hidden' },
            });
        end, {})
        vim.keymap.set('n', '<C-p>', function()
            builtin.git_files({});
        end, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep> ") });
        end, {})
        vim.keymap.set('n', '<leader>pgr', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>pw', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end, {})
        vim.keymap.set('n', '<leader>pW', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end, {})
        vim.keymap.set('n', '<leader>pgs', function()
            builtin.git_status({});
        end, {})
    end
}
