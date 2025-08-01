--[[
    --return {
    "mfussenegger/nvim-dap",

    dependencies = {

        -- fancy UI for the debugger
        {
            "rcarriga/nvim-dap-ui",
            -- stylua: ignore
            keys = {
                { "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI" },
                { "<leader>de", function() require("dapui").eval() end,     desc = "Eval",  mode = { "n", "v" } },
            },
            opts = {},
            config = function(_, opts)
                -- setup dap config by VsCode launch.json file
                -- require("dap.ext.vscode").load_launchjs()
                local dap = require("dap")
                local dapui = require("dapui")
                dapui.setup(opts)
                dap.listeners.after.event_initialized["dapui_config"] = function()
                    dapui.open({})
                end
                dap.listeners.before.event_terminated["dapui_config"] = function()
                    dapui.close({})
                end
                dap.listeners.before.event_exited["dapui_config"] = function()
                    dapui.close({})
                end
            end,
            dependencies = {
                "nvim-neotest/nvim-nio" },
        },

        -- virtual text for the debugger
        {
            "theHamsta/nvim-dap-virtual-text",
            opts = {},
        },

        -- which key integration
        {
            "folke/which-key.nvim",
            optional = true,
            opts = {
                defaults = {
                    ["<leader>d"] = { name = "+debug" },
                },
            },
        },

    },

    -- stylua: ignore
    keys = {
        {
            "<leader>dB",
            function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
            desc =
            "Breakpoint Condition"
        },
        {
            "<leader>db",
            function() require("dap").toggle_breakpoint() end,
            desc =
            "Toggle Breakpoint"
        },
        {
            "<leader>dc",
            function() require("dap").continue() end,
            desc =
            "Continue"
        },
        {
            "<leader>da",
            function() require("dap").continue({ before = get_args }) end,
            desc =
            "Run with Args"
        },
        {
            "<leader>dC",
            function() require("dap").run_to_cursor() end,
            desc =
            "Run to Cursor"
        },
        {
            "<leader>dg",
            function() require("dap").goto_() end,
            desc =
            "Go to line (no execute)"
        },
        {
            "<leader>di",
            function() require("dap").step_into() end,
            desc =
            "Step Into"
        },
        {
            "<leader>dj",
            function() require("dap").down() end,
            desc =
            "Down"
        },
        { "<leader>dk", function() require("dap").up() end, desc = "Up" },
        {
            "<leader>dl",
            function() require("dap").run_last() end,
            desc =
            "Run Last"
        },
        {
            "<leader>dO",
            function() require("dap").step_out() end,
            desc =
            "Step Out"
        },
        {
            "<leader>do",
            function() require("dap").step_over() end,
            desc =
            "Step Over"
        },
        {
            "<leader>dp",
            function() require("dap").pause() end,
            desc =
            "Pause"
        },
        {
            "<leader>dr",
            function() require("dap").repl.toggle() end,
            desc =
            "Toggle REPL"
        },
        {
            "<leader>ds",
            function() require("dap").session() end,
            desc =
            "Session"
        },
        {
            "<leader>dt",
            function() require("dap").terminate() end,
            desc =
            "Terminate"
        },
        {
            "<leader>dw",
            function() require("dap.ui.widgets").hover() end,
            desc =
            "Widgets"
        },
    },

    config = function()
        local port = 13000
        local dap = require("dap")
        dap.adapters.codelldb = {
            type = 'server',
            port = "${port}",
            executable = {
                -- CHANGE THIS to your path!
                command = vim.env.HOME .. '/.codelldb/extension/adapter/codelldb',
                args = { "--port", "${port}" },

                -- On windows you may have to uncomment this:
                -- detached = false,
            }
        }
        dap.configurations.c = {
            {
                type = 'codelldb',
                request = 'launch',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                --program = '${fileDirname}/${fileBasenameNoExtension}',
                cwd = '${workspaceFolder}',
                terminal = 'integrated',
                args = function()
                    return "<" .. vim.fn.input('Arguments: ', '', 'file')
                end,
            }
        }

        dap.configurations.cpp = dap.configurations.c

        dap.configurations.rust = {
            {
                type = 'codelldb',
                request = 'launch',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                terminal = 'integrated',
                sourceLanguages = { 'rust' }
            }
        }
    end,
}
--]]
return {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
        local port = 13000
        local dap = require("dap")
        dap.adapters.codelldb = {
            type = 'server',
            port = "${port}",
            executable = {
                -- CHANGE THIS to your path!
                command = vim.env.HOME .. '/.codelldb/extension/adapter/codelldb',
                args = { "--port", "${port}" },

                -- On windows you may have to uncomment this:
                -- detached = false,
            }
        }
        dap.configurations.c = {
            {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
            },
        }

        dap.configurations.cpp = dap.configurations.c
        dap.configurations.rust = dap.configurations.c
        -- register the keymaps here
        --
    end
}
