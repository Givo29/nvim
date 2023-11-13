local lsp_zero = require("lsp-zero")
local lspconfig = require("lspconfig")

lsp_zero.on_attach(function(_, bufnr)
  local keymap_opts = { buffer = bufnr, remap = false }
  lsp_zero.buffer_autoformat({ async = false, timeout_ms = 10000 })

  lsp_zero.default_keymaps(keymap_opts)

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
    vim.lsp.buf.format({
      async = false,
      timeout_ms = 10000,
    })
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
require("mason").setup()
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
    "prismals",
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
    -- Disable formatting for tsserver (null-ls handles it)
    tsserver = function()
      lspconfig.tsserver.setup({
        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
        end,
      })
    end,
    -- Custom settings for Python
    pylsp = function()
      lspconfig.pylsp.setup({
        settings = {
          pylsp = {
            plugins = {
              -- Linter options
              pylint = { enabled = true, executable = "pylint" },
              pycodestyle = { enabled = true, maxLineLength = 88 },
              pyflakes = { enabled = false },

              -- import sorting
              pyls_isort = { enabled = true },
            },
          },
        },
      })
    end,
    -- Custom settings for lua_ls
    lua_ls = function()
      lspconfig.lua_ls.setup({
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
  },
})

-- Setup null-ls for where mason-lspconfig fails
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
  },
})
