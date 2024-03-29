-- https://github.com/ur4ltz/surround.nvim

local ok, surround = pcall(require, "surround")
if not ok then
    print("Warn: tried to load surround, but failed")
else
    surround.setup(
        {
            mappings_style = "surround"
        }
    )
end
