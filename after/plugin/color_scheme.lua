require("rose-pine").setup({
  --- @usage 'auto'|'main'|'moon'|'dawn'
  variant = "moon",
  --- @usage 'main'|'moon'|'dawn'
  dark_variant = "moon",
  dim_inactive_windows = false,
  extend_background_behind_borders = true,

  enable = {
    terminal = true,
    legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
    migrations = true,        -- Handle deprecated options automatically
  },

  styles = {
    bold = true,
    italic = true,
    transparency = true,
  },

  --- @usage string hex value or named color from rosepinetheme.com/palette
  groups = {
    panel = "surface",
    panel_nc = "base",
    border = "rose",
    link = "iris",

    error = "love",
    hint = "iris",
    info = "foam",
    note = "pine",
    todo = "rose",
    warn = "gold",

    h1 = "iris",
    h2 = "foam",
    h3 = "rose",
    h4 = "gold",
    h5 = "pine",
    h6 = "foam",
  },

  -- Change specific vim highlight groups
  -- https://github.com/rose-pine/neovim/wiki/Recipes
  highlight_groups = {
    ColorColumn = { bg = "#3a1f2e", blend = 60 },

    -- Blend colours against the "base" background
    CursorLine = { bg = "foam", blend = 10 },
    StatusLine = { bg = "none", fg = "#dc8a78" },

    -- By default each group adds to the existing config.
    -- If you only want to set what is written in this config exactly,
    -- you can set the inherit option:
    MatchParen = { fg = "text" },
    NormalNC = { bg = "none" },

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
