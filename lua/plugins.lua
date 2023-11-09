return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  use({
    "goolord/alpha-nvim",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.buttons.val = {
        dashboard.button("<space>", "Find Files", ":Telescope find_files<CR>"),
        dashboard.button("?", "Learn Base", ":e init.lua<CR>"),
      }

      alpha.setup(dashboard.opts)
    end,
  })

  use({
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })

  use({
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup({
        icons = false,
      })
    end,
  })

  use({
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      require("toggleterm").setup()
    end,
  })

  use({
    "theprimeagen/harpoon",
  })
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use({
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { "WhoIsSethDaniel/mason-tool-installer.nvim" },
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    }
  })
  -- Colorscheme
  use({ "folke/tokyonight.nvim" })
end)
