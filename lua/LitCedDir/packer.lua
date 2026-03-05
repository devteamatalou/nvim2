vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
   -- packer
   use 'wbthomason/packer.nvim'

   -- telescope
   use {
      'nvim-telescope/telescope.nvim',
      requires = { { 'nvim-lua/plenary.nvim' } }
   }

   -- theme
   use({
      'rose-pine/neovim',
      as = 'rose-pine',
      config = function()
         vim.cmd("colorscheme rose-pine")
      end
   })

   -- treesitter
   use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
   }

   use({
      'ThePrimeagen/harpoon',
      requires = { { "nvim-lua/plenary.nvim" } }
   })

   use('mbbill/undotree')
   use('tpope/vim-fugitive')

   use { "lukas-reineke/indent-blankline.nvim" }

   -- LSP ZERO
   use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v1.x',
      requires = {
         { 'neovim/nvim-lspconfig' },
         { 'williamboman/mason.nvim' },
         { 'williamboman/mason-lspconfig.nvim' },

         -- completion
         { 'hrsh7th/nvim-cmp' },
         { 'hrsh7th/cmp-nvim-lsp' },
         { 'hrsh7th/cmp-buffer' },
         { 'hrsh7th/cmp-path' },
         { 'saadparwaiz1/cmp_luasnip' },
         { 'hrsh7th/cmp-nvim-lua' },

         -- snippets
         { 'L3MON4D3/LuaSnip' },
         { 'rafamadriz/friendly-snippets' },
      }
   }

   -- PROJECT ROOT
   use {
      "ahmedkhalf/project.nvim",
      config = function()
         require("project_nvim").setup {
            patterns = { ".git", "Makefile", "package.json" },
         }
      end
   }

   -- AUTOPAIRS
   use {
      "windwp/nvim-autopairs",
      config = function()
         require("nvim-autopairs").setup {}
      end
   }

   -- WHICH KEY
   use {
      "folke/which-key.nvim",
      config = function()
         vim.o.timeout = true
         vim.o.timeoutlen = 300
         require("which-key").setup {}
      end
   }

   -- BUFFERLINE
   use({
      'akinsho/bufferline.nvim',
      tag = "*",
      requires = 'nvim-tree/nvim-web-devicons'
   })

   -- LUALINE
   use({
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
   })

   -- AUTOTAG
   use('windwp/nvim-ts-autotag')

   -- FORMATTER
   use('stevearc/conform.nvim')

   -------------------------------------------------
   -- COPILOT
   -------------------------------------------------

   use {
      "zbirenbaum/copilot.lua",
      config = function()
         require("copilot").setup({
            suggestion = { enabled = false },
            panel = { enabled = false },
         })
      end,
   }

   use {
      "zbirenbaum/copilot-cmp",
      after = { "copilot.lua" },
      config = function()
         require("copilot_cmp").setup()
      end
   }


   -- 2. Use the CMP bridge
   use {
      "zbirenbaum/copilot-cmp",
      after = { "copilot.lua" },
      config = function()
         require("copilot_cmp").setup()
      end
   }



    -- terminal package
   use {
      "akinsho/toggleterm.nvim",
      tag = '*',
   }

   --package tree sitter
   use {
      "nvim-tree/nvim-tree.lua",
      requires = "nvim-tree/nvim-web-devicons",

   }
   --Dashboard plugin
   use {
      "goolord/alpha-nvim",
      requires = "nvim-tree/nvim-web-devicons",
   }

			--noice plugin

			use {
				"folke/noice.nvim",
				requires = {
						"MunifTanjim/nui.nvim",
						"rcarriga/nvim-notify",
				},
		}

   --notify package

   use 'rcarriga/nvim-notify'
   use 'numtoStr/Comment.nvim'
   use 'JoosepAlviste/nvim-ts-context-commentstring'
			use 'onsails/lspkind.nvim'


end)
