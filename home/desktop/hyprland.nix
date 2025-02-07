{ ... }: {

  imports = [
    ./window-manager/hyprland.nix
    ./services/hypridle.nix
    ./services/hyprpaper.nix
    ./lock/hyprlock.nix
    ./bar/waybar.nix
    ./menu/rofi.nix
  ];

}
