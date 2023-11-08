require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 40,
  },
  renderer = {
    indent_markers = {
      enable = true,
    },
  },
  filters = {
    custom = {
      "^.git$", "^.DS_Store$"
    },
    git_ignored = false,
  },
  diagnostics = {
    enable = true,
  },
})
