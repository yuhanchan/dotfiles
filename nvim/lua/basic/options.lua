local o = vim.o   -- global options
local wo = vim.wo -- window-local options
local bo = vim.bo -- buffer-local optionlocal cmd = vim.cmd

-- global options
o.encoding = "utf-8"        -- set encoding
o.updatetime = 100          -- delay to write swap to disk (default is 4000)
o.timeoutlen = 500          -- timeout waiting for input
o.showcmd = false           -- show command at the last line
o.hidden = true             -- allow tab switch when buffer not saved
o.termguicolors = true      -- enable xterm color compatibility
o.cursorline = true         -- highlight current line
o.syntax = "enable"         -- enable syntax highlight
o.number = true             -- show absolute line number
o.relativenumber = true     -- show relative line number
o.scrolloff = 10            -- set the minimun number of lines around current line
o.mouse = "a"               -- enable mouse in all mode
o.clipboard = "unnamedplus" -- enable system clipboard
o.backup = false            -- enable backup
o.swapfile = false          -- enable swapfile
o.list = false              -- show special characters like space
o.autoindent = true         -- enable auto indent
o.filetype = "plugin"       -- set auto indent strategy to plugin
o.hlsearch = true           -- enable search highlight
o.showmatch = true          -- breifly jump to matching paramthese
o.wildmenu = true           -- enable cmd auto complete
o.ignorecase = true         -- case insensitive when search all lowercase
o.smartcase = true          -- case sensitive when search contains uppercase
o.spell = false             -- enable spell check
o.spelllang = "en_us,cjk"   -- set spell check language to English
o.foldenable = true         -- enable code fold
o.foldmethod = "indent"     -- set code fold strategy to indent
o.foldlevel = 100           -- set max fold level
o.splitbelow = true         -- splitbelow
o.splitright = true         -- splitright
o.hlsearch = false
o.foldexpr = "nvim_treesitter#foldexpr()"
-- window-local options
-- wo.number = false
-- wo.colorcolumn = '80'       -- highlight column 80
-- wo.wrap = false

o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.expandtab = true

-- buffer-local options
bo.tabstop = 4
bo.shiftwidth = 4
bo.softtabstop = 4
bo.expandtab = true
