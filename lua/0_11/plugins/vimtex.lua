return {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
        -- VimTeX configuration goes here, e.g.
        if vim.uv.os_uname().sysname == 'Darwin' then
            vim.g.vimtex_view_method = 'skim'
            vim.g.vimtex_view_skim_sync = 1 -- forward search after compile
            vim.g.vimtex_view_skim_activate = 1 -- focus Skim on forward search
            vim.g.vimtex_view_skim_reading_bar = 1
        else
            vim.g.vimtex_view_method = 'zathura_simple'
        end
    end
}
