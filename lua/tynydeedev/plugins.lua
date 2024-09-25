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
	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "BurntSushi/ripgrep" },
			{ "sharkdp/fd" },
		},
	},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "tpope/vim-fugitive" },
	{
		"williamboman/mason.nvim",
		dependencies = {
			{ "williamboman/mason-lspconfig.nvim" },
			{ "neovim/nvim-lspconfig" },
		},
	},
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
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
	},
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"nvim-lualine/lualine.nvim",
		event = "ColorScheme",
		config = function()
			require("lualine").setup({
				options = {
					--- @usage 'rose-pine' | 'rose-pine-alt'
					theme = "rose-pine-alt",
				},
			})
		end,
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
