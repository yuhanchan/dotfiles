-- https://github.com/phaazon/hop.nvim

local ok, hop = pcall(require, "hop")
if not ok then
    print("Warn: tried to load hop, but file not found")
else
    hop.setup()
end
