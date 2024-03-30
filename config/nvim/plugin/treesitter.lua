require('nvim-treesitter.configs').setup{
  sync_install = false,
  ignore_install = { 'javascript' },
  highlight = {
    enable = true,
    is_supported = function()
      -- disable treesitter if file is bigger than 1MB
      return not (vim.fn.getfsize(vim.fn.expand('%')) > 1024 * 1024)
    end
  }
}
