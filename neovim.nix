{ config, pkgs, ... }: {

  home.packages = with pkgs; [ xclip ];

  home.file = {
    ".config/nvim" = {
      source = ./neovim;
      recursive = true;
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  home.shellAliases = { v = "nvim"; };

}
