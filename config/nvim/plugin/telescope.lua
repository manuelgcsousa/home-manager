local previewers = require('telescope.previewers')

-- do not preview files bigger than 1MB
local max_size = 1000000  -- 1MB
local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}

  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then return end

    if stat.size > max_size then
      return
    else
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)
end

require('telescope').setup{
  defaults = {
    borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
    path_display = { 'truncate' },
    file_ignore_patterns = {'.git/', 'node_modules'},
    layout_strategy = 'horizontal',
    buffer_previewer_maker = new_maker
  },
  pickers = {
    find_files = {
      hidden = true
    }
  }
}
