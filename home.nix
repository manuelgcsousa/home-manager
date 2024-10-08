{ config, pkgs, username, ... }:
let
  # derivation for installing font
  pragmasevka = pkgs.stdenv.mkDerivation {
    pname = "Pragmasevka-NF";
    version = "1.6.6";

    src = pkgs.fetchurl {
      url = "https://github.com/shytikov/pragmasevka/releases/download/v1.6.6/Pragmasevka_NF.zip";
      sha256 = "12m8zyqclwzgr4ydzk7bcjk20zkv3mlfjbcmm3w31ys66l24l8al";
    };

    buildInputs = [ pkgs.unzip ];

    sourceRoot = ".";

    installPhase = ''
      mkdir -p $out/share/fonts/Pragmasevka-NF
      unzip $src -d $out/share/fonts/Pragmasevka-NF
    '';
  };

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
    pragmasevka
  ];
in
{
  nixpkgs = {
    config.allowUnfree = true;
  };

  home = {
    stateVersion = "24.05";
    username = "${username}";
    homeDirectory = if pkgs.stdenv.isLinux then "/home/${username}" else "/Users/${username}";

    packages = defaultPkgs ++ extraPkgs;

    file = {
      ".config/aerospace" = { source = ./config/aerospace; recursive = true; };
      ".config/alacritty" = { source = ./config/alacritty; recursive = true; };
      ".config/brewfile"  = { source = ./config/brewfile; recursive = true; };
      ".config/kitty"     = { source = ./config/kitty; recursive = true; };
      ".config/nvim"      = { source = ./config/nvim; recursive = true; };
      ".config/tmux"      = { source = ./config/tmux; recursive = true; };
      ".zshrc".source     = ./config/zsh/zshrc;
    };
  };

  programs = {
    # let home-manager install and manage itself
    home-manager.enable = true;

    bat = {
      enable = true;
      config = {
        theme = "Visual Studio Dark+";
      };
    };

    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      # use home-manager as a neovim package manager
      plugins = with pkgs.vimPlugins; [
        alpha-nvim
        gitsigns-nvim
        vscode-nvim
        fzf-lua
        nvim-tree-lua
        lualine-nvim
        nvim-autopairs
        vim-surround
        conflict-marker-vim
        nvim-web-devicons

        oil-nvim  # temp?

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
          # p.tree-sitter-dockerfile
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
  };
}
