{ config, pkgs, ... }: {

  imports = [ ../xmonad/rofi/flake.nix ];

  home.packages = with pkgs;
    [
      # # Menu
      # wofi
      # Default terminal
      kitty
    ];

  # Catppuccin theme
  home.file.".config/hypr/catpuccin" = {
    source = ./hypr/catppuccin;
    recursive = true;
  };

  # Status bar
  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  # Wallpapers
  services.hyprpaper = { enable = true; };
  home.file."wallpapers" = {
    source = ../wallpapers;
    recursive = true;
  };

  # Lock screen
  services.hypridle = { enable = true; };
  home.file.".config/hypr/hypridle.conf".source = ./hypr/hypridle.conf;
  programs.hyprlock = { enable = true; };
  home.file.".config/hypr/hyprlock.conf".source = ./hypr/hyprlock.conf;

  wayland.windowManager.hyprland = { enable = false; };

}
