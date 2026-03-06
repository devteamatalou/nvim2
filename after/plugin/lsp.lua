-- blink.nvim LSP integration
local blink_status, blink = pcall(require, "blink.cmp")
if not blink_status then return end

-- Function to attach Blink to a buffer if the server supports inlay hints
local function attach_blink(client, bufnr)
   if client.server_capabilities.inlayHintProvider then
      blink.on_attach(client, bufnr)
   end
end

local capabilities = blink.get_lsp_capabilities()

local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if lspconfig_status then
   lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
         attach_blink(client, bufnr)

         if vim.bo.filetype == "lua" then
            vim.api.nvim_create_autocmd("BufWritePre", {
               buffer = bufnr,
               callback = function()
                  vim.lsp.buf.format({ bufnr = bufnr, id = client.id })
               end,
            })
         end
      end,
   })

   lspconfig.ts_ls.setup({
      capabilities = capabilities,
      on_attach = attach_blink,
   })

   lspconfig.eslint.setup({
      capabilities = capabilities,
      on_attach = attach_blink,
   })
end
