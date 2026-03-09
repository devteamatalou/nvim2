require("noice").setup({
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.extend_cmp_markdown"] = true, -- Fixed typo: 'cmp' instead of 'meal'
			["cmp.entry.get_documentation"] = true,
		},
	},
	-- THIS IS WHAT YOU ARE MISSING:
	routes = {
		{
			filter = {
				event = "msg_show",
				any = {
					{ find = "%d+L, %d+B" }, -- File write messages
					{ find = "; after #%d+" },
					{ find = "; before #%d+" },
					{ find = "search hit BOTTOM" },
				},
			},
			view = "mini", -- Or use "notify" to send to nvim-notify
		},
	},
	messages = {
		enabled = true,
		view = "mini", -- Routes all messages to nvim-notify
		view_error = "notify",
		view_warn = "notify",
	},
	presets = {
		bottom_search = false,
		command_palette = false,
		long_message_to_split = true,
		inc_rename = false,
	},
})

