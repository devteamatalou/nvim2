-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- theme
	{
		"craftzdog/solarized-osaka.nvim",
		name = "solarized-osaka",
	},

	-- night owl theme
	{ "oxfist/night-owl.nvim" },

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	{
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{ "mbbill/undotree" },
	{ "tpope/vim-fugitive" },
	{ "lukas-reineke/indent-blankline.nvim" },

	-- LSP
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
		},
	},

	-- mason tool installer
	{ "WhoIsSethDaniel/mason-tool-installer.nvim" },

	-- PROJECT ROOT
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({
				patterns = { ".git", "Makefile", "package.json" },
			})
		end,
	},

	-- AUTOPAIRS
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	-- BUFFERLINE
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},

	-- LUALINE
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{ "windwp/nvim-ts-autotag" },
	{ "stevearc/conform.nvim" },

	-- terminal
	{
		"akinsho/toggleterm.nvim",
		version = "*",
	},

	-- nvim-tree
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = "nvim-tree/nvim-web-devicons",
	},

	-- Dashboard
	{
		"goolord/alpha-nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		lazy = true,
		event = "VimEnter",
	},

	-- noice
	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},

	{ "rcarriga/nvim-notify" },
	{ "numtoStr/Comment.nvim" },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{ "onsails/lspkind.nvim" },

	-- cmp
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },

	-- word highlight
	{ "RRethy/vim-illuminate" },

	-- multiple cursors
	{ "mg979/vim-visual-multi" },

	-- emmet
	{ "mattn/emmet-vim" },

	{ "karb94/neoscroll.nvim" },

	--trouble
	{ "folke/trouble.nvim", dependencies = "nvim-tree/nvim-web-devicons" },

	--Git Conflict rersolution package
	{ "lewis6991/gitsigns.nvim" },

	{ "echasnovski/mini.hipatterns", version = "*" },

	{
		"b0o/incline.nvim",
	},

	--Db Plugin
	{ "tpope/vim-dadbod" },
	{ "kristijanhusak/vim-dadbod-completion" },
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			"tpope/vim-dadbod",
			"kristijanhusak/vim-dadbod-completion",
		},
		cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
	},
})
