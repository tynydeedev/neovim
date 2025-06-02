vim.g.mapleader = " "

-- Nvim-Tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>")

-- Move line up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("i", "<C-c>", "<Esc>")
