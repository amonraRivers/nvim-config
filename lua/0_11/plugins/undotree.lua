return {
    'mbbill/undotree',
    config = function()
        local keymap=require("which-key")
        keymap.add({"<leader>u",group="undotree"})
        vim.keymap.set('n', '<leader>ut', function()
            vim.cmd('UndotreeToggle')
        end)
        vim.keymap.set('n', '<leader>uf', function()
            vim.cmd('UndotreeFocus')
        end)
    end
}
