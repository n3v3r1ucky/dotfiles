-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Now with Lazy.nvim!

return {
  -- Package manager
  {
    "folke/lazy.nvim",
  },

  -- Telescope: fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "BurntSushi/ripgrep",
    },
  },

  -- Nord color scheme
  {
    "shaunsingh/nord.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme nord]])
    end,
  },

  -- Treesitter: better syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- Undo tree visualizer
  {
    "mbbill/undotree",
  },

  -- Git integration
  {
    "tpope/vim-fugitive",
  },

  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
  },
  -- Debug Adapter Protocol
  {
    "mfussenegger/nvim-dap",
  },
  {
      "rcarriga/nvim-dap-ui",
      dependencies = {
          "mfussenegger/nvim-dap",
          "nvim-neotest/nvim-nio",
      }
  },
  -- Python debugging
  {
    "mfussenegger/nvim-dap-python",
  },

  -- Golang debugging
  {
    "leoluz/nvim-dap-go",
  },

  -- Harpoon: quick navigation
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- Git signs
  {
    "lewis6991/gitsigns.nvim",
  },

  -- Neogen: documentation generator
  {
    "danymat/neogen",
    config = function()
      require("neogen").setup {
        enabled = true,
        languages = {
          python = {
            template = {
              annotation_convention = "reST",
            },
          },
        },
      }
    end,
    -- Uncomment next line if you want to follow only stable versions
    -- tag = "*"
  },
  {
      "ThePrimeagen/refactoring.nvim",
      dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-treesitter/nvim-treesitter",
      },
      lazy = false,
      opts = {},
  },
  {
      "nvim-tree/nvim-tree.lua",
      version = "1.14", -- Recommended to use a specific version tag like "v1" or "v1.23"
      lazy = false, -- Set to true for lazy loading, then define events/commands to trigger it
      dependencies = {
          "nvim-tree/nvim-web-devicons", -- Optional, for file icons
      },
      config = function()
          -- Disable netrw at the very start of your init.lua to prevent conflicts
          vim.g.loaded_netrw = 1
          vim.g.loaded_netrwPlugin = 1

          require("nvim-tree").setup({
              -- Your nvim-tree configuration options go here
              git = {
                  enable = true,
                  ignore = false, -- Set this to false to show ignored files
                  timeout = 500,
              },
              filters = {
                  dotfiles = false,
              },
              actions = {
                  open_file = {
                      quit_on_open = true,
                  },
              },
              view = {
                  width = 30,
              },
              -- etc.
          })
      end,
  },
  {
      "antosha417/nvim-lsp-file-operations",
      dependencies = {
          "nvim-lua/plenary.nvim",
          -- Uncomment whichever supported plugin(s) you use
          "nvim-tree/nvim-tree.lua",
          -- "nvim-neo-tree/neo-tree.nvim",
          -- "simonmclean/triptych.nvim"
      },
      config = function()
          require("lsp-file-operations").setup()
      end,
  },
}
