return {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    config = function()
        require("dap-python").setup("~/.pyenv/versions/debugpy/bin/python")
    end
}
