-- https://github.com/phaazon/hop.nvim

local ok, hop = pcall(require, "hop")
if not ok then
    print("Warn: tried to load hop, but failed")
else
    hop.setup({
        keys = 'etovxqpdygfblzhckisuran',
        jump_on_sole_occurrence = false
    })
end
