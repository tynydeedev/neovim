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
	{ "stevearc/conform.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-tree/nvim-web-devicons" },
			{ "BurntSushi/ripgrep" },
			{ "sharkdp/fd" },
		},
	},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "tpope/vim-fugitive" },
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{
		"hrsh7th/nvim-cmp",
		opts = {
			window = {
				completion = {
					border = "rounded",
					winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
				},
				documentation = {
					border = "rounded",
					winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
				},
			},
		},
	},
	{ "L3MON4D3/LuaSnip" },
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
}

local opts = {}

require("lazy").setup(plugins, opts)
