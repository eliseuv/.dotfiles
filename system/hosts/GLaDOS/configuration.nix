{ config, pkgs, ... }: {

  imports = [
    ./hardware.nix
    ../../environment/default.nix
    ../../maintenance/garbage-collection.nix
    ../../maintenance/store-optimisation.nix
    ../../hardware/bootloader.nix
    ../../hardware/disks.nix
    ../../hardware/audio.nix
    ../../hardware/network.nix
    ../../hardware/keyboard.nix
    ../../hardware/printing.nix
    ../../hardware/nvidia.nix
    ../../extra/virtualization.nix
    ../../extra/steam.nix
    ../../desktop/display-manager/lightdm.nix
    ../../desktop/window-manager/xmonad.nix
  ];

  # Flakes support
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Hostname
  networking.hostName = "GLaDOS";

  # Setup monitors
  services.xserver.displayManager.sessionCommands = ''
    ${pkgs.xorg.xrandr}/bin/xrandr \
          --output HDMI-0 --primary --mode 1920x1080 --rate 120 --pos 1080x1080 --rotate normal \
          --output DP-4 --mode 2560x1080 --rate 75 --pos 440x0 --rotate normal \
          --output DP-0 --mode 1920x1080 --pos 0x1080 --rotate left \
          --output DP-1 --off \
          --output DP-2 --off \
          --output DP-3 --off \
          --output DP-5 --off
  '';

  system.stateVersion = "24.11";

}
