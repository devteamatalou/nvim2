vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	--telescope plugin

	use{
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/plenary.nvim'}}
	}

	--color scheme rose pine(theme)

	use({
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			vim.cmd("colorscheme rose-pine")
		end
	})

	--treesitter plugin
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	use({
		'ThePrimeagen/harpoon',
		requires = {{"nvim-lua/plenary.nvim"}} 
	})

	use('mbbill/undotree')
	use('tpope/vim-fugitive')
   use {"lukas-reineke/indent-blankline.nvim", opt = {}}

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             
			{'williamboman/mason.nvim'},           
			{'williamboman/mason-lspconfig.nvim'}, 

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	}

   -- telescope project plugin

   use {
      "ahmedkhalf/project.nvim",
      config = function()
         require("project_nvim").setup {
            -- Optional: detect project root by these patterns
            patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
         }
      end
   }

   -- autopairs plugin 


   use {
      "windwp/nvim-autopairs",
      config = function()
         require("nvim-autopairs").setup {}
      end
   }

   --which key plugin (to learn the keybinds etc)

   use {
      "folke/which-key.nvim",
      config = function()
         vim.o.timeout = true
         vim.o.timeoutlen = 300
         require("which-key").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
         }
      end
   }
   
   -- this is buff plugin (tab on top fo the file)

   use({
      'akinsho/bufferline.nvim',
      tag = "*",
      requires = 'nvim-tree/nvim-web-devicons'
   })

   -- this make the bottom line status, git line good looking
  
   use({
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
   })

   --autotag plugin

   use('windwp/nvim-ts-autotag')

   --conform plugin
   use('stevearc/conform.nvim')
end)
