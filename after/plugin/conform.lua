local status, conform = pcall(require, "conform")
if not status then return end

conform.setup({
   formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      php = { "php_cs_fixer" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },

      timeout_ms = 500,
      lsp_fallback = true,
   },
})

-- Keybind to manually format if you don't want it on save
vim.keymap.set({ "n", "v" }, "<leader>f", function()
   conform.format({
      lsp_fallback = true,
      async = false,
      timeout_ms = 500,
   })
end, { desc = "Format file or range (visual mode)" })
