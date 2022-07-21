-- https://github.com/williamboman/nvim-lsp-installer
local ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not ok then
    print("Warn: tried to load nvim-lsp-installer, but failed")
    -- vim.notify("nvim-lspconfig not found!")
    return
end

lsp_installer.settings({
    ui = {
        icons = {
            -- The list icon to use for installed servers.
            server_installed = "✓",
            -- The list icon to use for servers that are pending installation.
            server_pending = "➜",
            -- The list icon to use for servers that are not installed.
            server_uninstalled = "◍",
        },
        keymaps = {
            -- Keymap to expand a server in the UI
            toggle_server_expand = "<CR>",
            -- Keymap to install a server
            install_server = "i",
            -- Keymap to reinstall/update a server
            update_server = "u",
            -- Keymap to update all installed servers
            update_all_servers = "U",
            -- Keymap to uninstall a server
            uninstall_server = "X",
        },
    },

    -- The directory in which to install all servers.
    -- install_root_dir = path.concat { vim.fn.stdpath "data", "lsp_servers" },

    pip = {
        -- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
        -- and is not recommended.
        --
        -- Example: { "--proxy", "https://proxyserver" }
        install_args = {},
    },

    -- Controls to which degree logs are written to the log file. It's useful to set this to vim.log.levels.DEBUG when
    -- debugging issues with server installations.
    log_level = vim.log.levels.INFO,

    -- Limit for the maximum amount of servers to be installed at the same time. Once this limit is reached, any further
    -- servers that are requested to be installed will be put in a queue.
    max_concurrent_installers = 4,
})

lsp_installer.setup({})


local ok, lsp_installer_servers = pcall(require, "nvim-lsp-installer.servers")
if not ok then
    print("Warn: tried to load nvim-lsp-installer.servers, but failed")
end

local servers = {
    'sumneko_lua',
    'pyright',
    -- 'html',
    'jsonls',
    'awk_ls',
    'bashls',
    'ccls',
    -- 'clangd',
    'cmake',
    -- 'gopls',
    'julials',
    'prosemd_lsp',
    'yamlls',
    -- 'efm',
}

local notify_ok, notify = pcall(require, "notify")

for _, server_name in pairs(servers) do
    local server_available, server = lsp_installer_servers.get_server(server_name)
    if server_available then
        server:on_ready(function()
            -- When this particular server is ready (i.e. when installation is finished or the server is already installed),
            -- this function will be invoked. Make sure not to also use the "catch-all" lsp_installer.on_server_ready()
            -- function to set up your servers, because by doing so you'd be setting up the same server twice.
            local opts = {
                on_attach = require("lsp.handlers").on_attach,
                capabilities = require("lsp.handlers").capabilities,
                flags = {
                    debounce_text_changes = 150,
                }
            }
            if server_name == "jsonls" then
                local jsonls_opts = require("lsp.settings.jsonls")
                opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
            end

            if server_name == "sumneko_lua" then
                local sumneko_opts = require("lsp.settings.sumneko_lua")
                opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
            end

            if server_name == "pyright" then
                local pyright_opts = require("lsp.settings.pyright")
                opts = vim.tbl_deep_extend("force", pyright_opts, opts)
            end

            -- if server_name == "html" then
            --     local html_opts = require("lsp.settings.html")
            --     opts = vim.tbl_deep_extend("force", html_opts, opts)
            -- end

            -- if server_name == "awk_ls" then
            --     local awk_ls_opts = require("lsp.settings.awk_ls")
            --     opts = vim.tbl_deep_extend("force", awk_ls_opts, opts)
            -- end

            -- if server_name == "bashls" then
            --     local bashls_opts = require("lsp.settings.bashls")
            --     opts = vim.tbl_deep_extend("force", bashls_opts, opts)
            -- end

            -- if server_name == "ccls" then
            --     local ccls_opts = require("lsp.settings.ccls")
            --     opts = vim.tbl_deep_extend("force", ccls_opts, opts)
            -- end

            -- if server_name == "cmake" then
            --     local cmake_opts = require("lsp.settings.cmake")
            --     opts = vim.tbl_deep_extend("force", cmake_opts, opts)
            -- end

            -- if server_name == "gopls" then
            --     local gopls_opts = require("lsp.settings.gopls")
            --     opts = vim.tbl_deep_extend("force", gopls_opts, opts)
            -- end

            -- if server_name == "julials" then
            --     local julials_opts = require("lsp.settings.julials")
            --     opts = vim.tbl_deep_extend("force", julials_opts, opts)
            -- end

            -- if server_name == "zeta_note" then
            --     local zeta_note_opts = require("lsp.settings.zeta_note")
            --     opts = vim.tbl_deep_extend("force", zeta_note_opts, opts)
            -- end

            -- if server_name == "yamlls" then
            --     local yamlls_opts = require("lsp.settings.yamlls")
            --     opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
            -- end

            if notify_ok then
                notify(server_name .. " started", "info", {
                    title = "LSP Installer",
                    timeout = 2000,
                    render = "default",
                })
            else
                print("Installed " .. server_name)
            end

            -- server:setup(opts) -- this is deprecated
            require("lspconfig")[server_name].setup(opts)
        end)
        if not server:is_installed() then
            -- Queue the server to be installed.
            if notify_ok then
                notify("Installing " .. server_name, "warn", {
                    title = "LSP Installer",
                    timeout = 2000,
                    render = "default",
                })
            else
                print("Installing " .. server_name)
            end
            server:install()
        end
    end
end
