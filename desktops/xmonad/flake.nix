{ config, pkgs, ... }: {

  imports = [ ./xmobar/flake.nix ./rofi/flake.nix ];

  home.packages = with pkgs;
    [
      # Audio mixer
      pulsemixer
    ];

  # Copy config files
  home.file.".config/xmonad" = {
    source = ./xmonad;
    recursive = true;
  };

  # Copy Wallpapers
  home.file.".wallpapers" = {
    source = ../wallpapers;
    recursive = true;
  };

  # Hide mouse
  services.unclutter.enable = true;

}
