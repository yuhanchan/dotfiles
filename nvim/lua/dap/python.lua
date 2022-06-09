-- python3 -m pip install debugpy
local ok, dap = pcall(require, 'dap')
if not ok then
    print('Warn: tried to load dap, but failed')
else
    dap.adapters.python = {
        type = "executable",
        command = "python3",
        args = { "-m", "debugpy.adapter" }
    }
    dap.configurations.python = {
        {
            type = "python",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            pythonPath = function()
                return vim.g.python_path
            end
        }
    }
end