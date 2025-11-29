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
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
  },
  {
      "antosha417/nvim-lsp-file-operations",
      dependencies = {
          "nvim-lua/plenary.nvim",
          -- Uncomment whichever supported plugin(s) you use
          --"nvim-tree/nvim-tree.lua",
          "nvim-neo-tree/neo-tree.nvim",
          -- "simonmclean/triptych.nvim"
      },
      config = function()
          require("lsp-file-operations").setup()
      end,
  },
}
