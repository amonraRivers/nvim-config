local config = function()
    local wk = require("which-key")
    wk.add({ "<leader>cr", group = "crates" })
    local crates = require('crates')
    crates.setup()

    local opts = { silent = true }

    vim.keymap.set('n', '<leader>crt', crates.toggle, opts)
    vim.keymap.set('n', '<leader>crr', crates.reload, opts)

    vim.keymap.set('n', '<leader>crv', crates.show_versions_popup, opts)
    vim.keymap.set('n', '<leader>crf', crates.show_features_popup, opts)
    vim.keymap.set('n', '<leader>crd', crates.show_dependencies_popup, opts)

    vim.keymap.set('n', '<leader>cru', crates.update_crate, opts)
    vim.keymap.set('v', '<leader>cru', crates.update_crates, opts)
    vim.keymap.set('n', '<leader>cra', crates.update_all_crates, opts)
    vim.keymap.set('n', '<leader>crU', crates.upgrade_crate, opts)
    vim.keymap.set('v', '<leader>crU', crates.upgrade_crates, opts)
    vim.keymap.set('n', '<leader>crA', crates.upgrade_all_crates, opts)

    vim.keymap.set('n', '<leader>crH', crates.open_homepage, opts)
    vim.keymap.set('n', '<leader>crR', crates.open_repository, opts)
    vim.keymap.set('n', '<leader>crD', crates.open_documentation, opts)
    vim.keymap.set('n', '<leader>crC', crates.open_crates_io, opts)
end
return {
    {
        'saecki/crates.nvim',
        tag = 'stable',
        config = config,
    }
}
