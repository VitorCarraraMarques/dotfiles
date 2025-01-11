local enable = true;

if not enable then
    return {}
else
    return {
        {
            "williamboman/mason.nvim",
            config = function()
                require("mason").setup()
            end,
        },
        {
            "williamboman/mason-lspconfig.nvim",
            config = function()
                require("mason-lspconfig").setup({
                    ensure_installed = {
                        "lua_ls",
                        "pyright",
                        "html",
                        "gopls",
                        "templ",
                        "jsonls",
                        "cssls",
                        "tailwindcss",
                        "ts_ls",
                        "clangd",
                        "htmx",
                    },
                })
            end,
        },
        {
            "neovim/nvim-lspconfig",
            lazy = false,
            config = function()
                local capabilities = require("cmp_nvim_lsp").default_capabilities()

                local lspconfig = require("lspconfig")
                lspconfig.lua_ls.setup({
                    capabilities = capabilities,
                })
                lspconfig.pyright.setup({
                    capabilities = capabilities,
                })
                lspconfig.html.setup({
                    capabilities = capabilities,
                })
                lspconfig.gopls.setup({
                    capabilities = capabilities,
                })
                lspconfig.templ.setup({
                    capabilities = capabilities,
                })
                lspconfig.emmet_language_server.setup({
                    capabilities = capabilities,
                })
                lspconfig.jsonls.setup({
                    capabilities = capabilities,
                })
                lspconfig.cssls.setup({
                    capabilities = capabilities,
                })
                lspconfig.tailwindcss.setup({
                    capabilities = capabilities,
                })
                lspconfig.ts_ls.setup({
                    capabilities = capabilities,
                })
                lspconfig.clangd.setup({
                    capabilities = capabilities,
                })
                lspconfig.htmx.setup({
                    capabilities = capabilities,
                })

                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
                vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            end,
        },
    }
end
