--[[
 ________  ________  ________   ________ ___  ________
|\   ____\|\   __  \|\   ___  \|\  _____\\  \|\   ____\
\ \  \___|\ \  \|\  \ \  \\ \  \ \  \__/\ \  \ \  \___|
 \ \  \    \ \  \\\  \ \  \\ \  \ \   __\\ \  \ \  \  ___
  \ \  \____\ \  \\\  \ \  \\ \  \ \  \_| \ \  \ \  \|\  \
   \ \_______\ \_______\ \__\\ \__\ \__\   \ \__\ \_______\
    \|_______|\|_______|\|__| \|__|\|__|    \|__|\|_______|
]]
--

--[[ General Configuration ]]
vim.opt.number = true
vim.wo.relativenumber = true
vim.opt.termguicolors = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.mouse = ""
vim.opt.tabstop = 2
vim.opt.ignorecase = true
vim.opt["guicursor"] = ""

-- Highlight On Yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", {}),
  desc = "Hightlight selection on yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 40 })
  end,
})

-- Diagnostic settings
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = true,
})

--[[
 ________  _______   _____ ______   ________  ________
|\   __  \|\  ___ \ |\   _ \  _   \|\   __  \|\   __  \
\ \  \|\  \ \   __/|\ \  \\\__\ \  \ \  \|\  \ \  \|\  \
 \ \   _  _\ \  \_|/_\ \  \\|__| \  \ \   __  \ \   ____\
  \ \  \\  \\ \  \_|\ \ \  \    \ \  \ \  \ \  \ \  \___|
   \ \__\\ _\\ \_______\ \__\    \ \__\ \__\ \__\ \__\
    \|__|\|__|\|_______|\|__|     \|__|\|__|\|__|\|__|
]]
--

--[[ General Remap ]]
vim.g.mapleader = " "

-- Exit File
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- In visual mode, move selected line up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Move previous line to end of current line
vim.keymap.set("n", "J", "mzJ`z")

-- Page up/down keeping cursor in middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor in middle when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Preserve yank buffer when pasting over text
vim.keymap.set("x", "<leader>p", [["_dp]])

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- Make current file executable
vim.keymap.set("n", "<leader>x", ":!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)
