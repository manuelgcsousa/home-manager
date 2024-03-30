local lsp = require('lspconfig')

-- Python
lsp.pyright.setup{
  settings = {
    python = {
      analysis = {
        typeCheckingMode = 'basic',
        diagnosticMode = 'openFilesOnly'
      }
    }
  }
}

-- Golang
lsp.gopls.setup{}

-- Terraform
lsp.terraformls.setup{}

-- TypeScript
lsp.tsserver.setup{}

-- Lua
require('neodev').setup{}  -- neovim lua dev
lsp.lua_ls.setup{
  settings = {
    Lua = {
      workspace = {
        checkThirdParty = false,
      }
    }
  }
}
