return {
  'mrcjkb/rustaceanvim',
  version = '^6', -- Recommended
  lazy = false, -- This plugin is already lazy
    config = function ()
        vim.lsp.inlay_hint.enable(true)
    end
}
