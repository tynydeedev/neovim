-- Clear the LSP log file
vim.api.nvim_create_user_command("LspLogClear", function()
  local log_path = vim.lsp.get_log_path()
  local ok, err = pcall(vim.fn.writefile, {}, log_path)
  if ok then
    vim.notify("LSP log cleared: " .. log_path, vim.log.levels.INFO)
  else
    vim.notify("Failed to clear LSP log: " .. err, vim.log.levels.ERROR)
  end
end, { desc = "Clear the LSP log file" })
