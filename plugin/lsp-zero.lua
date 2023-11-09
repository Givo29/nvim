local lsp_zero = require("lsp-zero")
local lspconfig = require("lspconfig")

local cmp_nvim_lsp = require("cmp_nvim_lsp")
lsp_zero.on_attach(function(client, bufnr)
  local keymap_opts = { buffer = bufnr }

  lsp_zero.default_keymaps(keymap_opts)
  lsp_zero.buffer_autoformat()

  vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
  end, keymap_opts)

  vim.keymap.set("n", "gD", function()
    vim.lsp.buf.declaration()
  end, keymap_opts)

  vim.keymap.set("n", "gt", function()
    vim.lsp.buf.type_definition()
  end, keymap_opts)
end)

-- Custom icons
lsp_zero.set_sign_icons({
  error = "✘",
  warn = "▲",
  hint = "⚑",
  info = "»",
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = true,
})


-- Set up LSPs
require("mason").setup({})
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
    "pyright",
    "rust_analyzer",
    "sqlls",
    "tailwindcss",
    "tsserver",
    "yamlls"
  },
  handlers = {
    lsp_zero.default_setup,
  },
})
-- Setup LSP Tools (mostly auto formatters)
require("mason-tool-installer").setup({
  ensure_installed = {
    "black",
    "prettier",
    "prettierd",
    "stylua",
  },
  auto_update = true,
  run_on_start = true,
  debounce_hours = 5,
  handlers = {
    lsp_zero.default_setup,
  }
})


-- Custom LSP configs
local capabilities = cmp_nvim_lsp.default_capabilities()
lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  settings = { -- custom settings for lua
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
