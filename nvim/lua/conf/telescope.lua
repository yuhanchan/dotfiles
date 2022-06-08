local ok, telescope = pcall(require, "telescope")
if not ok then
    print("Warn: tried to load telescope, but failed.")
else
    telescope.load_extension("vim_bookmarks")
end
