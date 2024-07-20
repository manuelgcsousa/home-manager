local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ','

-- defaults
map('n', '<Leader>w',  ':w<CR><Space><Left>',                      opts)               -- quick save
map('n', '<Leader>Q',  ':bdelete!<CR>',                            opts)               -- force buffer quit
map('n', '<Leader>b',  ':b#<CR>',                                  opts)               -- previous buffer
map('n', '<Leader>c',  ':noh<CR>',                                 opts)               -- clear search highlight
map('v', '<C-c>',      '\'+yi',                                    { silent = true })  -- Ctrl-c
map('i', '<C-v>',      '<ESC>\'+pa',                               { silent = true })  -- Ctrl-v
map('v', '<',          '<gv',                                      { silent = true })  -- shift left
map('v', '>',          '>gv',                                      { silent = true })  -- shift right
map('n', '<Leader>fp', '<cmd>lua print(vim.fn.expand("%:p"))<CR>', opts)               -- print file absolute path
map('n', '<Leader>jq', ':%!jq<CR>',                                opts)               -- format JSON file with 'jq'
map('v', '<Leader>jq', '!jq .<CR>',                                opts)               -- format JSON visual selection with 'jq'
map('x', 'Q',          ':norm @q<CR>',                             { silent = false }) -- run 'q' macro on multiple lines

--- nvim-tree
-- map('n', '<C-e>', ':NvimTreeToggle<CR>', opts)

-- telescope
map('n', '<C-f>',      ':Telescope find_files<CR>',  opts)
map('n', '<C-b>',      ':Telescope buffers<CR>',     opts)
map('n', '<C-g>',      ':Telescope live_grep<CR>',   opts)
map('n', '<Leader>gs', ':Telescope git_status<CR>',  opts)

-- gitsigns
map('n', '<Leader>lb', ':Gitsigns toggle_current_line_blame<CR>', opts)

-- LSP
map('n', '<Leader>r',  ':Telescope lsp_references<CR>',            opts)
map('n', '<Leader>d',  '<cmd>lua vim.lsp.buf.definition()<CR>',    opts)
map('n', '<Leader>h',  '<cmd>lua vim.lsp.buf.hover()<CR>',         opts)
map('n', '<Leader>sd', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
