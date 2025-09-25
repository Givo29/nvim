return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
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

		-- Used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Configure LSPs
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					workspace = {
						checkThirdParty = false,
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
		vim.lsp.config("ruff", {
			capabilities = capabilities,
			init_options = {
				settings = {
					lint = {
						extendSelect = { "I", "W", "N", "B", "A", "Q", "C4" },
						ignore = { "W391" },
					},
				},
			},
		})
		vim.lsp.config("ts_ls", {
			capabilities = capabilities,
		})
		vim.lsp.config("oxlint", {
			capabilities = capabilities,
		})
		vim.lsp.config("tailwindcss", {
			capabilities = capabilities,
		})
		vim.lsp.config("bashls", {
			capabilities = capabilities,
		})
		vim.lsp.config("astro", {
			capabilities = capabilities,
		})
		vim.lsp.config("gopls", {
			capabilities = capabilities,
		})

		-- Enable configs
		vim.lsp.enable("lua_ls")
		vim.lsp.enable("ruff")
		vim.lsp.enable("ts_ls")
		vim.lsp.enable("oxlint")
		vim.lsp.enable("tailwindcss")
		vim.lsp.enable("bashls")
		vim.lsp.enable("astro")
		vim.lsp.enable("gopls")
	end,
}
