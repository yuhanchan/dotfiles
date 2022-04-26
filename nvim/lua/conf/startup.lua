local ok, startup = pcall(require, "startup")
if not ok then
    print("Warn: tried to load startup, but failed")
else
    startup.setup()
end
