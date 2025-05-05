-- Fugitive configuration
vim.keymap.set("n", "<leader>Gg", "<cmd>G<CR>", { desc = "Fugitive open" })
vim.keymap.set("n", "<leader>Gd", "<cmd>Git diff<CR>", { desc = "Git diff" })
vim.keymap.set("n", "<leader>Gb", "<cmd>Git blame<CR>", { desc = "Git blame" })

-- Git signs
vim.keymap.set("n", "<leader>Gl", "<cmd>Gitsigns blame_line<CR>", { desc = "Git blame window" })
vim.keymap.set("n", "<leader>Gt", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle current line blame" })
