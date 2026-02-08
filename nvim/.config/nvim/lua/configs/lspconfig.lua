local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities
require("nvchad.configs.lspconfig").defaults()

local servers = { "rust_analyzer" }
vim.lsp.config('rust_analyzer', {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = {'rust'},
  settings ={
    ['rust_analyzer'] = {
      cargo = {
        allFeatures = true
      }
    }
  }
})
vim.lsp.enable(servers)
--
--
