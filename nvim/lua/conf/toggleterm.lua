-- https://github.com/akinsho/toggleterm.nvim

-- local Toggleterm = require("toggleterm")
-- -- local plugin_key = vim.u.keymap.set.toggleterm.plugin_set

-- Toggleterm.setup(
--     {
--         --  开启的终端默认进入插入模式
--         start_in_insert = true,
--         -- 设置终端打开的大小
--         size = 6,
--         -- 打开普通终端时，关闭拼写检查
--         on_open = function()
--             vim.cmd("setlocal nospell")
--         end,
--     }
-- )

-- -- 新建终端
-- local Terminal = require("toggleterm.terminal").Terminal

-- local function inInsert()
--     -- 进入插入模式
--     vim.cmd("startinsert")
--     -- 删除 Esc 的映射
--     -- vim.api.nvim_del_keymap("t", plugin_key.delete_all_exit)
-- end

-- -- 新建浮动终端
-- local floatTerm =
--     Terminal:new(
--     {
--         hidden = true,
--         direction = "float",
--         float_opts = {
--             border = "double"
--         },
--         on_open = function(term)
--             inInsert()
--             -- 浮动终端中 Esc 是退出
--             vim.api.nvim_buf_set_keymap(
--                 term.bufnr,
--                 "t",
--                 -- plugin_key.float.float_exit,
--                 "<c-\\><c-n>:close<cr>",
--                 vim.u.keymap.opt.ns_opt
--             )
--         end,
--         -- on_close = function()
--         --     -- 重新映射 Esc
--         --     vim.api.nvim_set_keymap("t", plugin_key.float.again_exit, "<c-\\><c-n>", vim.u.keymap.opt.ns_opt)
--         -- end
--     }
-- )

-- -- 新建 lazygit 终端
-- local lazyGit =
--     Terminal:new(
--     {
--         cmd = "lazygit",
--         hidden = true,
--         direction = "float",
--         float_opts = {
--             border = "double"
--         },
--         on_open = function(term)
--             inInsert()
--             -- lazygit 中 q 是退出
--             vim.api.nvim_buf_set_keymap(
--                 term.bufnr,
--                 "i",
--                 -- plugin_key.lazygit.lazygit_exit,
--                 "<cmd>close<CR>",
--                 vim.u.keymap.opt.ns_opt
--             )
--         end,
--         -- on_close = function()
--         --     -- 重新映射 Esc
--         --     vim.api.nvim_set_keymap("t", plugin_key.lazygit.again_exit, "<c-\\><c-n>", vim.u.keymap.opt.ns_opt)
--         -- end
--     }
-- )

-- -- 定义新的方法
-- Toggleterm.float_toggle = function()
--     floatTerm:toggle()
-- end

-- Toggleterm.lazygit_toggle = function()
--     lazyGit:toggle()
-- end







-- require("toggleterm").setup{
--   -- size can be a number or function which is passed the current terminal
--   size = 20 | function(term)
--     if term.direction == "horizontal" then
--       return 15
--     elseif term.direction == "vertical" then
--       return vim.o.columns * 0.4
--     end
--   end,
--   open_mapping = [[<c-\>]],
--   on_close = fun(t: Terminal), -- function to run when the terminal closes
--   on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
--   on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr
--   on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
--   hide_numbers = true, -- hide the number column in toggleterm buffers
--   shade_filetypes = {},
--   highlights = {
--     -- highlights which map to a highlight group name and a table of it's values
--     -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
--     Normal = {
--       guibg = <VALUE-HERE>,
--     },
--     NormalFloat = {
--       link = 'Normal'
--     },
--     FloatBorder = {
--       guifg = <VALUE-HERE>,
--       guibg = <VALUE-HERE>,
--     },
--   },
--   shade_terminals = true,
--   shading_factor = '<number>', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
--   start_in_insert = true,
--   insert_mappings = true, -- whether or not the open mapping applies in insert mode
--   terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
--   persist_size = true,
--   direction = 'vertical' | 'horizontal' | 'tab' | 'float',
--   close_on_exit = true, -- close the terminal window when the process exits
--   shell = vim.o.shell, -- change the default shell
--   -- This field is only relevant if direction is set to 'float'
--   float_opts = {
--     -- The border key is *almost* the same as 'nvim_open_win'
--     -- see :h nvim_open_win for details on borders however
--     -- the 'curved' border is a custom border type
--     -- not natively supported but implemented in this plugin.
--     border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
--     width = <value>,
--     height = <value>,
--     winblend = 3,
--   }
-- }



-- local Terminal  = require('toggleterm.terminal').Terminal
-- local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

-- function _lazygit_toggle()
--   lazygit:toggle()
-- end

-- vim.api.nvim_set_keymap("n", "<C-g>", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})



local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

toggleterm.setup({
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
})

function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _LAZYGIT_TOGGLE()
    lazygit:toggle()
end

local node = Terminal:new({ cmd = "node", hidden = true })

function _NODE_TOGGLE()
    node:toggle()
end

local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })

function _NCDU_TOGGLE()
    ncdu:toggle()
end

local htop = Terminal:new({ cmd = "htop", hidden = true })

function _HTOP_TOGGLE()
    htop:toggle()
end

local python = Terminal:new({ cmd = "python", hidden = true })

function _PYTHON_TOGGLE()
    python:toggle()
end
