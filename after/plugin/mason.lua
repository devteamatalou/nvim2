local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

local lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not lspconfig_status then
  return
end

local installer_status, mason_tool_installer = pcall(require, "mason-tool-installer")
if not installer_status then
  return
end

mason.setup()

mason_lspconfig.setup({
  ensure_installed = {
    "ts_ls",
    "intelephense",
    "eslint",
    "html",
    "cssls",
    "jsonls",
    "lua_ls",
    "emmet_ls",
    "tailwindcss",
  },
  automatic_installation = false,
})

mason_tool_installer.setup({
  ensure_installed = {
    "prettier",
    "php-cs-fixer",
    "blade-formatter",
    "stylua",
    "luacheck",
    "shellcheck",
    "shfmt",
  },
})
