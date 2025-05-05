require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
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
