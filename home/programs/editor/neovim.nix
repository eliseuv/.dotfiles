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

  # Copy LazyVim config
  home.file = {
    ".config/nvim" = {
      source = ./LazyVim;
      recursive = true;
    };
  };

}
