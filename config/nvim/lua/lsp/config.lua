local lsp = require('lspconfig')

local configs = {
  python = {
    server = 'pyright',
    settings = {
      python = {
        analysis = {
          typeCheckingMode = 'basic',
          diagnosticMode = 'openFilesOnly'
        }
      }
    }
  },
  terraform = {
    server = 'terraformls'
  },
  go = {
    server = 'gopls'
  },
  typescript = {
    server = 'tsserver'
  },
  lua = {
    server = 'lua_ls',
    settings = {
      Lua = {
        workspace = {
          checkThirdParty = false,
        }
      }
    }
  }
}

for _, config in pairs(configs) do
  lsp[config.server].setup({
    settings = config.settings or {}
  })
end


-- neovim lua dev
require('neodev').setup({})
