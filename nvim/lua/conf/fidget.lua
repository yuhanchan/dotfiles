-- https://github.com/j-hui/fidget.nvim

local ok, fidget = pcall(require, "fidget")
if not ok then
    print("Warn: tried to load fidget, but failed")
else
    fidget.setup(
        {
            window = {
                -- 透明度
                blend = 0
            }
        }
    )
end
