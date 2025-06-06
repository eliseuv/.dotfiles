{ config, pkgs, ... }:
{

  imports = [

    # Default terminal
    ../../terminal/kitty.nix

  ];

  home.packages = with pkgs; [

    # Clipboard manager
    copyq

  ];

  # Default terminal
  programs.kitty.enable = true;

  # Hyprland config
  home.file.".config/hypr/hyprland.conf".source = ./hyprland/hyprland.conf;

  # Catppuccin theme
  home.file.".config/hypr/catppuccin" = {
    source = ./hyprland/themes/catppuccin;
    recursive = true;
  };

}
