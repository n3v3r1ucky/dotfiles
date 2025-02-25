-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} ,{'BurntSushi/ripgrep'} }
  }
  use 'shaunsingh/nord.nvim'
  use (
	  'nvim-treesitter/nvim-treesitter',
	  {run = ':TSUpdate'}
  )
  use "mbbill/undotree"
  use "tpope/vim-fugitive"
  use({'neovim/nvim-lspconfig'})
  use({'hrsh7th/nvim-cmp'})
  use({'hrsh7th/cmp-nvim-lsp'})
  use {
	  "williamboman/mason.nvim",
	  "williamboman/mason-lspconfig.nvim",
  }
  use 'mfussenegger/nvim-dap'
  use 'mfussenegger/nvim-dap-python'
  use 'nvim-lua/plenary.nvim'
  use 'ThePrimeagen/harpoon'
  use 'lewis6991/gitsigns.nvim'
  use {
      "danymat/neogen",
      config = function()
          require('neogen').setup {
              enabled = true,
              languages = {
                  python = {
                      template = {
                          annotation_convention = "reST"
                      }
                  },
              }
          }
      end,
      -- Uncomment next line if you want to follow only stable versions
      -- tag = "*"
  }
end)
