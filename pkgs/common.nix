{ pkgs }:
with pkgs; [
  # base
  fd
  fzf
  jq
  macchina
  ripgrep
  tabiew
  tmux
  tree
  typst
  wget

  # language tools
  gopls
  lua-language-server
  pyright
  ruff
  terraform-ls
]
