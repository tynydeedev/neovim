require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    javascript = {
      "prettierd",
      "prettier",
      stop_after_first = true,
    },
    typescript = {
      "prettierd",
      "prettier",
      stop_after_first = true,
    },
    javascriptreact = {
      "prettierd",
      "prettier",
      stop_after_first = true,
    },
    typescriptreact = {
      "prettierd",
      "prettier",
      stop_after_first = true,
    },
    json = {
      "prettierd",
      "prettier",
      stop_after_first = true,
    },
    html = {
      "prettierd",
      "prettier",
      stop_after_first = true,
    },
    css = {
      "prettierd",
      "prettier",
      stop_after_first = true,
    },
    c = { "clang_format" },
    go = {
      "gopls",
      "golangci_lint_ls",
      "gofumpt",
    },
    vue = {
      "volar",
      "prettierd",
    },
    markdown = {
      "markdownlint",
      "prettierd",
    },
  },
  format_on_save = function(bufnr)
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return { timeout_ms = 500, lsp_format = "fallback" }
  end,
  notify_on_error = true,
  notify_no_formatters = true,
})

vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})
vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })
