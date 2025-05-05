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
  extentions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {},
    },
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case", the default case_mode is "smart_case"
    }
  },
})

require('telescope').load_extension('ui-select')
require('telescope').load_extension('fzf')
