{ config, pkgs, ... }:
{

  imports = [
    ./hardware.nix
    ../../hardware/bootloader.nix
    ../../hardware/disks.nix
    ../../hardware/audio.nix
    ../../hardware/network.nix
    ../../hardware/keyboard.nix
    ../../hardware/printing.nix
    ../../hardware/nvidia.nix
    ../../environment/default.nix
    ../../desktop/window-manager/xmonad.nix
    ../../desktop/display-manager/gdm.nix
    ../../extra/virtual-machines.nix
    ../../extra/docker.nix
    ../../extra/podman.nix
    ../../extra/steam.nix
  ];

  # Flakes support
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Hostname
  networking.hostName = "GLaDOS";

  # Mount disks
  fileSystems = {
    "/run/media/evf/Storage" = {
      device = "/dev/disk/by-uuid/2C22035322032186";
      fsType = "ntfs";
    };
    "/run/media/evf/Research" = {
      device = "/dev/disk/by-uuid/e29cc859-5e69-4dbc-aefa-445ee3da919f";
      fsType = "ext4";
    };
  };

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
