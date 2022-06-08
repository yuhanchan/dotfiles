-- https://github.com/williamboman/nvim-lsp-installer

local ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not ok then
    print("Warn: tried to load nvim-lsp-installer, but failed")
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

local ok, lsp_installer_servers = pcall(require, "nvim-lsp-installer.servers")
if not ok then
    print("Warn: tried to load nvim-lsp-installer.servers, but failed")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok then
    print("Warn: tried to load cmp_nvim_lsp, but failed")
else
    capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
    -- capabilities.offsetEncoding = "utf-8"
end

local function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec(
            [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]       ,
            false
        )
    end
end

-- local function lsp_keymaps(bufnr)
--   local opts = { noremap = true, silent = true }
--   vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
--   vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
--   vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
--   vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
--   vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
--   -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
--   vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
--   -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
--   -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
--   vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
--   vim.api.nvim_buf_set_keymap(
--     bufnr,
--     "n",
--     "gl",
--     '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>',
--     opts
--   )
--   vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
--   vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
-- end

local ok, lsp_keymaps_ = pcall(require, "conf.lsp_keymaps")
if not ok then
    print("Warn: tried to load lsp_keymaps, but failed")
    return
end

local on_attach = function(client, bufnr)
    lsp_keymaps_.lsp_on_attach(client, bufnr)
    -- lsp_highlight_document(client)
    -- require "lsp-format".on_attach(client)
    -- client.offset_encoding = "utf-8"
end

local servers = {
    'sumneko_lua',
    'pyright',
    'html',
    'jsonls',
    'awk_ls',
    'bashls',
    'ccls',
    'cmake',
    'gopls',
    'julials',
    'zeta_note',
    'yamlls',
    -- 'efm',
}

for _, server_name in pairs(servers) do
    local server_available, server = lsp_installer_servers.get_server(server_name)
    if server_available then
        server:on_ready(function()
            -- When this particular server is ready (i.e. when installation is finished or the server is already installed),
            -- this function will be invoked. Make sure not to also use the "catch-all" lsp_installer.on_server_ready()
            -- function to set up your servers, because by doing so you'd be setting up the same server twice.
            local opts = {
                on_attach = on_attach,
                capabilities = capabilities,
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
            server:setup(opts)
        end)
        if not server:is_installed() then
            -- Queue the server to be installed.
            print("Installing " .. server_name)
            server:install()
        end
    end
end
