local ok, dap = pcall(require, 'dap')
if not ok then
    print('Warn: tried to load dap, but failed')
else
    dap.adapters.cppdbg = {
        id = 'cppdbg',
        type = 'executable',
        command = os.getenv("HOME") .. '/.dotfiles/nvim/extensions/vscode-cpptools/debugAdapters/bin/OpenDebugAD7',
    }

    dap.configurations.cpp = {
        {
            name = "Launch file",
            type = "cppdbg",
            request = "launch",
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = true,
        },
        -- {
        --     name = 'Attach to gdbserver :1234',
        --     type = 'cppdbg',
        --     request = 'launch',
        --     MIMode = 'gdb',
        --     miDebuggerServerAddress = 'localhost:1234',
        --     miDebuggerPath = '/usr/bin/gdb',
        --     cwd = '${workspaceFolder}',
        --     program = function()
        --         return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        --     end,
        -- },
    }
end
