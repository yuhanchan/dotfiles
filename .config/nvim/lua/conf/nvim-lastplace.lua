-- https://github.com/ethanholz/nvim-lastplace

require("nvim-lastplace").setup(
    {
        -- place to ignore
        lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
        -- filetype to ignore
        lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
        lastplace_open_folds = true
    }
)
