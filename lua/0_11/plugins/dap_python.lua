return {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    config = function()
        require("dap-python").setup("~/.virtual_py_envs/debugpy/bin/python")
    end
}
