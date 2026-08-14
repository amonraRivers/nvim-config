return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    config = function()
        -- 1. Use the core API directly. It handles skipping existing parsers natively.
        require("nvim-treesitter").install({
            "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", 
            "javascript", "typescript", "html", "tsx", "go", "rust", 
            "php", "python", "json", "yaml", "toml", "css", "java", 
            "ebnf", "julia", "zig", "markdown", "markdown_inline"
        })

        -- 2. Native Neovim 0.12+ engine activation
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "*",
            callback = function(args)
                local ft = vim.bo[args.buf].filetype
                local lang = vim.treesitter.language.get_lang(ft) or ft
                
                if vim.treesitter.language.add(lang) then
                    vim.treesitter.start(args.buf, lang)
                    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
    end
}

