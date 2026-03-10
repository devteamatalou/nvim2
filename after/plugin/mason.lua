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
		"ts_ls", -- JavaScript / TypeScript / JSX / TSX
		"intelephense", -- PHP / Blade
		"eslint", -- JS/TS linting
		"html", -- HTML
		"cssls", -- CSS
		"jsonls", -- JSON
		"lua_ls", -- Lua
		"emmet_ls", -- Emmet
	},
	automatic_installation = false,
})

mason_tool_installer.setup({
	ensure_installed = {
		"prettier", -- JS / TS / JSX / TSX / CSS / HTML
		"phpcbf", -- PHP
		"blade-formatter", -- Blade
		"stylua", -- Lua
	},
})
