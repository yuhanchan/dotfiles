-- https://github.com/rcarriga/nvim-dap-ui


local ok, dap = pcall(require, "dap")
if not ok then
    print("Warn: tried to load dap, but failed")
else
    local ok2, dapui = pcall(require, "dapui")
    if not ok2 then
        print("Warn: tried to load dapui, but failed")
    else
        -- 初始化调试界面
        dapui.setup(
            {
                sidebar = {
                    -- dapui 的窗口设置在右边
                    position = "right"
                }
            }
        )

        -- 如果开启或关闭调试，则自动打开或关闭调试界面
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
            dap.repl.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
            dap.repl.close()
        end

        -- 显示或隐藏调试界面
        vim.keybinds.gmap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<CR>", vim.keybinds.opts)
    end
end
