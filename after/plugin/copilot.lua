-- Copilot configuration
vim.g.copilot_no_tab_map = true
vim.g.copilot_settings = { selectedCompletionModel = 'gpt-4o-copilot' }

-- Copilot key mappings
vim.keymap.set("n", "<leader>cc", "<cmd>Copilot<CR>", { desc = "Copilot" })

vim.keymap.set("i", "<S-Tab>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
  desc = "Copilot accept"
})

vim.keymap.set("i", "<C-L>", "<Plug>(copilot-accept-line)", { desc = "Copilot accept line" })
vim.keymap.set("i", "<C-J>", "<Plug>(copilot-previous)", { desc = "Copilot previous suggestion" })
vim.keymap.set("i", "<C-K>", "<Plug>(copilot-next)", { desc = "Copilot next suggestion" })
