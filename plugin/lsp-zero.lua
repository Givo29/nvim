local lsp_zero = require("lsp-zero")
local lspconfig = require("lspconfig")

local cmp_nvim_lsp = require("cmp_nvim_lsp")
lsp_zero.on_attach(function(client, bufnr)
  local keymap_opts = { buffer = bufnr }

  lsp_zero.default_keymaps(keymap_opts)
  lsp_zero.buffer_autoformat({ async = false, timeout_ms = 10000 })

  vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
  end, keymap_opts)

  vim.keymap.set("n", "gD", function()
    vim.lsp.buf.declaration()
  end, keymap_opts)

  vim.keymap.set("n", "gt", function()
    vim.lsp.buf.type_definition()
  end, keymap_opts)

  vim.keymap.set("n", "gq", function()
    vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
  end, keymap_opts)
end)

-- Custom icons
lsp_zero.set_sign_icons({
  error = "✘",
  warn = "▲",
  hint = "⚑",
  info = "»",
})

lsp_zero.setup()

-- Set up LSPs
require("mason").setup({})
-- Extra mason tools
require("mason-tool-installer").setup({
  ensure_installed = {
    "prettier",
    "prettierd",
  },
  auto_update = true,
  run_on_start = true,
  debounce_hours = 5
})
-- Main LSPs
require("mason-lspconfig").setup({
  ensure_installed = {
    "ansiblels",
    "astro",
    "bashls",
    "cssls",
    "docker_compose_language_service",
    "dockerls",
    "html",
    "jsonls",
    "lua_ls",
    "pylsp",
    "pyright",
    "rust_analyzer",
    "sqlls",
    "tailwindcss",
    "tsserver",
    "yamlls"
  },
  handlers = {
    lsp_zero.default_setup,
    -- Custom settings for lua
    lua_ls = function()
      lspconfig["lua_ls"].setup({
        settings = {
          Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              -- make language server aware of runtime files
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      })
    end,
    -- Custom settings for python
    pylsp = function()
      require("lspconfig").pylsp.setup({
        settings = {
          pylsp = {
            plugins = {
              -- Formatter options
              autopep8 = { enabled = false },
              yapf = { enabled = false },
              black = { enabled = true },

              -- Linter options
              pylint = { enabled = true, executable = "pylint" },
              pyflakes = { enabled = false },
              pycodestyle = { enabled = false },

              -- import sorting
              pyls_isort = { enabled = true },
            }
          }
        },
      })
    end,
  },
})
