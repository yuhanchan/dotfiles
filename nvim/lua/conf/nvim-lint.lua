-- https://github.com/mfussenegger/nvim-lint

-- WARN: nvim-lint 手动下载诊断工具，确保工具在环境变量中能够被正确启用
-- pip3 install pylint

-- require("lint").linters_by_ft = {
--     python = {"pylint"}
--     -- javascript = {"eslint"},
--     -- typescript = {"eslint"},
--     -- go = {"golangcilint"}
-- }

-- -- 配置 pylint
-- require("lint.linters.pylint").args = {
--     "-f",
--     "json",
--     "--rcfile=" .. vim.g.nvim_lint_dir .. "/pylint.conf"
-- }

-- -- 何时触发检测：
-- -- BufEnter    ： 载入 Buf 后
-- -- BufWritePost： 写入文件后
-- -- 由于搭配了 AutoSave，所以其他的事件就不用加了

-- vim.cmd([[
-- au BufEnter * lua require('lint').try_lint()
-- au BufWritePost * lua require('lint').try_lint()
-- ]])
