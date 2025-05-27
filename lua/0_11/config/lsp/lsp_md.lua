local config = function ()
    local bin_name = 'marksman'
local cmd = { bin_name, 'server' }

return {
  cmd = cmd,
  filetypes = { 'markdown', 'markdown.mdx' },
  root_markers = { '.marksman.toml', '.git' },
}
end

vim.lsp.enable('marksman')
vim.lsp.config('marksman', config())
