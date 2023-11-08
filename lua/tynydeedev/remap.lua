vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Nvim-Tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>")

-- Fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
