local function hide_in_width()
  return vim.fn.winwidth(0) > 120
end

require('lualine').setup {
  options = {
    theme = 'rose-pine-alt',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'filename' },
    lualine_c = { { 'branch', cond = hide_in_width }, 'diff', 'diagnostics' },
    lualine_x = { 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
}
