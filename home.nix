{ config, pkgs, ... }:

let
  myUser = "manuelgcsousa";

  isLinux = builtins.currentSystem == "x86_64-linux";

  defaultPkgs = with pkgs; [
    bat
    fzf
    gopls
    jq
    lua-language-server
    neofetch
    ripgrep
    # terraform
    terraform-ls
    tmux
    tree
    typst
    wget
  ];

  extraPkgs = with pkgs; [
    # font ~> https://github.com/shytikov/pragmasevka
    nodePackages.pyright
    python311Packages.pylama
  ];
in
{
  nixpkgs.config = {
    allowUnfree = true;
  };

  home = {
    username = myUser;
    homeDirectory = if isLinux then "/home/${myUser}" else "/Users/${myUser}";

    stateVersion = "23.11";

    packages = defaultPkgs ++ extraPkgs;

    file = {
      ".config/alacritty" = { source = ./config/alacritty; recursive = true; };
      ".config/brewfile"  = { source = ./config/brewfile; recursive = true; };
      ".config/kitty"     = { source = ./config/kitty; recursive = true; };
      ".config/nvim"      = { source = ./config/nvim; recursive = true; };
      ".config/skhd"      = { source = ./config/skhd; recursive = true; };
      ".config/tmux"      = { source = ./config/tmux; recursive = true; };
      ".config/yabai"     = { source = ./config/yabai; recursive = true; };
      ".zshrc".source     = ./config/zsh/zshrc;
    };
  };

  # setup neovim
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      alpha-nvim
      gitsigns-nvim
      vscode-nvim
      telescope-nvim
      nvim-tree-lua
      lualine-nvim
      nvim-autopairs
      vim-surround
      git-conflict-nvim
      nvim-web-devicons

      nvim-lspconfig
      null-ls-nvim
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
