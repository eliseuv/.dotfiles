{ config, pkgs, ... }: {

  imports = [ ../xmonad/rofi/flake.nix ];

  home.packages = with pkgs;
    [
      # # Menu
      # wofi
      # Default terminal
      kitty
    ];

  services.hyprpaper = { enable = true; };
  # Copy Wallpapers
  home.file."wallpapers" = {
    source = ../wallpapers;
    recursive = true;
  };

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  wayland.windowManager.hyprland = { enable = false; };

}
