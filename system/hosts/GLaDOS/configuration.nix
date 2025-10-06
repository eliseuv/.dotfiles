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
    ../../desktop/display-manager/gdm.nix
    ../../desktop/window-manager/gnome.nix
    ../../desktop/window-manager/hyprland.nix
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

  nix.settings.trusted-users = [ "evf" ];

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
    "/run/media/evf/Games" = {
      device = "/dev/disk/by-uuid/07bb429a-3366-448e-8c85-889cea15d1a2";
      fsType = "ext4";
    };
  };

  system.stateVersion = "24.11";

}
