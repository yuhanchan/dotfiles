local ok, matchparen = pcall(require, "matchparen")
if not ok then
    print("Warn: tried to load matchparen, but failed")
else
    matchparen.setup({
        on_startup = true, -- Should it be enabled by default
        hl_group = 'MatchParen', -- highlight group for matched characters
        augroup_name = 'matchparen', -- almost no reason to touch this unless there is already augroup with such name
    })

    vim.cmd("DoMatchParen")
    vim.cmd("hi MatchParen cterm=none guibg=green guifg=orange")
end
