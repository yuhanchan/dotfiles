-- load files from basic folder
require("basic.settings")
require("basic.keybinds")
require("basic.config")
require("basic.plugins")

vim.o.encoding = "utf-8"        -- set encoding
vim.o.updatetime = 100          -- delay to write swap to disk (default is 4000)
vim.o.timeoutlen = 500          -- timeout waiting for input
vim.o.showcmd = false           -- show command at the last line 
vim.o.hidden = true             -- allow tab switch when buffer not saved
vim.o.termguicolors = true      -- enable xterm color compatibility
vim.o.cursorline = true         -- highlight current line
vim.o.syntax = "enable"         -- enable syntax highlight
vim.o.number = true             -- show absolute line number
vim.o.relativenumber = true     -- show relative line number
vim.o.scrolloff = 10            -- set the minimun number of lines around current line
vim.o.mouse = "a"               -- enable mouse in all mode
vim.o.clipboard = "unnamedplus" -- enable system clipboard
vim.o.backup = false            -- enable backup
vim.o.swapfile = false          -- enable swapfile
vim.o.list = false              -- show special characters like space
vim.o.autoindent = true         -- enable auto indent
vim.o.filetype = "plugin"       -- set auto indent strategy to plugin
vim.o.hlsearch = true           -- enable search highlight
vim.o.showmatch = true          -- breifly jump to matching paramthese
vim.o.wildmenu = true           -- enable cmd auto complete
vim.o.ignorecase = true         -- case insensitive when search all lowercase
vim.o.smartcase = true          -- case sensitive when search contains uppercase 
vim.o.spell = true              -- enable spell check
vim.o.spelllang = "en_us,cjk"   -- set spell check language to English
vim.o.foldenable = true         -- enable code fold
vim.o.foldmethod = "indent"     -- set code fold strategy to indent
vim.o.foldlevel = 100           -- set max fold level