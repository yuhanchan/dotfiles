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
else
    print("plugins loaded")
end

local ok, _ = pcall(require, "basic.options")
if not ok then
    print("Warn: tried to load basic.options, but failed")
end

