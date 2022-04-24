-- https://github.com/ethanholz/nvim-lastplace

local ok, nvim_lastplace = pcall(require, "nvim-lastplace")
if not ok then
    print("Warn: tried to load nvim-lastplace, but failed")
else
    nvim_lastplace.setup(
        {
            -- place to ignore
            lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
            -- filetype to ignore
            lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
            lastplace_open_folds = true
        }
    )
end
