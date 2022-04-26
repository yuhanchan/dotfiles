local ok, bookmarks = pcall(require, "nvim-bookmarks")
if not ok then
    print("Warn: tried to load nvim-bookmarks, but failed")
else
    vim.g.bookmark_sign = '⚑'
    vim.g.bookmark_annotation_sign = '☰'
    vim.g.bookmark_auto_save = true
end
