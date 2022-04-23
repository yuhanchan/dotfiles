-- https://github.com/kyazdani42/nvim-tree.lua

local ok, nvim_web_devicons = pcall(require, "nvim-web-devicons")
if not ok then
    print("Warn: tried to load nvim-web-devicons, but file not found")
else
    nvim_web_devicons.setup({ default = true })
end

local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
    print("Warn: tried to load nvim-tree, but file not found")
else
    nvim_tree.setup(
        {
            view = {
                width = 30,
                height = 30,
                hide_root_folder = false,
                auto_resize = true
            },
            diagnostics = {
                enable = true,
                icons = {
                    hint = "",
                    info = "",
                    warning = "",
                    error = ""
                }
            },
            git = {
                enable = true,
                ignore = true,
                timeout = 500
            }
        }
    )
end


vim.g.nvim_tree_icons = {
    default = " ",
    symlink = " ",
    git = {
        unstaged = "",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "",
        deleted = "",
        ignored = ""
    },
    folder = {
        -- arrow_open = "╰─▸",
        -- arrow_closed = "├─▸",
        arrow_open = "",
        arrow_closed = "",
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = ""
    }
}

vim.g.nvim_tree_add_trailing = 1 -- add / after folder

vim.keybinds.gmap("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", vim.keybinds.opts) -- C-n to toggle tree

-- leader fc to find current file in tree
vim.keybinds.gmap("n", "<leader>fc", "<cmd>NvimTreeFindFile<CR>", vim.keybinds.opts)

-- default shortcut
-- o     : open foler
-- a     : add folder or file
-- r     : rename folder or file
-- x     : cut folder or file
-- c     : copy folder or file
-- d     : delete folder or file
-- y     : copy the name of folder or file
-- Y     : copy relative path of folder or file
-- gy    : copy absolute path of folder or file
-- p     : paste folder or file
-- s     : open folder or file in default program
-- <Tab> : add file to buffer
-- <C-v> : open file in vertical split
-- <C-x> : open file in horizontal split
-- <C-]> : enter folder
-- <C-r> : rename folder or file, and delete original name
-- -     : goto last level
-- I     : toggle the visibility of hidden files
-- H     : toggle the visibility of dot files
-- R     : refresh tree
-- ?     : show help
