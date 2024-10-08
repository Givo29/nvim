-- Define conform.nvim formatting servers here
local formatting_servers = { "ruff", "prettierd", "codespell" }

return {
    "stevearc/conform.nvim",
    dependencies = { "zapling/mason-conform.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")
        require("mason-conform").setup({
            ensure_installed = formatting_servers,
            automatic_installation = false,
        })

        conform.setup({
            formatters_by_ft = {
                javascript = { "prettierd", "prettier", stop_after_first = true },
                typescript = { "prettierd", "prettier", stop_after_first = true },
                javascriptreact = { "prettierd", "prettier", stop_after_first = true },
                typescriptreact = { "prettierd", "prettier", stop_after_first = true },
                css = { "prettierd", "prettier", stop_after_first = true },
                html = { "prettierd", "prettier", stop_after_first = true },
                json = { "prettierd", "prettier", stop_after_first = true },
                yaml = { "prettierd", "prettier", stop_after_first = true },
                markdown = { "prettierd", "prettier", stop_after_first = true },
                python = { "ruff_organize_imports", "ruff_format" },
                ["*"] = { "codespell" },
                ["_"] = { "trim_whitespace" },
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            },
        })

        vim.keymap.set({ "n", "v" }, "gq", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            })
        end, { desc = "Format file or range (in visual mode)" })
    end,
}
