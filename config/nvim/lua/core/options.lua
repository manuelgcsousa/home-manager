local options = {
  syntax = 'on',
  mouse = 'a',
  encoding = 'utf8',
  ffs = { 'unix', 'dos', 'mac' },
  clipboard = 'unnamedplus',
  hidden = true,
  number = true,
  relativenumber = true,
  backspace = '2',
  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 4,
  expandtab = true,
  scrolloff = 10,
  incsearch = true,
  hlsearch = true,
  splitright = true,
  splitbelow = true,
  ruler = true,
  wildmenu = true,
  completeopt = { 'menuone', 'noselect' },
  signcolumn = 'yes',
  viminfo = '',
  showtabline = 0,
  cursorline = true,
  laststatus = 3,
  showmode = false,
  swapfile = false,
  errorbells = false,
  termguicolors = true,
  fillchars = {
    eob = ' ',
    horiz = '━',
    horizup = '┻',
    horizdown = '┳',
    vert = '┃',
    vertleft  = '┫',
    vertright = '┣',
    verthoriz = '╋',
  }
}

vim.cmd[[
set list
set listchars+=trail:·
]]

for k, v in pairs(options) do
  vim.opt[k] = v
end
