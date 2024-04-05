local dashboard = require('alpha.themes.dashboard')
require('alpha').setup(dashboard.config)

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl_shortcut = 'Macro'
  return b
end

dashboard.section.header.val = {
  "                                                    ",
  " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                    "
}

dashboard.section.buttons.val = {
  button('e',   '  New file',  ':ene<CR>'),
  button('C-f', '󰍉  Find file', ':Telescope find_files<CR>'),
  button('C-g', '󰈬  Find word', ':Telescope live_grep<CR>'),
  button('c',   '  Config',    ':e $HOME/.config/home-manager/<CR>'),
  button('q',   '  Quit',      ':qa<CR>'),
}

dashboard.section.footer.val = function()
  return 'manuelgcsousa.github.io'
end
