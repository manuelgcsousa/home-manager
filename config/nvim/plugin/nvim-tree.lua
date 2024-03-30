local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', '<C-e>', api.tree.close, opts('Close'))
end

require('nvim-tree').setup{
  disable_netrw = true,
  hijack_netrw = true,
  open_on_tab = false,
  update_cwd = true,
  update_focused_file = {
    enable = true
  },
  view = {
    width = 45,
    side = 'left'
  },
  on_attach = on_attach
}
