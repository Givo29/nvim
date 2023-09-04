local lsp = require("lsp-zero").preset({})

-- General Lsp Keymaps
lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "<leader>gd", function()
		vim.lsp.buf.definition()
	end, opts)

	vim.keymap.set("n", "<leader>gD", function()
		vim.lsp.buf.declaration()
	end, opts)

	vim.keymap.set("n", "<leader>gt", function()
		vim.lsp.buf.type_definition()
	end, opts)

	vim.keymap.set("n", "<leader>grn", function()
		vim.lsp.buf.rename()
	end, opts)
end)

-- Automatic Formatting
local format_options = {
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		["null-ls"] = {
			"lua",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"rust",
			"shell",
			"python",
		},
	},
}
lsp.format_mapping("<leader>f", format_options)
lsp.format_on_save(format_options)

-- Autocomplete settings
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
lsp.setup_nvim_cmp({
	mapping = lsp.defaults.cmp_mappings({
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
		["<Tab>"] = nil,
		["<S-Tab"] = nil,
	}),
})

-- Custom Lsp Icons
lsp.set_sign_icons({
	error = "✘",
	warn = "▲",
	hint = "⚑",
	info = "»",
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

-- Mason / Null-ls Setup
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
