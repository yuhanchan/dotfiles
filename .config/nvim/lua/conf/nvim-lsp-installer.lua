-- https://github.com/williamboman/nvim-lsp-installer

local lsp_installer = require("nvim-lsp-installer")

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

local lsp_installer_servers = require("nvim-lsp-installer.servers")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local servers = {
    "sumneko_lua",
    "jedi_language_server",
    "html",
    "jsonls",
}

for _, server_name in pairs(servers) do
    local server_available, server = lsp_installer_servers.get_server(server_name)
    if server_available then
        server:on_ready(function ()
            -- When this particular server is ready (i.e. when installation is finished or the server is already installed),
            -- this function will be invoked. Make sure not to also use the "catch-all" lsp_installer.on_server_ready()
            -- function to set up your servers, because by doing so you'd be setting up the same server twice.
            local opts = {}
            server:setup(opts)
        end)
        if not server:is_installed() then
            -- Queue the server to be installed.
            print("Installing " .. server_name)
            server:install()
        end
    end
end