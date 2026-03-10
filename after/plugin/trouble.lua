local status, trouble = pcall(require, "trouble")
if not status then
	return
end

trouble.setup({
	icons = {
		error = "",
		warning = "",
		hint = "",
		information = "",
	},
	auto_focus = false,
})

vim.keymap.set("n", "<leader>d", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Toggle Trouble diagnostics" })
vim.keymap.set("n", "<leader>dw", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "File diagnostics" })
vim.keymap.set("n", "<leader>dc", "<cmd>Trouble diagnostics close<CR>", { desc = "Close Trouble" })
