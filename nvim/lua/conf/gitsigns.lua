-- https://github.com/lewis6991/gitsigns.nvim/

-- TODO: gitsigns 热键映射
local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
    print("Warn: tried to load gitsigns, but failed")
else
    gitsigns.setup()
end
