return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    config = function()
        local trouble = require("trouble")
        vim.keymap.set("n", "<leader>tx", function() trouble.toggle() end)
        vim.keymap.set("n", "<leader>tw", function() trouble.toggle("workspace_diagnostics") end)
        vim.keymap.set("n", "<leader>td", function() trouble.toggle("document_diagnostics") end)
        vim.keymap.set("n", "<leader>tq", function() trouble.toggle("quickfix") end)
        vim.keymap.set("n", "<leader>tl", function() trouble.toggle("loclist") end)
        vim.keymap.set("n", "gR", function() trouble.toggle("lsp_references") end)
        -- jump to the next item, skipping the groups
        vim.keymap.set("n", "<leader>tn", function() trouble.next({ skip_groups = true, jump = true }) end)

        -- jump to the previous item, skipping the groups
        vim.keymap.set("n", "<leader>tp", function() trouble.previous({ skip_groups = true, jump = true }) end)

        -- jump to the first item, skipping the groups
        --vim.keymap.set("n", "<leader>tp", function() trouble.first({ skip_groups = true, jump = true }) end)

        -- jump to the last item, skipping the groups
        --vim.keymap.set("n", "<leader>tp", function() trouble.last({ skip_groups = true, jump = true }) end)
    end

}
