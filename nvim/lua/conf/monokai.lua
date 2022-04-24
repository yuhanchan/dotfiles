local ok, monokai = pcall(require, "monokai")
if not ok then
    print("Warn: tried to load monokai, but failed")
else
    monokai.setup({
        palette = require('monokai').pro,
    })
end
