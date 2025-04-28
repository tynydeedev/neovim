local lspconfig = require('lspconfig')
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
    "eslint", "ts_ls", "volar", "tailwindcss", "cssls",
    "gopls",
    "docker_compose_language_service", "dockerls",
  },
  handlers = {
    ["lua_ls"] = function()
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })
    end,
    ["ts_ls"] = function()
      local mason_registry = require("mason-registry")
      local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
          .. "/node_modules/@vue/language-server"

      vim.lsp.config('ts_ls', {
        capabilities = capabilities,
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = vue_language_server_path,
              languages = { "vue" },
            },
          },
        },
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
      })
      vim.lsp.enable('ts_ls')
    end,
    ["eslint"] = function()
      vim.lsp.config('eslint', {
        capabilities = capabilities,
        settings = {
          workingDirectory = {
            mode = "auto"
          }
        }
      })
      vim.lsp.enable('eslint')
    end,
    function(server_name)
      vim.lsp.config(server_name, {
        capabilities = capabilities,
      })
      vim.lsp.enable(server_name)
    end,
  },
})
