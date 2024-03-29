-- https://github.com/tami5/lspsaga.nvim

-- local plugin_key = vim.u.keymap.set.lspsaga.plugin_set
-- local signs = {
--     Error = {" ", " "},
--     Warn = {" ", " "},
--     Hint = {" ", " "},
--     Info = {" ", " "}
-- }

-- require("lspsaga").setup(
--     {
--         -- round、single、double
--         border_style = "round",
--         error_sign = signs.Error[1],
--         warn_sign = signs.Warn[1],
--         hint_sign = signs.Hint[1],
--         infor_sign = signs.Info[1],
--         diagnostic_header_icon = " ",
--         -- 正在写入的行提示
--         code_action_icon = " ",
--         code_action_prompt = {
--             -- 显示写入行提示
--             -- 如果为 true ，则写代码时会在左侧行号栏中显示你所定义的图标
--             enable = false,
--             sign = true,
--             sign_priority = 40,
--             virtual_text = true
--         },
--         code_action_keys = plugin_key.code_action_keys,
--         rename_action_keys = plugin_key.rename_action_keys
--     }
-- )

local ok, lspsaga = pcall(require, "lspsaga")
if not ok then
    print("Warn: tried to load lspsaga, but failed")
else
    lspsaga.setup()
end
