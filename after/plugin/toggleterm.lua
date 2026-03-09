require("toggleterm").setup({
	size = 20, -- terminal height
	open_mapping = [[<c-\>]], -- Ctrl+\ toggles terminal
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float", -- horizontal, vertical, float, tab
	close_on_exit = false,
	shell = vim.o.shell,
})

local Terminal = require("toggleterm.terminal").Terminal

local function new_terminals()
	_G.term1 = Terminal:new({ hidden = true, dir = vim.fn.getcwd() })
	_G.term2 = Terminal:new({ hidden = true, dir = vim.fn.getcwd() })
end

new_terminals()

-- refresh terminals when directory changes
vim.api.nvim_create_autocmd("DirChanged", {
	callback = function()
		new_terminals()
	end,
})

-- You can create empty terminals
_G.term1 = Terminal:new({ hidden = true })
_G.term2 = Terminal:new({ hidden = true })
-- Keymaps to toggle them
vim.api.nvim_set_keymap("n", "<leader>1", "<cmd>lua _G.term1:toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>2", "<cmd>lua _G.term2:toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
