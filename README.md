# nvim/

<a href="https://dotfyle.com/Givo29/nvim"><img src="https://dotfyle.com/Givo29/nvim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/Givo29/nvim"><img src="https://dotfyle.com/Givo29/nvim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/Givo29/nvim"><img src="https://dotfyle.com/Givo29/nvim/badges/plugin-manager?style=flat" /></a>

## Installation

### General Dependencies

- Neovim 0.9+
- [RipGrep](https://github.com/BurntSushi/ripgrep)

### LSP/Formatting/Linting Dependencies

> Optional dependencies based on your preferred LSPs and what [Mason](https://github.com/williamboman/mason.nvim) is installing.

- [NodeJS](https://nodejs.org/en)
- Python 3.x Virtual Environment

### Instructions

> Install requires Neovim 0.9+. Always review the code before installing a configuration.

1. Clone the repository and install the plugins:

```sh
git clone git@github.com:Givo29/nvim ~/.config/nvim
```

2. Open Neovim

## Layout

- Lua
  - config/init.lua: General configuration and settings
  - config/lazy.lua: Lazy.nvim setup
  - plugins/\*: Plugin specific configuration

## Plugins

### colorscheme

- [bluz71/vim-nightfly-colors](https://dotfyle.com/plugins/bluz71/vim-nightfly-colors)

### completion

- [zbirenbaum/copilot.lua](https://github.com/zbirenbaum/copilot.lua)
- [zbirenbaum/copilot-cmp](https://github.com/zbirenbaum/copilot-cmp)
- [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)

### diagnostics

- [folke/trouble.nvim](https://dotfyle.com/plugins/folke/trouble.nvim)

### formatting

- [stevearc/conform.nvim](https://dotfyle.com/plugins/stevearc/conform.nvim)

### fuzzy-finder

- [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)

### lsp

- [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
- [mfussenegger/nvim-lint](https://dotfyle.com/plugins/mfussenegger/nvim-lint)

### lsp-installer

- [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)

### marks

- [ThePrimeagen/harpoon](https://dotfyle.com/plugins/ThePrimeagen/harpoon)

### nvim-dev

- [folke/neodev.nvim](https://dotfyle.com/plugins/folke/neodev.nvim)
- [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)

### plugin-manager

- [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)

### snippet

- [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)
- [rafamadriz/friendly-snippets](https://dotfyle.com/plugins/rafamadriz/friendly-snippets)

### syntax

- [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)

### terminal-integration

- [akinsho/toggleterm.nvim](https://dotfyle.com/plugins/akinsho/toggleterm.nvim)

### utility

- [zapling/mason-conform.nvim](https://dotfyle.com/plugins/zapling/mason-conform.nvim)

## Language Servers

- bashls
- emmet_ls
- html
- lua_ls
- pylsp
- tailwindcss
- tsserver

## Keymaps

### General

- Leader: \<space>

| Mode | Keystroke  | Action                                               |
| ---- | ---------- | ---------------------------------------------------- |
| v    | K          | Move selected line up                                |
| v    | J          | Move selected line down                              |
| n    | J          | Move below line to end of current line               |
| x    | \<leader>p | Preserve yank buffer when pasting over selected text |
| n, v | \<leader>y | Yank to system clipboard                             |

### Harpoon

| Mode | Keystroke  | Action                     |
| ---- | ---------- | -------------------------- |
| n    | \<leader>a | Add file to harpoon buffer |
| n    | \<ctrl>e   | Toggle quick menu          |
| n    | \<ctrl>h   | Select file 1              |
| n    | \<ctrl>j   | Select file 2              |
| n    | \<ctrl>k   | Select file 3              |
| n    | \<ctrl>l   | Select file 4              |

### LSP

| Mode | Keystroke   | Action                |
| ---- | ----------- | --------------------- |
| n    | gr          | Find references       |
| n    | gR          | Rename object         |
| n    | gD          | Go to declaration     |
| n    | gd          | Go to definition      |
| n    | gi          | Show implementation   |
| n    | gt          | Go to type definition |
| n, v | ga          | Show code actions     |
| n    | K           | Show documentation    |
| n    | \<leader>rs | Restart LSP client    |

### Formatting

| Mode | Keystroke | Action                   |
| ---- | --------- | ------------------------ |
| n    | gq        | Format current file      |
| v    | gq        | Format current selection |

### Cmp (Autocomplete)

| Mode | Keystroke  | Action                         |
| ---- | ---------- | ------------------------------ |
| i    | \<C-Space> | Show autocomplete suggestions  |
| i    | \<C-e>     | Close autocomplete suggestions |
| i    | \<CR>      | Accept selected suggestion     |
| i    | \<C-k>     | Previous suggestion            |
| i    | \<C-j>     | Next suggestion                |
| i    | \<C-b>     | Scroll docs up                 |
| i    | \<C-f>     | Scroll docs down               |

### ToggleTerm

| Mode | Keystroke | Action          |
| ---- | --------- | --------------- |
| a    | \<ctrl>\  | Toggle Terminal |

### Trouble

| Mode | Keystroke   | Action                     |
| ---- | ----------- | -------------------------- |
| n    | \<leader>t  | Toggle for current buffer  |
| n    | \<leader>R  | Toggle for current project |
| n    | \<leader>ts | Toggle trouble symbols     |
| n    | \<leader>tq | Toggle quick fix list      |

This readme was generated by [Dotfyle](https://dotfyle.com)
