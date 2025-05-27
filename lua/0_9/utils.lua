function ShowLineDiagnostics()
    local line = vim.api.nvim_win_get_cursor(0)[1]
    local diagnostics = vim.lsp.diagnostic.get_line_diagnostics(nil, nil, line)
    if diagnostics == nil then
        print("No diagnostics for line " .. line)
        return
    end
    for _, d in ipairs(diagnostics) do
        print(d.message)
    end
end
