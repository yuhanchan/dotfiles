-- https://github.com/phaazon/hop.nvim

-- local ok, hop = pcall(require, "hop")
-- if not ok then
--     print("Warn: tried to load hop, but failed")
-- else
--     hop.setup({
--         keys = 'etovxqpdygfblzhckisuran',
--         jump_on_sole_occurrence = true,
--         -- vim.cmd("hi HopNextKey guifg=#ff9900"),
--         -- vim.cmd("hi HopNextKey1 guifg=#ff9900"),
--         -- vim.cmd("hi HopNextKey2 guifg=#ff9900")

--         vim.cmd("hi HopNextKey ctermfg=15"),
--         vim.cmd("hi HopNextKey1 ctermfg=15"),
--         vim.cmd("hi HopNextKey2 ctermfg=15")
--     })
-- end
require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
