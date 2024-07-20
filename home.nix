{ config, pkgs, ... }:

let
  myUser = "manuelgcsousa";
  myHome = if pkgs.stdenv.isLinux then "/home/${myUser}" else "/Users/${myUser}";

  defaultPkgs = with pkgs; [
    # base
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
  ];

  extraPkgs = with pkgs; [
    # font ~> https://github.com/shytikov/pragmasevka
  ];
in
{
  nixpkgs.config = {
    allowUnfree = true;
  };

  home = {
    stateVersion = "24.11";

    username = myUser;
    homeDirectory = myHome;

    packages = defaultPkgs ++ extraPkgs;

    file = {
      ".config/alacritty" = { source = ./config/alacritty; recursive = true; };
      ".config/brewfile"  = { source = ./config/brewfile; recursive = true; };
      ".config/kitty"     = { source = ./config/kitty; recursive = true; };
      ".config/nvim"      = { source = ./config/nvim; recursive = true; };
      ".config/tmux"      = { source = ./config/tmux; recursive = true; };
      ".zshrc".source     = ./config/zsh/zshrc;
    };
  };

  programs.bat = {
    enable = true;

    config = {
      theme = "Visual Studio Dark+";
    };
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    # use home-manager as a neovim package manager
    plugins = with pkgs.vimPlugins; [
      alpha-nvim
      gitsigns-nvim
      vscode-nvim
      telescope-nvim
      # nvim-tree-lua
      neo-tree-nvim
      lualine-nvim
      nvim-autopairs
      vim-surround
      conflict-marker-vim
      nvim-web-devicons

      oil-nvim

      conform-nvim
      nvim-lspconfig
      neodev-nvim
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      lspkind-nvim

      (nvim-treesitter.withPlugins (p: [
        p.tree-sitter-bash
        p.tree-sitter-c
        p.tree-sitter-dockerfile
        p.tree-sitter-go
        p.tree-sitter-html
        p.tree-sitter-java
        p.tree-sitter-json
        p.tree-sitter-lua
        p.tree-sitter-make
        p.tree-sitter-nix
        p.tree-sitter-python
        p.tree-sitter-terraform
        p.tree-sitter-typescript
        p.tree-sitter-vim
        p.tree-sitter-vimdoc
        p.tree-sitter-yaml
      ]))
    ];
  };

  # let home-manager install and manage itself
  programs.home-manager.enable = true;
}
