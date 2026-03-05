local lsp = require("lsp-zero")
local lspkind = require('lspkind')
lsp.preset("recommended")

-- Copilot guard
local status_ok, copilot = pcall(require, "copilot")
if status_ok then
   copilot.setup({ suggestion = { enabled = false }, panel = { enabled = false } })
end

-- Mason
lsp.ensure_installed({
   'ts_ls', 'eslint', 'lua_ls', 'rust_analyzer', 'emmet_ls'
})

-- CMP Setup
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),

	-- The "Super Tab" configuration
	['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
					cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
			else
					fallback() -- Standard tab behavior
			end
	end, { "i", "s" }),

	['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
					cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
			else
					fallback()
			end
	end, { "i", "s" }),
})
-- TS/JS Specific Settings (Ported from your other config)
lsp.configure('ts_ls', {
   settings = {
      typescript = { inlayHints = { includeInlayParameterNameHints = "literal", includeInlayFunctionParameterTypeHints = true } },
      javascript = { inlayHints = { includeInlayParameterNameHints = "all", includeInlayFunctionParameterTypeHints = true } }
   }
})

-- Lua specific settings (Ported from your other config)
lsp.configure('lua_ls', {
   settings = { Lua = { diagnostics = { globals = { 'vim' } }, workspace = { checkThirdParty = false } } }
})

-- Attach Mappings
lsp.on_attach(function(client, bufnr)
	-- Safety check: ensure bufnr is a valid number
	if type(bufnr) ~= "number" then
			vim.notify("Invalid bufnr passed to on_attach: " .. type(bufnr), vim.log.levels.ERROR)
			return
	end

	local opts = { buffer = bufnr, remap = false }

	-- Your keymaps remain the same...
	vim.keymap.set("n", "gd", function() require("telescope.builtin").lsp_definitions({ reuse_win = false }) end, opts)
	-- ...
end)

lsp.setup_nvim_cmp({
   mapping = cmp_mappings,
   sources = { { name = "copilot" }, { name = "nvim_lsp" }, { name = "buffer" }, { name = "path" } },
			formatting = {
				format = lspkind.cmp_format({
						mode = 'symbol', -- Show only symbols
						maxwidth = 50,
						symbol_map = { Copilot = "🤖" } -- You can still manually map Copilot
				})
		},
})

lsp.setup()
