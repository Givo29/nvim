-- Define nvim-lspconfig LSP servers here
local lsp_servers = { "ruff", "lua_ls", "tsserver", "tailwindcss", "emmet_ls", "bashls" }

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf, silent = true }

                -- set keybinds
                opts.desc = "Show LSP references"
                vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

                opts.desc = "LSP rename"
                vim.keymap.set("n", "gR", vim.lsp.buf.rename, opts)

                opts.desc = "Go to declaration"
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

                opts.desc = "Show LSP definitions"
                vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

                opts.desc = "Show LSP implementations"
                vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

                opts.desc = "Show LSP type definitions"
                vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

                opts.desc = "See available code actions"
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

                opts.desc = "Show documentation for what is under cursor"
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

                opts.desc = "Restart LSP"
                vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
            end,
        })

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.INFO]  = " ",
                    [vim.diagnostic.severity.HINT]  = "󰠠 ",
                    [vim.diagnostic.severity.WARN]  = " ",
                    [vim.diagnostic.severity.ERROR] = " ",
                }
            }
        })

        -- Set Mason LSPs Here
        mason_lspconfig.setup({
            ensure_installed = lsp_servers,
            automatic_installation = true,
            handlers = {
                -- default handler for installed servers
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
                ["ruff"] = function()
                    lspconfig["ruff"].setup({
                        init_options = {
                            settings = {
                                lint = {
                                    extendSelect = { "I", "W", "N", "B", "A", "Q", "C4" },
                                    ignore = { "W391" }
                                },
                            }
                        }
                    })
                end,
                ["emmet_ls"] = function()
                    -- configure emmet language server
                    lspconfig["emmet_ls"].setup({
                        capabilities = capabilities,
                        filetypes = {
                            "html",
                            "javascript",
                            "typescript",
                            "javascriptreact",
                            "typescriptreact",
                            "css",
                            "less",
                        },
                    })
                end,
                ["lua_ls"] = function()
                    -- configure lua server (with special settings)
                    lspconfig["lua_ls"].setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                -- make the language server recognize "vim" global
                                diagnostics = {
                                    globals = { "vim" },
                                },
                                completion = {
                                    callSnippet = "Replace",
                                },
                                workspace = {
                                    library = {
                                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                        [vim.fn.stdpath("config") .. "/lua"] = true,
                                    },
                                },
                            },
                        },
                    })
                end,
            },
        })
    end,

    vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = true,
            header = "",
            prefix = "",
        },
    }),
}
