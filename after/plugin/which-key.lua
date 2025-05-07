local wk = require("which-key")

wk.add({
  {
    "<leader>?",
    function()
      require("which-key").show({ global = false })
    end,
    desc = "Buffer Local Keymaps (which-key)",
  },
  { "<leader>G", group = "[G]it" },
  { "<leader>a", group = "AI" },
})

wk.setup({
  preset = "helix",
})
