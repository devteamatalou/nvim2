local nvim_tree = require("nvim-tree")
local api = require("nvim-tree.api")

-- 1. Remove open_on_setup (it's gone)
-- 2. Clean up deprecated options like update_cwd
nvim_tree.setup({
    disable_netrw = true,
    hijack_netrw = true,
    -- update_cwd = true, -- DEPRECATED: remove this line
    view = {
        width = 30,
        side = "left",
    },
   filters = {
        dotfiles = false,
    },
    -- 3. Modern way to handle on_attach
				on_attach = function(bufnr)
					local function opts(desc)
									return { desc = "Nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
					end

					-- 1. Load default mappings first
					api.config.mappings.default_on_attach(bufnr)

					-- 2. Custom mappings (FIXED)
					-- Both '%' and 'A' now use 'api.fs.create'
					vim.keymap.set("n", "%", api.fs.create, opts("Create File/Folder"))
					vim.keymap.set("n", "A", api.fs.create, opts("Create File/Folder"))

					-- These should work fine, but ensure they are correctly named
					vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
					vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
	end,
})

-- Global toggle key (using vim.keymap.set is preferred over vim.api.nvim_set_keymap)
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
