require("rose-pine").setup({
	--- @usage 'auto'|'main'|'moon'|'dawn'
	variant = "main",
	--- @usage 'main'|'moon'|'dawn'
	dark_variant = "main",
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = true,
	disable_float_background = true,
	disable_italics = false,

	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		panel = "surface",
		panel_nc = "base",
		border = "rose",
		comment = "muted",
		link = "iris",
		punctuation = "subtle",

		error = "love",
		hint = "iris",
		info = "foam",
		warn = "gold",

		headings = {
			h1 = "iris",
			h2 = "foam",
			h3 = "rose",
			h4 = "gold",
			h5 = "pine",
			h6 = "foam",
		},
		-- or set all headings at once
		-- headings = 'subtle'
	},

	-- Change specific vim highlight groups
	-- https://github.com/rose-pine/neovim/wiki/Recipes
	highlight_groups = {
		ColorColumn = { bg = "rose" },

		-- Blend colours against the "base" background
		CursorLine = { bg = "foam", blend = 10 },
		StatusLine = { bg = "none", fg = "#dc8a78" },

		-- By default each group adds to the existing config.
		-- If you only want to set what is written in this config exactly,
		-- you can set the inherit option:
		Search = { bg = "gold", inherit = false },

		NormalNC = { bg = "none" },
		Visual = { bg = "#a6e3a1", fg = "#11111b" },

		-- Nvim Tree
		NvimTreeCursorLine = { bg = "muted" },

		-- Nvim Cmp
		CmpBorder = { fg = "gold" },
		PmenuSel = { bg = "#a6e3a1", fg = "#11111b" },
		PmenuThumb = { bg = "#f3ab47" },

		-- Telescope
		TelescopeSelection = { bg = "none", fg = "text" },
		TelescopeSelectionCaret = { bg = "none", fg = "rose" },

		-- Git Signs
		GitSignsAdd = { bg = "none" },
		GitSignsChange = { bg = "none" },
		GitSignsDelete = { bg = "none" },
	},
})

-- Set colorscheme after options
vim.cmd("colorscheme rose-pine")
