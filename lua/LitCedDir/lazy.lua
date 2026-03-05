-- bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Colorscheme
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function() vim.cmd("colorscheme rose-pine") end
    },

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },

    -- Harpoon
    {
        'ThePrimeagen/harpoon',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Utilities
    'mbbill/undotree',
    'tpope/vim-fugitive',
    'lukas-reineke/indent-blankline.nvim',

    -- LSP + Autocomplete + Snippets
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lua',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        },
        config = function()
            -- Put your LSP + cmp + LuaSnip + Copilot config here
            require("LitCedDir.lsp") -- for example, move your lsp.lua logic here
        end
    },

    -- Copilot
    {
        "zbirenbaum/copilot.lua",
        config = function()
            require("copilot").setup({
                panel = { enabled = true },
                suggestion = { enabled = true },
            })
        end
    },
    {
        "zbirenbaum/copilot-cmp",
        dependencies = { "copilot.lua", "nvim-cmp" },
        config = function()
            require("copilot_cmp").setup()
        end
    },

    -- Project.nvim
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup({
                patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
            })
        end
    },

    -- Autopairs
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },

    -- Which Key
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {}
        end
    },

    -- Bufferline
		{
			'akinsho/bufferline.nvim', 
			version = "*", 
			dependencies = 'nvim-tree/nvim-web-devicons'
		},


    -- Lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
    },

    -- Autotag
    'windwp/nvim-ts-autotag',

    -- Conform
    'stevearc/conform.nvim',
})