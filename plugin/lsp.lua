local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

local format_servers =
	{ "lua", "javascript", "typescript", "javascriptreact", "typescriptreact", "rust", "shell", "python" }
lsp.format_mapping("<leader>f", {
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		["null-ls"] = format_servers,
	},
})
lsp.format_on_save({
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		["null-ls"] = format_servers,
	},
})

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	float = true,
})

require("mason").setup()
require("mason-null-ls").setup({
	ensure_installed = {
    "black",
		"stylua",
		"prettierd",
		"autoflake",
		"astro-language-server",
		"isort",
		"prettier",
		"shfmt",
		"shellcheck",
		"write-good",
		"prisma-language-server",
		"flake8",
	},
	automatic_installation = false,
	handlers = {},
})
require("null-ls").setup({
	sources = {},
})
