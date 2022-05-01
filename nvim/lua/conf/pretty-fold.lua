-- pretty-fold

local ok, pretty_fold = pcall(require, "pretty-fold")
if not ok then
    print("Warn: tried to load pretty-fold, but failed")
else
    pretty_fold.setup()
end
