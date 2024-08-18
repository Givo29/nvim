require("config.lazy")

vim.opt.number = true
vim.wo.relativenumber = true
vim.opt.termguicolors = true
vim.opt.mouse = ""
vim.opt.ignorecase = true
vim.opt["guicursor"] = ""
vim.opt.signcolumn = "yes"

-- Fixing Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = -1
vim.opt.smarttab = true

-- Highlight On Yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", {}),
    desc = "Hightlight selection on yank",
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 40 })
    end,
})

-- Exit File
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move line up/down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in middle when paging up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor in middle when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Preserve yank buffer when pasting over text
vim.keymap.set("x", "<leader>p", [["_dp]])

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
