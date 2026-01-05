local capabilities = require("cmp_nvim_lsp").default_capabilities()

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

require("mason").setup({
  ui = { border = "bold" },
})

require("mason-lspconfig").setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {
    "lua_ls",
    "sqlls", "bashls",
    "eslint", "ts_ls", "tailwindcss", "cssls", 'vue_ls',
    "gopls",
    "docker_compose_language_service", "dockerls",
  },
  automatic_enable = true,
})

-- Configure LSP servers
vim.lsp.config('*', {
  capabilities = capabilities,
})

vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

vim.lsp.config("eslint", {
  capabilities = capabilities,
  settings = {
    workingDirectory = {
      mode = "auto"
    }
  }
})

local vue_language_server_path = vim.fn.expand '$MASON/packages' ..
    '/vue-language-server' .. '/node_modules/@vue/language-server'

local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_language_server_path,
  languages = { 'vue' },
  configNamespace = 'typescript',
}

vim.lsp.config('ts_ls', {
  capabilities = capabilities,
  init_options = {
    plugins = {
      vue_plugin,
    },
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
})
vim.lsp.enable({ 'vtsls', 'vue_ls' })

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  end,
})
