local colors = {
  white = '#C6C6C6',
  grey  = '#262626'
}

local theme = {
  normal = {
    a = { fg = colors.white, bg = colors.grey, gui = 'bold' },
    b = { fg = colors.white, bg = colors.grey },
  },
  insert = {
    a = { fg = colors.white, bg = colors.grey, gui = 'bold' },
    b = { fg = colors.white, bg = colors.grey },
  },
  visual = {
    a = { fg = colors.white, bg = colors.grey, gui = 'bold' },
    b = { fg = colors.white, bg = colors.grey },
  },
  replace = {
    a = { fg = colors.white, bg = colors.grey, gui = 'bold' },
    b = { fg = colors.white, bg = colors.grey },
  }
}

require('lualine').setup {
  options = {
    theme = theme,
  },
  sections = {
    lualine_a = {
      {
        'mode',
        fmt = function(str) return str:sub(1, 3) end
      }
    },
    lualine_b = {
      {
        'filename',
        path = 3
      }
    },
    lualine_c = {},
    lualine_x = { 'branch' },
    lualine_y = { 'location' },
    lualine_z = { 'progress' }
  },
  tabline = {},
  extensions = {},
}
