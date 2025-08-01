-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "
vim.g.maplocalleader = " "
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<M-a>", 'copilot#Accept("")', { silent = true, expr = true })
vim.keymap.set('i','<M-j>', '<Plug>(copilot-accept-line)')
vim.keymap.set('i','<M-l>', '<Plug>(copilot-accept-word)')

