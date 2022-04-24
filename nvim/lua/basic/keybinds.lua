-- alias some long apis
vim.keybinds = {
    gmap = vim.api.nvim_set_keymap,
    bmap = vim.api.nvim_buf_set_keymap,
    dgmap = vim.api.nvim_del_keymap,
    dbmap = vim.api.nvim_buf_del_keymap,
    opts = { noremap = true, silent = true }
}

local cmd = vim.cmd

-- remap leader to space
vim.keybinds.gmap("", "<space>", "<Nop>", vim.keybinds.opts)
vim.g.mapleader = " "
vim.g.localleader = ","

-- remap jk to Esc
vim.keybinds.gmap("i", "jk", "<Esc>", vim.keybinds.opts)

-- C-u and C-d scroll 10 lines instead of half page
vim.keybinds.gmap("n", "<C-u>", "10k", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-d>", "10j", vim.keybinds.opts)

-- adjust split size. Ctrl + Arrows
vim.keybinds.gmap("n", "<C-up>", "<cmd>res +1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-down>", "<cmd>res -1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-left>", "<cmd>vertical resize-1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-right>", "<cmd>vertical resize+1<CR>", vim.keybinds.opts)

-- toggle highlight search
vim.keybinds.gmap("n", "<F3>", ":set hlsearch!<CR>", vim.keybinds.opts)

-- leader + cs to perform spell check
vim.keybinds.gmap("n", "<leader>cs", "<cmd>set spell!<CR>", vim.keybinds.opts)

-- code indent and de-indent
vim.keybinds.gmap("n", "<", "v<gn", vim.keybinds.opts)
vim.keybinds.gmap("v", "<", "<gv", vim.keybinds.opts)
vim.keybinds.gmap("n", ">", "v>gn", vim.keybinds.opts)
vim.keybinds.gmap("v", ">", ">gv", vim.keybinds.opts)
-- vim.keybinds.gmap("n", "<S-Tab>", "v<gn", vim.keybinds.opts)
-- vim.keybinds.gmap("v", "<S-Tab>", "<gv", vim.keybinds.opts)
-- vim.keybinds.gmap("n", "<Tab>", "v>gn", vim.keybinds.opts)
-- vim.keybinds.gmap("v", "<Tab>", ">gv", vim.keybinds.opts)

-- all split commnd start with s
vim.keybinds.gmap("n", "sv", ":vsp<CR>", vim.keybinds.opts) -- split vertically
vim.keybinds.gmap("n", "sh", ":sp<CR>", vim.keybinds.opts) -- split horizontally
-- vim.keybinds.gmap("n", "sc", "<C-w>c", vim.keybinds.opts)   -- close current split
-- vim.keybinds.gmap("n", "so", "<C-w>o", vim.keybinds.opts) -- close others

-- control split size, can also use mouse
vim.keybinds.gmap("n", "s>", ":vertical resize +20<CR>", vim.keybinds.opts) -- adjust split size to right
vim.keybinds.gmap("n", "s<", ":vertical resize -20<CR>", vim.keybinds.opts) -- adjust split size to left
vim.keybinds.gmap("n", "s=", "<C-w>=", vim.keybinds.opts) -- adjust split to be equal size
vim.keybinds.gmap("n", "sj", ":resize +10<CR>", vim.keybinds.opts) -- adjust split size down
vim.keybinds.gmap("n", "sk", ":resize -10<CR>", vim.keybinds.opts) -- adjust split size up

-- navigate between windows
vim.keybinds.gmap("n", "<A-h>", "<C-w>h", vim.keybinds.opts)
vim.keybinds.gmap("n", "<A-j>", "<C-w>j", vim.keybinds.opts)
vim.keybinds.gmap("n", "<A-k>", "<C-w>k", vim.keybinds.opts)
vim.keybinds.gmap("n", "<A-l>", "<C-w>l", vim.keybinds.opts)

-- navigate between tabs
vim.keybinds.gmap("n", "<C-h>", "gT", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-l>", "gt", vim.keybinds.opts)

-- move lines up and down
vim.keybinds.gmap("n", "<A-j>", ":m .+1<CR>==", vim.keybinds.opts)
vim.keybinds.gmap("n", "<A-k>", ":m .-2<CR>==", vim.keybinds.opts)
vim.keybinds.gmap("v", "<A-j>", ":m '>+1<CR>gv=gv", vim.keybinds.opts)
vim.keybinds.gmap("v", "<A-k>", ":m '<-2<CR>gv=gv", vim.keybinds.opts)

-- Plugin hop
vim.keybinds.gmap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.keybinds.gmap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
vim.keybinds.gmap('n', '<C-g>', ":HopPattern<CR>", {})

-- alias commands easy to mistype
cmd(':command! WQ wq')
cmd(':command! WQ wq')
cmd(':command! Wq wq')
cmd(':command! Wqa wqa')
cmd(':command! W w')
cmd(':command! Q q')
