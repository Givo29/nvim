require("nvim-treesitter.configs").setup({
	ensure_installed = { "javascript", "typescript", "python", "lua", "rust" },
	sync_install = false,
	auto_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
