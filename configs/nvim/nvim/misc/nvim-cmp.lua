-- return {
--   {
--     "hrsh7th/nvim-cmp",
--     event = "InsertEnter", -- load only when entering insert mode
--     dependencies = {
--       -- completion sources
--       "hrsh7th/cmp-nvim-lsp",
--       "hrsh7th/cmp-buffer",
--       "hrsh7th/cmp-path",
--       "hrsh7th/cmp-cmdline",
-- 
--       -- snippet engine
--       "L3MON4D3/LuaSnip",
--       "saadparwaiz1/cmp_luasnip",
-- 
--       -- optional: nice icons in completion menu
--       "onsails/lspkind.nvim",
--     },
--     config = function()
--       local cmp = require("cmp")
--       local luasnip = require("luasnip")
-- 
--       -- load friendly-snippets or your own snippets if you want
--       require("luasnip.loaders.from_vscode").lazy_load()
-- 
--       cmp.setup({
--         snippet = {
--           expand = function(args)
--             luasnip.lsp_expand(args.body)
--           end,
--         },
-- 
--         mapping = cmp.mapping.preset.insert({
--           ["<C-Space>"] = cmp.mapping.complete(),
--           ["<CR>"] = cmp.mapping.confirm({ select = true }),
--           ["<C-e>"] = cmp.mapping.abort(),
-- 
--           ["<Tab>"] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--               cmp.select_next_item()
--             elseif luasnip.expand_or_jumpable() then
--               luasnip.expand_or_jump()
--             else
--               fallback()
--             end
--           end, { "i", "s" }),
-- 
--           ["<S-Tab>"] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--               cmp.select_prev_item()
--             elseif luasnip.jumpable(-1) then
--               luasnip.jump(-1)
--             else
--               fallback()
--             end
--           end, { "i", "s" }),
--         }),
-- 
--         sources = cmp.config.sources({
--           { name = "nvim_lsp" },
--           { name = "luasnip" },
--           { name = "path" },
--         }, {
--           { name = "buffer" },
--         }),
-- 
--         formatting = {
--           format = require("lspkind").cmp_format({
--             mode = "symbol_text",
--             maxwidth = 50,
--             ellipsis_char = "…",
--           }),
--         },
-- 
--         window = {
--           completion = cmp.config.window.bordered(),
--           documentation = cmp.config.window.bordered(),
--         },
-- 
--         experimental = {
--           ghost_text = true, -- inline suggestion
--         },
--       })
-- 
--       -- `/` and `?` in command line
--       cmp.setup.cmdline({ "/", "?" }, {
--         mapping = cmp.mapping.preset.cmdline(),
--         sources = {
--           { name = "buffer" },
--         },
--       })
-- 
--       -- `:` command line
--       cmp.setup.cmdline(":", {
--         mapping = cmp.mapping.preset.cmdline(),
--         sources = cmp.config.sources({
--           { name = "path" },
--         }, {
--           { name = "cmdline" },
--         }),
--       })
--     end,
--   },
-- }
-- 

return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        },
      })
    end,
  },
}

