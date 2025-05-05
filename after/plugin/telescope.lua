local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>pf",
  builtin.find_files,
  { desc = "Find Files" }
)

vim.keymap.set("n", "<leader>pg",
  builtin.git_files,
  { desc = "Find Git Files" }
)

vim.keymap.set("n", "<leader>ps",
  function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
  end,
  { desc = "Grep String" }
)

require("telescope").setup({
  defaults = {
    prompt_prefix = "󰱼 ",
    selection_caret = " ",
    results_title = "Available Files",
  },
})
