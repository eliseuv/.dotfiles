{ config, pkgs, ... }: {

  imports = [
    ./xmobar/flake.nix
    # Menu
    ./rofi/flake.nix
  ];

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
  home.file.".xmonad/.fehbg".source = ./config/.fehbg;

  # Hide mouse
  services.unclutter.enable = true;

}
