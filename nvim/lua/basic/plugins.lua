---@diagnostic disable: undefined-global
-- https://github.com/wbthomason/packer.nvim

-- check if packer is installed, if not, install it
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    }
    print 'Installing packer.nvim, close and reopen nvim to complete installation'
    vim.cmd [[packadd packer.nvim]]
end

local install_plugins =
{
    {
        -- packer is a plugin manager
        "wbthomason/packer.nvim"
    },
    {
        -- nvim-tree
        "kyazdani42/nvim-tree.lua",
        requires = { "kyazdani42/nvim-web-devicons" },
        load_file = true
    },
    {
        -- monokai theme
        "tanvirtin/monokai.nvim",
        load_file = true
    },
    {
        -- syntax highlight
        "nvim-treesitter/nvim-treesitter",
        run = ":TSupdate",
        load_file = true,
        event = { "BufRead", "BufNewFile" },
        requires = { "JoosepAlviste/nvim-ts-context-commentstring", "p00f/nvim-ts-rainbow" },
        after = { "nvim-ts-context-commentstring", "nvim-ts-rainbow" }
    },
    {
        -- illuminate same word under cursor
        "RRethy/vim-illuminate",
        load_file = true
    },
    {
        -- locate cursor to the place at last quit
        "ethanholz/nvim-lastplace",
        load_file = true
    },
    {
        -- light weight status bar
        "nvim-lualine/lualine.nvim",
        disable = false,
        load_file = true,
        after = { "nvim-gps", "gitsigns.nvim", "nvim-web-devicons" }
    },
    {
        "yuhanchan/nvim-tabline",
        load_file = true,
    },
    {
        -- optimize startup
        "lewis6991/impatient.nvim",
        load_file = true
    },
    {
        -- icon patch
        "kyazdani42/nvim-web-devicons",
        after = "impatient.nvim"
    },
    {
        -- Lua dep
        "nvim-lua/plenary.nvim",
        event = { "BufRead", "BufNewFile" }
    },
    {
        -- grep alternative
        "BurntSushi/ripgrep",
        event = { "BufRead", "BufNewFile" }
    },
    {
        -- find alternative
        "sharkdp/fd",
        event = { "BufRead", "BufNewFile" }
    },
    {
        -- LSP basic
        "neovim/nvim-lspconfig",
        load_file = true,
        event = { "BufRead", "BufNewFile" }
    },
    {
        -- view tree
        "stevearc/aerial.nvim",
        load_file = true,
        -- after = {"nvim-web-devicons"}
        after = { "nvim-web-devicons", "nvim-lspconfig" }
    },
    {
        "hrsh7th/nvim-cmp",
        load_file = true,
        after = "aerial.nvim"
    },
    {
        "hrsh7th/cmp-buffer",
        after = "aerial.nvim"
    },
    {
        "hrsh7th/cmp-path",
        after = "aerial.nvim"
    },
    {
        "hrsh7th/cmp-cmdline",
        after = "aerial.nvim"
    },
    {
        -- replace built-in omnifunc auto-complete
        "hrsh7th/cmp-nvim-lsp",
        after = { "aerial.nvim", "nvim-cmp", "cmp-buffer", "cmp-path", "cmp-cmdline" }
    },
    {
        -- LSP installer
        "williamboman/nvim-lsp-installer",
        load_file = true,
        after = "cmp-nvim-lsp"
    },
    -- {
    --     -- LSP UI beautify
    --     "tami5/lspsaga.nvim",
    --     load_file = true,
    --     after = "nvim-lsp-installer"
    -- },
    -- {
    --     -- LSP diagnose
    --     "mfussenegger/nvim-lint",
    --     load_file = false,
    --     after = "nvim-lsp-installer"
    -- },
    {
        -- git copilot
        "github/copilot.vim",
        load_file = true,
        event = "InsertCharPre"
    },
    {
        -- snippet engine
        "L3MON4D3/LuaSnip",
        load_file = false,
        after = { "aerial.nvim", "nvim-cmp", "cmp-buffer", "cmp-path", "cmp-cmdline" }
    },
    {
        -- friendly snippets
        "rafamadriz/friendly-snippets",
        load_file = false,
        after = { "aerial.nvim", "nvim-cmp", "cmp-buffer", "cmp-path", "cmp-cmdline" , "LuaSnip" }
    },
    {
        -- provide context info for status bar
        "SmiteshP/nvim-gps",
        after = "nvim-treesitter"
    },
    {
        -- git signs
        "lewis6991/gitsigns.nvim",
        load_file = true,
        after = {
            "nvim-treesitter",
            "plenary.nvim"
        }
    },
    {
        -- color parantheses
        "p00f/nvim-ts-rainbow",
        event = { "BufRead", "BufNewFile" }
    },
    {
        -- comment
        "JoosepAlviste/nvim-ts-context-commentstring",
        event = { "BufRead", "BufNewFile" }
    },
    {
        -- comment
        "numToStr/Comment.nvim",
        load_file = true,
        after = "nvim-ts-context-commentstring"
    },
    {
        -- code formatter
        "sbdchd/neoformat",
        load_file = true,
        cmd = "Neoformat"
    },
    {
        -- autopair parantheses
        "windwp/nvim-autopairs",
        load_file = true,
        event = "InsertEnter"
    },
    {
        -- surround
        "ur4ltz/surround.nvim",
        load_file = true,
        event = { "BufRead", "BufNewFile" }
    },
    {
        -- built-in terminal
        "akinsho/toggleterm.nvim",
        load_file = true,
        event = { "BufRead", "BufNewFile" }
    },
    {
        -- quick jump
        "phaazon/hop.nvim",
        load_file = true,
        -- cmd = {
            -- "HopWord",
            -- "HopLine",
            -- "HopChar1"
        -- }
    },
    {
        -- which-key
        "folke/which-key.nvim",
        load_file = true,
        event = {"BufRead", "BufNewFile"}
    },
    {
        -- vim_bookmarks
        "MattesGroeger/vim-bookmarks",
        load_file = false,
    },
    {
        -- telescope vim bookmarks extension
        "tom-anders/telescope-vim-bookmarks.nvim",
    },
    {
        'nvim-telescope/telescope.nvim',
        load_file = true,
        requires = { 'nvim-lua/plenary.nvim' }
    },
    -- {
        -- "ellisonleao/glow.nvim",
    -- },
    {
        -- todo comments
        "folke/todo-comments.nvim",
        load_file = true,
        requires = { 'nvim-lua/plenary.nvim' },
    },
    {
        -- autosession
        "rmagatti/auto-session",
        load_file = true,
    },
    -- {
    --     -- startup
    --     "startup-nvim/startup.nvim",
    --     requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    --     load_file = true,
    -- },
    -- {
    --     -- dashboard
    --     "glepnir/dashboard-nvim",
    --     load_file = false,
    -- },
}

local ok, packer = pcall(require, "packer")
if not ok then
    print("Warn: tried to load packer, but failed")
else
    packer.startup(
        {
            function(use)
                for _, plugin in ipairs(install_plugins) do
                    if plugin.load_file then
                        local require_path
                        if plugin.as then
                            require_path = "conf/" .. plugin.as
                        else
                            -- require_path = "conf" .. string.match(plugin[1], "(/[%w-_]+).?")
                            require_path = "conf/" .. string.match(plugin[1], "/([%w-_]+).?")

                        end
                        plugin.config = "require('" .. require_path .. "')"
                    end
                    use(plugin)
                end
                if packer_bootstrap then
                    packer.sync()
                end
            end,
            config = {
                display = {
                    open_fn = require("packer.util").float
                }
            }
        }
    )
end


-- cmd to run PackerSync every time the file is save
vim.cmd(
    [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]
)
