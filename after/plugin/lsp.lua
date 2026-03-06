-- lsp.lua
-- Full LSP + Blink + nvim-cmp + conform integration
-- Assumes nvim-cmp and conform are configured separately

-- =====================
-- Blink.nvim (inlay hints)
-- =====================
local blink_ok, blink = pcall(require, "blink.cmp")
if not blink_ok then return end

local function attach_blink(client, bufnr)
   if client.server_capabilities.inlayHintProvider then
      blink.on_attach(client, bufnr)
   end
end

local capabilities = blink.get_lsp_capabilities()

-- =====================
-- LSP servers
-- =====================
local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then return end

-- Common on_attach for all servers
local function common_on_attach(client, bufnr)
   attach_blink(client, bufnr)
   vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

   -- Lua formatting on save
   if vim.bo.filetype == "lua" then
      vim.api.nvim_create_autocmd("BufWritePre", {
         buffer = bufnr,
         callback = function()
            vim.lsp.buf.format({ bufnr = bufnr, id = client.id })
         end,
      })
   end

   -- PHP / Blade formatting with fallback to conform.nvim
   if vim.bo.filetype == "php" or vim.bo.filetype == "blade" then
      vim.api.nvim_create_autocmd("BufWritePre", {
         buffer = bufnr,
         callback = function()
            local ok, _ = pcall(vim.lsp.buf.format)
            if not ok then
               local conform_ok, conform = pcall(require, "conform")
               if conform_ok then
                  conform.format({ async = false })
               end
            end
         end,
      })
   end
end

-- =====================
-- Lua LSP
-- =====================
lspconfig.lua_ls.setup({
   capabilities = capabilities,
   on_attach = common_on_attach,
})

-- =====================
-- TypeScript / JavaScript
-- =====================
lspconfig.tsserver.setup({
   capabilities = capabilities,
   on_attach = common_on_attach,
})

lspconfig.eslint.setup({
   capabilities = capabilities,
   on_attach = common_on_attach,
})

-- =====================
-- PHP LSP (Intelephense)
-- =====================
lspconfig.intelephense.setup({
   capabilities = capabilities,
   on_attach = common_on_attach,
   filetypes = { "php", "blade" },
})

-- =====================
-- HTML / JSON
-- =====================
lspconfig.html.setup({
   capabilities = capabilities,
   on_attach = common_on_attach,
})

lspconfig.jsonls.setup({
   capabilities = capabilities,
   on_attach = common_on_attach,
})
