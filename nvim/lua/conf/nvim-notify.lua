local ok, notify = pcall(require, "notify")
if not ok then
    print("Tried to load notify, but failed")
    return
else
    notify.setup({
        timeout = 2000,
        -- icon = vim.fn.expand("$VIMRC_DIR/icons/nvim.png"),
    })
end

