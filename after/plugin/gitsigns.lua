local status, gitsigns = pcall(require, "gitsigns")
if not status then
	return
end

gitsigns.setup({
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns
		local opts = { buffer = bufnr, silent = true }

		-- navigation
		vim.keymap.set("n", "]c", gs.next_hunk, opts)
		vim.keymap.set("n", "[c", gs.prev_hunk, opts)

		-- actions
		vim.keymap.set("n", "<leader>hs", gs.stage_hunk, opts)
		vim.keymap.set("n", "<leader>hr", gs.reset_hunk, opts)
		vim.keymap.set("n", "<leader>hp", gs.preview_hunk, opts)
		vim.keymap.set("n", "<leader>hb", gs.blame_line, opts)

		-- conflict resolution
		vim.keymap.set("n", "<leader>co", "<cmd>Gitsigns checkout<CR>", opts)
	end,
})
