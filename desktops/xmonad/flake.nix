{ config, pkgs, ... }: {

  imports = [ ./xmobar/flake.nix ./rofi/flake.nix ];

  home.packages = with pkgs; [
    # Status bar
    xmobar
    # Audio mixer
    pulsemixer
  ];

  xsession.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    config = ./config/xmonad.hs;
    libFiles = { "Colors/DoomOne.hs" = ./config/lib/Colors/DoomOne.hs; };
  };

  # Copy Wallpapers
  home.file.".wallpapers" = {
    source = ../wallpapers;
    recursive = true;
  };

  # Hide mouse
  services.unclutter.enable = true;

}
