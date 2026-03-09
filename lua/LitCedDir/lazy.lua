-- Bootstrap lazy.nvim
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

  -- telescope
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- theme
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      vim.cmd("colorscheme rose-pine")
    end
  },

  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },

  {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  { 'mbbill/undotree' },
  { 'tpope/vim-fugitive' },
  { 'lukas-reineke/indent-blankline.nvim' },

  -- LSP ZERO
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- completion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lua',

      -- snippets
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    }
  },

  -- PROJECT ROOT
  {
    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup {
        patterns = { '.git', 'Makefile', 'package.json' },
      }
    end
  },

  -- AUTOPAIRS
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end
  },

  -- BUFFERLINE
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons'
  },

  -- LUALINE
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  { 'windwp/nvim-ts-autotag' },
  { 'stevearc/conform.nvim' },

  -- terminal
  {
    'akinsho/toggleterm.nvim',
    version = '*',
  },

  -- nvim-tree
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons',
  },

  -- Dashboard
  {
    'goolord/alpha-nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
  },

  -- noice
  {
    'folke/noice.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
  },

  { 'rcarriga/nvim-notify' },
  { 'numtoStr/Comment.nvim' },
  { 'JoosepAlviste/nvim-ts-context-commentstring' },
  { 'onsails/lspkind.nvim' },

  -- blink
  {
    'saghen/blink.nvim',
    dependencies = { 'neovim/nvim-lspconfig' },
  },

  { 'karb94/neoscroll.nvim' },


  { 'WhoIsSethDaniel/mason-tool-installer.nvim' },


})
