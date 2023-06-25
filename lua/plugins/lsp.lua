return {
    -- Add clangd, intelephense to lspconfig
    {
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                clangd = {},
                intelephense = {},
                eslint = {},
            },
            setup = {
                -- Fix clangd buffer encoding
                clangd = function(_, opts)
                    opts.capabilities.offsetEncoding = { "utf-16" }
                end,

                -- Use eslint for formatting
                eslint = function()
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        callback = function(event)
                            local client = vim.lsp.get_active_clients({ bufnr = event.buf, name = "eslint" })[1]
                            if client then
                                local diag = vim.diagnostic.get(event.buf,
                                    { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
                                if #diag > 0 then
                                    vim.cmd("EslintFixAll")
                                end
                            end
                        end,
                    })
                    require("lazyvim.util").on_attach(function(client)
                        if client.name == "eslint" then
                            client.server_capabilities.documentFormattingProvider = true
                        elseif client.name == "tsserver" then
                            client.server_capabilities.documentFormattingProvider = false
                        end
                    end)
                end,
            },
            -- Disable autoformat on save
            autoformat = false,
        },
    },
}
