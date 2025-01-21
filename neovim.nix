{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    unzip
    xclip
    clang
    npm
  ];

  home.file = {
    ".config/nvim" = {
      source = ./neovim;
      recursive = true;
    };
  };

  home.
  sessionVariables = {
    EDITOR = "nvim";
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  home.shellAliases = {
    v = "nvim";
  };

}
