-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://github.com/p00f/nvim-ts-rainbow
-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring

-- local plugin_key = vim.u.keymap.set.nvim_treesitter.plugin_set

-- require("nvim-ts-rainbow").setup()
-- require("ts_context_commentstring")

local ok, nvim_treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not ok then
    print("Warn: tried to load nvim-treesitter_configs, but failed")
else
    nvim_treesitter_configs.setup({
        -- A list of parser names, or "all"
        ensure_installed = { "c", "lua", "rust", "bash", "python", "cpp", "cmake", "go", "html", "json", "julia", "make", "markdown", 'vim' },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- List of parsers to ignore installing (for "all")
        ignore_install = { "javascript" },

        highlight = {
            -- `false` will disable the whole extension
            enable = true,

            -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
            -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
            -- the name of the parser)
            -- list of language that will be disabled
            disable = {},

            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
        },

        indent = {
            enable = true
        },
        -- nvim-ts-rainbow
        rainbow = {
            enable = true,
            extended_mode = true
            -- colors = {}, -- table of hex strings
            -- termcolors = {} -- table of colour name strings
        },
        -- determine filetype by context, provided by nvim-ts-context-commentstring
        context_commentstring = {
            enable = true
        }
    })
end
