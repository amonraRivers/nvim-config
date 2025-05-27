return {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("nvim-tree").setup {}
        vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>", { silent = true, noremap = true })
        vim.api.nvim_set_keymap("n", "<M-f>", ":NvimTreeFindFile<cr>", { silent = true, noremap = true })
        vim.api.nvim_set_keymap("n", "<M-c>", ":NvimTreeCollapse<cr>", { silent = true, noremap = true })
    end
}
