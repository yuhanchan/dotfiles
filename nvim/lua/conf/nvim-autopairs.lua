-- https://github.com/windwp/nvim-autopairs

local ok, nvim_autopairs = pcall(require, "nvim-autopairs")
if not ok then
    print("Warn: tried to load nvim-autopairs, but failed")
else
    nvim_autopairs.setup()
end
