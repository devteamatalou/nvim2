-- lsp.lua
local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then return end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local function common_on_attach(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
end

lspconfig.lua_ls.setup({ capabilities = capabilities, on_attach = common_on_attach })
lspconfig.ts_ls.setup({ capabilities = capabilities, on_attach = common_on_attach })
lspconfig.eslint.setup({ capabilities = capabilities, on_attach = common_on_attach })

lspconfig.intelephense.setup({
  capabilities = capabilities,
  on_attach = common_on_attach,
  filetypes = { "php", "blade" },
  single_file_support = true,
  root_dir = function(fname)
    return require("lspconfig.util").root_pattern("composer.json", ".git")(fname)
      or vim.fn.fnamemodify(fname, ":h")
  end,
})

lspconfig.html.setup({
  capabilities = capabilities,
  on_attach = common_on_attach,
  root_dir = function(fname)
    return require("lspconfig.util").find_git_ancestor(fname)
      or require("lspconfig.util").find_node_modules_ancestor(fname)
      or vim.fn.fnamemodify(fname, ":h")
  end,
})

lspconfig.emmet_ls.setup({
  capabilities = capabilities,
  on_attach = common_on_attach,
  filetypes = { "html", "css", "javascriptreact", "typescriptreact", "php", "blade" },
})

lspconfig.jsonls.setup({ capabilities = capabilities, on_attach = common_on_attach })
lspconfig.cssls.setup({ capabilities = capabilities, on_attach = common_on_attach })