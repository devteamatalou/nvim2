local api = require("nvim-tree.api")

--this set the margin in the left side to be 0 unless there is a lsp error or warning then it will show it
vim.api.nvim_create_autocmd("DiagnosticChanged", {
	callback = function()
		local diagnostics = vim.diagnostic.get(0)
		if #diagnostics > 0 then
			vim.opt.signcolumn = "yes"
		else
			vim.opt.signcolumn = "no"
		end
	end,
})

--Close all of the buffers when the project change
vim.api.nvim_create_autocmd("DirChanged", {
	callback = function()
		-- close all buffers except current
		vim.cmd("bufdo bd!")
		-- refresh nvim-tree
		api.tree.change_root(vim.fn.getcwd())
		api.tree.reload()
	end,
})
