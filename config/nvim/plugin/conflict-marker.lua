vim.cmd[[
  " disable the default highlight group
  let g:conflict_marker_highlight_group = ''

  " include text after begin and end markers
  let g:conflict_marker_begin = '^<<<<<<<\+ .*$'
  let g:conflict_marker_common_ancestors = '^|||||||\+ .*$'
  let g:conflict_marker_end  = '^>>>>>>>\+ .*$'

  highlight ConflictMarkerBegin guibg=#2f7366
  highlight ConflictMarkerOurs guibg=#2e5049
  highlight ConflictMarkerTheirs guibg=#344f69
  highlight ConflictMarkerEnd guibg=#2f628e
  highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81
]]
