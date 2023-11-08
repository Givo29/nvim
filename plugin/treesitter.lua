require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"javascript",
		"typescript",
		"python",
		"lua",
		"rust",
		"prisma",
		"json",
		"tsx",
		"bash",
		"dockerfile",
		"gitignore",
		"yaml",
		"sql",
	},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
})
