return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "typescript",
                "html", "tsx", "go", "rust", "php", "python", "markdown", "json", "yaml", "toml",
                "css", "java", "ebnf", "julia" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
