local cmp = require("cmp")
local luasnip = require("luasnip")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  completion = {
    completeopt = "menu,menuone,preview,noselect",
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<Tab>"] = nil,
    ["<S-Tab"] = nil,
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "buffer" },  -- text within current buffer
    { name = "luasnip" }, -- snippets
    { name = "path" },    -- file system paths
  }),
})
