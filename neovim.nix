{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    # Clipboard integration
    xclip
    # Nix LSP
    nixd
  ];

  home.shellAliases = { v = "nvim"; };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # Copy lua config
  home.file = {
    ".config/nvim" = {
      source = ./neovim;
      recursive = true;
    };
  };

}
