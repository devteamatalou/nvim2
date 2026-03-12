local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

bufferline.setup({
	options = {
		mode = "buffers",
		separator_style = "slant", -- This makes the tabs look like sloped folders
		always_show_bufferline = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		color_icons = true,
		diagnostics = "nvim_lsp", -- Shows red/yellow dots if your TS/PHP has errors
	},
})

-- KEYBINDS: Easy tab switching
-- Press Tab to go right, Shift-Tab to go left
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous Tab" })

-- Close current tab with Leader + x
vim.keymap.set("n", "<leader>x", "<cmd>bdelete!<CR>", { desc = "Close Current Tab" })
