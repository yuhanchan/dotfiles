-- https://github.com/kyazdani42/nvim-tree.lua

-- local ok, nvim_web_devicons = pcall(require, "nvim-web-devicons")
-- if not ok then
-- print("Warn: tried to load nvim-web-devicons, but failed")
-- else
-- nvim_web_devicons.setup({ default = true })
-- end

local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
    print("Warn: tried to load nvim-tree, but failed")
else
    -- nvim_tree.setup(
    --     {
    --         view = {
    --             width = 30,
    --             height = 30,
    --             hide_root_folder = false,
    --             -- auto_resize = true
    --         },
    --         diagnostics = {
    --             enable = true,
    --             icons = {
    --                 hint = "",
    --                 info = "",
    --                 warning = "",
    --                 error = ""
    --             }
    --         },
    --         git = {
    --             enable = true,
    --             ignore = true,
    --             timeout = 500
    --         }
    --     }
    -- )
    nvim_tree.setup { -- BEGIN_DEFAULT_OPTS
        auto_reload_on_write = true,
        create_in_closed_folder = false,
        disable_netrw = false,
        hijack_cursor = false,
        hijack_netrw = true,
        hijack_unnamed_buffer_when_opening = false,
        ignore_buffer_on_setup = false,
        open_on_setup = false,
        open_on_setup_file = false,
        open_on_tab = false,
        sort_by = "name",
        update_cwd = false,
        reload_on_bufenter = false,
        respect_buf_cwd = false,
        view = {
            adaptive_size = false,
            centralize_selection = false,
            width = 30,
            height = 30,
            hide_root_folder = false,
            side = "left",
            preserve_window_proportions = false,
            number = false,
            relativenumber = false,
            signcolumn = "yes",
            mappings = {
                custom_only = false,
                list = {
                    -- user mappings go here
                },
            },
        },
        renderer = {
            add_trailing = false,
            group_empty = false,
            highlight_git = false,
            full_name = false,
            highlight_opened_files = "none",
            root_folder_modifier = ":~",
            indent_markers = {
                enable = false,
                icons = {
                    corner = "└ ",
                    edge = "│ ",
                    item = "│ ",
                    none = "  ",
                },
            },
            icons = {
                webdev_colors = true,
                git_placement = "before",
                padding = " ",
                symlink_arrow = " ➛ ",
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = true,
                },
                glyphs = {
                    default = "",
                    symlink = "",
                    folder = {
                        arrow_closed = "",
                        arrow_open = "",
                        default = "",
                        open = "",
                        empty = "",
                        empty_open = "",
                        symlink = "",
                        symlink_open = "",
                    },
                    git = {
                        unstaged = "",
                        staged = "✓",
                        unmerged = "",
                        renamed = "➜",
                        untracked = "",
                        deleted = "",
                        ignored = "◌",
                    },
                },
            },
            special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
        },
        hijack_directories = {
            enable = true,
            auto_open = true,
        },
        update_focused_file = {
            enable = false,
            update_cwd = false,
            ignore_list = {},
        },
        ignore_ft_on_setup = {},
        system_open = {
            cmd = "",
            args = {},
        },
        diagnostics = {
            enable = false,
            show_on_dirs = false,
            icons = {
                hint = "",
                info = "",
                warning = "",
                error = "",
            },
        },
        filters = {
            dotfiles = false,
            custom = {},
            exclude = {},
        },
        filesystem_watchers = {
            enable = false,
            interval = 100,
        },
        git = {
            enable = true,
            ignore = true,
            timeout = 400,
        },
        actions = {
            use_system_clipboard = true,
            change_dir = {
                enable = true,
                global = false,
                restrict_above_cwd = false,
            },
            expand_all = {
                max_folder_discovery = 300,
            },
            open_file = {
                quit_on_open = false,
                resize_window = true,
                window_picker = {
                    enable = true,
                    chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                    exclude = {
                        filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                        buftype = { "nofile", "terminal", "help" },
                    },
                },
            },
            remove_file = {
                close_window = true,
            },
        },
        trash = {
            cmd = "gio trash",
            require_confirm = true,
        },
        live_filter = {
            prefix = "[FILTER]: ",
            always_show_folders = true,
        },
        log = {
            enable = false,
            truncate = false,
            types = {
                all = false,
                config = false,
                copy_paste = false,
                diagnostics = false,
                git = false,
                profile = false,
                watcher = false,
            },
        },
    } -- END_DEFAULT_OPTS
end


-- vim.g.nvim_tree_icons = {
--     default = " ",
--     symlink = " ",
--     git = {
--         unstaged = "",
--         staged = "✓",
--         unmerged = "",
--         renamed = "➜",
--         untracked = "",
--         deleted = "",
--         ignored = ""
--     },
--     folder = {
--         -- arrow_open = "╰─▸",
--         -- arrow_closed = "├─▸",
--         arrow_open = "",
--         arrow_closed = "",
--         default = "",
--         open = "",
--         empty = "",
--         empty_open = "",
--         symlink = "",
--         symlink_open = ""
--     }
-- }

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
