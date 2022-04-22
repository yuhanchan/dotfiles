-- https://github.com/lewis6991/impatient.nvim

local ok, impatient = pcall(require, "impatient")
if not ok then
    print("Warn: tried to load impatient, but file not found")
end
