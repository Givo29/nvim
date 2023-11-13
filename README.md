# NVIM

<a href="https://dotfyle.com/Givo29/nvim"><img src="https://dotfyle.com/Givo29/nvim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/Givo29/nvim"><img src="https://dotfyle.com/Givo29/nvim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/Givo29/nvim"><img src="https://dotfyle.com/Givo29/nvim/badges/plugin-manager?style=flat" /></a>

My neovim configuration that I use daily (mainly for web development and general scripting).  
This config includes tools I use often that improve my workflow and aims to be as extendable as possible.

## Install Instructions

> Install requires Neovim 0.9+. Always review the code before installing a configuration.

### Prerequisites

**General Prerequisites:**

- [packer](https://github.com/wbthomason/packer.nvim#quickstart)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [Mason Requirements](https://github.com/williamboman/mason.nvim#requirements)

**LSP Prerequisites:**

- [npm](https://www.npmjs.com/package/npm)
- [python-venv](https://virtualenv.pypa.io/en/latest/installation.html)
- [prettierd](https://www.npmjs.com/package/@fsouza/prettierd#installation-guide)

### Install

Clone the repository and install the plugins:

```sh
git clone https://github.com/Givo29/nvim ~/.config/nvim
nvim --headless +"PackerSync" +qa
```

Open Neovim with this config:

```sh
nvim
```

## Layout

- Lua
  - options.lua
    General neovim options / keymaps
  - plugins.lua
    Plugin manager (packer)
- plugin
  - Files containing options / keymaps for specific plugins
- ftplugin
  - Files containing overrides to default tab width

## Plugins

### colorscheme

- [folke/tokyonight.nvim](https://dotfyle.com/plugins/folke/tokyonight.nvim)

### completion

- [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)

### diagnostics

- [folke/trouble.nvim](https://dotfyle.com/plugins/folke/trouble.nvim)

### fuzzy-finder

- [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)

### lsp

- [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
- [VonHeikemen/lsp-zero.nvim](https://dotfyle.com/plugins/VonHeikemen/lsp-zero.nvim)
- [nvimtools/none-ls.nvim](https://github.com/nvimtools/none-ls.nvim)

### lsp-installer

- [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)

### nvim-dev

- [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)

### plugin-manager

- [wbthomason/packer.nvim](https://dotfyle.com/plugins/wbthomason/packer.nvim)

### snippet

- [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)

### startup

- [goolord/alpha-nvim](https://dotfyle.com/plugins/goolord/alpha-nvim)

### syntax

- [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)

## Language Servers

- ansiblels
- astro
- bashls
- cssls
- docker_compose_language_service
- dockerls
- html
- jsonls
- lua_ls
- prismals
- pylsp
- pyright
- rust_analyzer
- sqlls
- tailwindcss
- tsserver
- yamlls

## Keymaps

### General

- Leader key: \<space>

| Mode | Keystroke          | Action                                               |
| ---- | ------------------ | ---------------------------------------------------- |
| v    | K                  | Move selected line up                                |
| v    | J                  | Move selected line down                              |
| n    | J                  | Move below line to end of current line               |
| x    | \<leader>p         | Preserve yank buffer when pasting over selected text |
| n, v | \<leader>y         | Yank to system clipboard                             |
| n    | \<leader>x         | Make current file executable                         |
| n    | \<leader>\<leader> | vim source file                                      |

### Cmp (Autocomplete)

| Keystroke | Action        |
| --------- | ------------- |
| \<ctrl>p  | Previous item |
| \<ctrl>n  | Next item     |
| \<ctrl>y  | Confirm item  |

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

| Mode | Keystroke | Action                |
| ---- | --------- | --------------------- |
| n    | gd        | Go to definition      |
| n    | gD        | Go to declaration     |
| n    | gt        | Go to type definition |
| n    | gq        | Format file           |

### Telescope

| Mode | Keystroke   | Action                           |
| ---- | ----------- | -------------------------------- |
| n    | \<leader>pf | Find file in all project files   |
| n    | \<ctrl>p    | Find file in git files           |
| n    | \<leader>ps | Grep string within project files |
| n    | \<leader>vh | Help tags                        |

### ToggleTerm

| Mode | Keystroke | Action          |
| ---- | --------- | --------------- |
| a    | \<ctrl>\  | Toggle Terminal |

### Trouble

| Mode | Keystroke  | Action                |
| ---- | ---------- | --------------------- |
| n    | \<leader>t | Toggle trouble window |
