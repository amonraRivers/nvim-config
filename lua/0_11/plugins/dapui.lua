return {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio",
        "which-key.nvim" },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        local wk = require("which-key")
        wk.add({ "<leader>dui", group = "dap-ui" })
        dapui.setup()
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config= function()
            dapui.open()
        end

        dap.listeners.before.event_initialized.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
        -- register the keymaps here
        --
    end,
    keys = {
        { "<leader>duit", function() require("dapui").toggle({}) end, desc = "Dap UI" },
        { "<leader>duie", function() require("dapui").eval() end,     desc = "Eval",  mode = { "n", "v" } },
    },
}
