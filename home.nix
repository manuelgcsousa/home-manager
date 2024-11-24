{ config, pkgs, username, ... }:
let
  commonPkgs = import ./pkgs/common.nix { inherit pkgs; };

  osPkgs = if pkgs.stdenv.isLinux then import ./pkgs/linux.nix { inherit pkgs; }
           else import ./pkgs/darwin.nix { inherit pkgs; };

  pragmasevka = import ./derivations/pragmasevka.nix { inherit pkgs; };
in
{
  nixpkgs = {
    config.allowUnfree = true;
  };

  home = {
    stateVersion = "24.05";
    username = "${username}";
    homeDirectory = if pkgs.stdenv.isLinux then "/home/${username}" else "/Users/${username}";

    packages = commonPkgs ++ osPkgs ++ [ pragmasevka ];

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
          p.tree-sitter-css
          # p.tree-sitter-dockerfile
          p.tree-sitter-go
          p.tree-sitter-html
          p.tree-sitter-java
          p.tree-sitter-javascript
          p.tree-sitter-just
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
