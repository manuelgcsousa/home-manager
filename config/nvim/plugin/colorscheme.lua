local c = require('vscode.colors')

require('vscode').setup({
  italic_comments = true,

  color_overrides = {
    vscBack = '#181818'
  },

  group_overrides = {
    -- defaults
    CursorLine = { bg = '#262626' },
    CursorLineNr = { fg = '#FFFFFF' },
    ModeMsg = { fg = c.vscFront, bg = '#1C1C1C' },

    -- plugins
    NvimTreeNormal = { bg = '#181818' },
    TelescopePromptBorder = { fg = '#DDDDDD', bg = 'NONE' },
    TelescopeResultsBorder = { fg = '#DDDDDD', bg = 'NONE' },
    TelescopePreviewBorder = { fg = '#DDDDDD', bg = 'NONE' }
  }
})

vim.o.background = 'dark'
vim.cmd.colorscheme('vscode')
