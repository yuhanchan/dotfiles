local ok, null_ls = pcall(require, "null-ls")
if not ok then
    print("Warn: tried to load null-ls, but failed")
else
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup(
        {
        -- the binary executable of these tools must be installed to work
        -- checkout https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md for more info
        sources = {
            -- for code linting
            null_ls.builtins.completion.spell,
            null_ls.builtins.completion.luasnip,
            null_ls.builtins.diagnostics.cppcheck,
            -- null_ls.builtins.diagnostics.flake8,
            -- null_ls.builtins.diagnostics.jsonlint,

            -- for formatting
            -- null_ls.builtins.formatting.stylua, -- lua
            null_ls.builtins.formatting.black, -- python
            null_ls.builtins.formatting.clang_format, -- c, cpp, cuda
            -- null_ls.builtins.formatting.cmake_format, -- cmake
            -- null_ls.builtins.diagnostics.eslint, -- javascript
            -- null_ls.builtins.formatting.fixjson, -- json
            -- null_ls.builtins.formatting.gofmt, -- go
        },

        -- setup autocommand for formatting before saving
        on_attach = function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup,
                    buffer = bufnr,
                    callback = function()
                        -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                        vim.lsp.buf.formatting_sync()
                    end,
                })
            end
        end,

    }
    )
end
