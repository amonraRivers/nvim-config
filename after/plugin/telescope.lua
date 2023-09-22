local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>p.', function()
    builtin.find_files({
        find_command = { 'rg', '--files', '--glob', '!.git', '--glob', '.env*', '--hidden' },
    });
end, {})
vim.keymap.set('n', '<leader>pA', function()
    builtin.find_files({
        find_command = { 'rg', '--files', '--glob', '!.git', '--no-ignore', '--hidden' },
    });
end, {})
vim.keymap.set('n', '<leader>pf', function()
    builtin.find_files({
        find_command = { 'rg', '--files', '--glob', '!.git', '--hidden' },
    });
end, {})
vim.keymap.set('n', '<C-p>', function()
    builtin.git_files({});
end, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep> ") });
end, {})
