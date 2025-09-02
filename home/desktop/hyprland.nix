{ ... }:
{

  imports = [
    ./window-manager/hyprland.nix
    ./services/hyprpaper.nix
    ./services/hypridle.nix
    ./lock/hyprlock.nix
    ./bar/waybar.nix
    ./menu/rofi.nix
    ./notifications/dunst.nix
  ];

}
