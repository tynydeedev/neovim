-- This is necessary since lazy nvim requires this for the keymap to work
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- Shortcuts
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = {
      { 'echasnovski/mini.icons', version = '*' },
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- Formatting
  { "stevearc/conform.nvim" },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
  },

  -- Highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },

  -- Navigation
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "BurntSushi/ripgrep" },
      { "sharkdp/fd" },
    },
  },

  -- Git
  { "tpope/vim-fugitive" },
  { "lewis6991/gitsigns.nvim" },

  -- LSP
  {
    "williamboman/mason.nvim",
    dependencies = {
      { "williamboman/mason-lspconfig.nvim" },
      { "neovim/nvim-lspconfig" },
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      { "kevinhwang91/promise-async" }
    }
  },
  { "numToStr/Comment.nvim", lazy = false },

  -- Auto Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
    },
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      { "saadparwaiz1/cmp_luasnip" },
    },
  },

  -- ColorScheme
  { "rose-pine/neovim",      name = "rose-pine" },
  {
    "nvim-lualine/lualine.nvim",
    event = "ColorScheme",
    opts = {
      options = { theme = "rose-pine-alt" },
    }
  },

  -- Copilot
  { "github/copilot.vim" },
}

local opts = {}

require("lazy").setup(plugins, opts)
