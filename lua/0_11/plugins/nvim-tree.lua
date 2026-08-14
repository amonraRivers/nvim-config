return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("nvim-tree").setup({git={ignore=false}})
        vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>", { silent = true, noremap = true })
        vim.api.nvim_set_keymap("n", "<M-f>", ":NvimTreeFindFile<cr>", { silent = true, noremap = true })
        vim.api.nvim_set_keymap("n", "<M-c>", ":NvimTreeCollapse<cr>", { silent = true, noremap = true })
    end
}
