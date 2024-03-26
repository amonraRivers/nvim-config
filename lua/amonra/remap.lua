vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<M-a>", 'copilot#Accept("")', { silent = true, expr = true })
