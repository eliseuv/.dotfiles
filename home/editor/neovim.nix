{ pkgs, ... }:
{

  imports = [

    # LazyVim
    ./lazyvim.nix

  ];

  programs.neovim = {
    enable = true;
  };

  home.shellAliases = {
    v = "nvim";
    vr = "nvim -R";
  };

  home.packages = with pkgs; [

    # Clipboard integration
    xclip

    # Tree-sitter required for :TSInstallFromGrammar
    tree-sitter

  ];

}
