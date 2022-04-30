-- load files from basic folder
local ok, _ = pcall(require, "basic.settings")
if not ok then
    print("Warn: tried to load basic.settings, but failed")
end

local ok, _ = pcall(require, "basic.keybinds")
if not ok then
    print("Warn: tried to load basic.keybinds, but failed")
end

local ok, _ = pcall(require, "basic.config")
if not ok then
    print("Warn: tried to load basic.config, but failed")
end

local ok, _ = pcall(require, "basic.plugins")
if not ok then
    print("Warn: tried to load basic.plugins, but failed")
end

local ok, _ = pcall(require, "basic.options")
if not ok then
    print("Warn: tried to load basic.options, but failed")
end

vim.cmd "colorscheme sonokai"

vim.cmd "hi illuminatedWord cterm=underline gui=underline guibg=#737373"

