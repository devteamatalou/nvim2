local status, conform = pcall(require, "conform")
if not status then
	return
end

conform.setup({
	formatters_by_ft = {
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		php = { "php-cs-fixer" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

vim.keymap.set({ "n", "v" }, "<leader>f", function()
	conform.format({
		lsp_format = "fallback",
		async = true,
		timeout_ms = 3000,
	})
end, { desc = "Format file or range (visual mode)" })
