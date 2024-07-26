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

local handlers = {
    ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = MyCustomFloatBorder() }),
    ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = MyCustomFloatBorder() }),
}

for _, config in pairs(configs) do
  lsp[config.server].setup({
    settings = config.settings or {},
    handlers = handlers
  })
end


-- neovim lua dev
require('neodev').setup({})
