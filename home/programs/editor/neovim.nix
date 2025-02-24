{ pkgs, ... }: {

  programs.neovim = {
    enable = true;
    package = pkgs.neovim;
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

  # Copy LazyVim config
  home.file = {
    ".config/nvim" = {
      source = ./LazyVim;
      recursive = true;
    };
  };

  # LazyVim update alias
  home.shellAliases.lazy-sync = ''nvim --headless "+Lazy! sync" +qa'';

}
