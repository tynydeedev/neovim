vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

-- Nvim-Tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>")

-- Fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
