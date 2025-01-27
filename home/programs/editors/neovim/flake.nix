{ pkgs, ... }: {

  home.packages = with pkgs;
    [
      # Clipboard integration
      xclip
    ];

  home.shellAliases = { v = "nvim"; };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # Copy lua config
  home.file = {
    ".config/nvim" = {
      source = ./config;
      recursive = true;
    };
  };

}
