vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<M-a>", 'copilot#Accept("")', { silent = true, expr = true })
