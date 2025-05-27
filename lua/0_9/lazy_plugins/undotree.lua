return {
    'mbbill/undotree',
    config = function()
        vim.keymap.set('n', '<leader>ut', function()
            vim.cmd('UndotreeToggle')
        end)
        vim.keymap.set('n', '<leader>uf', function()
            vim.cmd('UndotreeFocus')
        end)
    end
}
