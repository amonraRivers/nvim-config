return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    -- FIX: Bypasses raw terminal yarn commands and fetches the pre-built release binary safely
    build = "cd app && npm install && git restore .",
    config = function()
        -- 1. Register the keymap inside which-key
        local wk = require("which-key")
        wk.add({
            { "<leader>m",  group = "markdown" },
            { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Preview in Browser" },
        })
    end
}
