# NVIM
My neovim configuration that I use daily (mainly for web development and general scripting).  
This config includes tools I use often that improve my workflow and aims to be as extendable as possible.
## Installation
### Prerequisites
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [npm](https://www.npmjs.com/package/npm)
- [python-venv](https://packaging.python.org/en/latest/guides/installing-using-pip-and-virtual-environments/#installing-virtualenv)
- [Mason Requirements](https://github.com/williamboman/mason.nvim#requirements)
### Setup
1. [Install Packer](https://github.com/wbthomason/packer.nvim#quickstart)
2. `git clone https://github.com/Givo29/nvim.git ~/.config/nvim`
3. `cd ~/.config/nvim && nvim lua/plugins.lua`
```
:PackerSync
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
## Key Plugins/Features
- [lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim) set up with [mason](https://github.com/williamboman/mason.nvim.git) and [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim.git) (with autoformatting and autocomplete)
- [telescope](https://github.com/nvim-telescope/telescope.nvim) for fuzzy searching
- [harpoon](https://github.com/ThePrimeagen/harpoon) for fast file switching
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for syntax highlighting
