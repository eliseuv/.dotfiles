{ pkgs, ... }: {

  programs.neovim.enable = true;

  home.shellAliases = {
    v = "nvim";
    vr = "nvim -R";
  };

  home.packages = with pkgs;
    [
      # Clipboard integration
      xclip
    ];

  # Copy LazyVim config
  home.file = {
    ".config/nvim" = {
      source = ./LazyVim;
      recursive = true;
    };
  };

  # LazyVim update alias
  home.shellAliases.lazy-update = ''nvim --headless "+Lazy! sync" +qa'';

}
