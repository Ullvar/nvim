local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  checker = { enabled = true },

  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = require("core.plugin_config.theme")
  },

  { "nvim-lua/plenary.nvim" },

  {
    'neoclide/coc.nvim',
    branch = 'release'
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = require("core.plugin_config.lualine")
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = require("core.plugin_config.tree_sitter")
  },

  {
    'lewis6991/gitsigns.nvim',
    config = require("core.plugin_config.gitsigns")
  },

  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = require("core.plugin_config.nvim_tree")
  },

  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    config = function()
      require('ufo').setup()
    end
  },

  {
    'akinsho/bufferline.nvim',
    config = function()
      require("bufferline").setup {}
    end
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-telescope/telescope-ui-select.nvim" },
    config = require("core.plugin_config.telescope"),
    keys = {
      {
        "<leader>ff",
        "<cmd>Telescope find_files<cr>",
        desc = "Find files"
      },
      {
        "<leader>fg",
        "<cmd>Telescope live_grep<cr>",
        desc = "Find word"
      },
      {
        "<leader>fb",
        "<cmd>Telescope buffers<cr>",
        desc = "Find buffers"
      },
      {
        "<leader>fh",
        "<cmd>Telescope help_tags<cr>",
        desc = "Find help tags"
      },
      {
        "<leader>gd",
        "<cmd>Telescope git_status<cr>",
        desc = "See git status"
      }
    }
  },

  { "RRethy/vim-illuminate" }

})
