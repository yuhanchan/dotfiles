local ok, monokai = pcall(require, "monokai")
if not ok then
    print("Warn: tried to load monokai, but file not found")
else
    monokai.setup({
        palette = require('monokai').pro,
    })
end
