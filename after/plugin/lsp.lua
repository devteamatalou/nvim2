-- lsp.lua
local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
	return
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Enable inlay hints globally
vim.lsp.inlay_hint.enable(true)

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

-- Lua
lspconfig.lua_ls.setup({
	capabilities = capabilities,
	on_attach = common_on_attach,
	single_file_support = true,
	settings = {
		Lua = {
			workspace = { checkThirdParty = false },
			completion = { workspaceWord = true, callSnippet = "Both" },
			hint = {
				enable = true,
				setType = false,
				paramType = true,
				paramName = "Disable",
				semicolon = "Disable",
				arrayIndex = "Disable",
			},
			doc = { privateName = { "^_" } },
			type = { castNumberToInteger = true },
			diagnostics = {
				disable = { "incomplete-signature-doc", "trailing-space" },
				groupSeverity = { strong = "Warning", strict = "Warning" },
				groupFileStatus = {
					["ambiguity"] = "Opened",
					["await"] = "Opened",
					["codestyle"] = "None",
					["duplicate"] = "Opened",
					["global"] = "Opened",
					["luadoc"] = "Opened",
					["redefined"] = "Opened",
					["strict"] = "Opened",
					["strong"] = "Opened",
					["type-check"] = "Opened",
					["unbalanced"] = "Opened",
					["unused"] = "Opened",
				},
				unusedLocalExclude = { "_*" },
			},
			format = {
				enable = false,
				defaultConfig = {
					indent_style = "space",
					indent_size = "2",
					continuation_indent_size = "2",
				},
			},
		},
	},
})

-- TypeScript / JavaScript
lspconfig.ts_ls.setup({
	capabilities = capabilities,
	on_attach = common_on_attach,
	single_file_support = false,
	root_dir = function(...)
		return require("lspconfig.util").root_pattern(".git")(...)
	end,
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "literal",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = false,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
		javascript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
	},
})

-- Tailwind CSS
lspconfig.tailwindcss.setup({
	capabilities = capabilities,
	on_attach = common_on_attach,
	root_dir = function(...)
		return require("lspconfig.util").root_pattern(".git")(...)
	end,
})

-- ESLint
lspconfig.eslint.setup({ capabilities = capabilities, on_attach = common_on_attach })

-- PHP / Blade
lspconfig.intelephense.setup({
	capabilities = capabilities,
	on_attach = common_on_attach,
	filetypes = { "php", "blade" },
	single_file_support = true,
	root_dir = function(fname)
		return require("lspconfig.util").root_pattern("composer.json", ".git")(fname) or vim.fn.fnamemodify(fname, ":h")
	end,
})

-- HTML
lspconfig.html.setup({
	capabilities = capabilities,
	on_attach = common_on_attach,
	filetypes = { "html", "php" },
	root_dir = function(fname)
		return require("lspconfig.util").find_git_ancestor(fname)
			or require("lspconfig.util").find_node_modules_ancestor(fname)
			or vim.fn.fnamemodify(fname, ":h")
	end,
})

-- Emmet
lspconfig.emmet_ls.setup({
	capabilities = capabilities,
	on_attach = common_on_attach,
	filetypes = { "html", "css", "javascriptreact", "typescriptreact", "php", "blade" },
})

-- JSON
lspconfig.jsonls.setup({ capabilities = capabilities, on_attach = common_on_attach })

-- CSS
lspconfig.cssls.setup({ capabilities = capabilities, on_attach = common_on_attach })
