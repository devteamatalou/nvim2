-- cmp.lua
-- Neovim completion setup with nvim-cmp + LuaSnip + LSP

local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then return end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then return end

-- Load friendly snippets
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
   snippet = {
      expand = function(args)
         luasnip.lsp_expand(args.body)
      end,
   },
   mapping = cmp.mapping.preset.insert({
      ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),

      -- Tab / Shift-Tab behavior for snippets and completion
      ["<Tab>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_next_item()
         elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
         else
            fallback()
         end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_prev_item()
         elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
         else
            fallback()
         end
      end, { "i", "s" }),
   }),
   sources = cmp.config.sources({
      { name = "nvim_lsp" },   -- LSP completions
      { name = "luasnip" },    -- Snippets
      { name = "buffer" },     -- Buffer words
      { name = "path" },       -- File system paths
   }),
   completion = {
      completeopt = "menu,menuone,noinsert",
   },
   experimental = {
      ghost_text = true,   -- show inline preview like VSCode
   },
})
