return {
    "mrcjkb/rustaceanvim",
    version = "^4",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "mfussenegger/nvim-dap",
        {
            "lvimuser/lsp-inlayhints.nvim",
            opts = {}
        },
    },
    ft = { "rust" },
    config = function()
        -- Update this path
        local extension_path = vim.env.HOME .. '/.codelldb/extension/'
        local codelldb_path = extension_path .. 'adapter/codelldb'
        local liblldb_path = extension_path .. 'lldb/lib/liblldb'
        local this_os = vim.loop.os_uname().sysname;

        -- The path is different on Windows
        if this_os:find "Windows" then
            codelldb_path = extension_path .. "adapter\\codelldb.exe"
            liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
        else
            -- The liblldb extension is .so for Linux and .dylib for MacOS
            liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
        end

        local cfg = require('rustaceanvim.config')
        vim.g.rustaceanvim = {
            inlay_hints = {
                highlight = "NonText",
            },
            tools = {
                hover_actions = {
                    auto_focus = true,
                },
            },
            server = {
                on_attach = function(client, bufnr)
                    require("lsp-inlayhints").on_attach(client, bufnr)
                end
            },
            dap = {
                adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
            },
        }
    end
}
