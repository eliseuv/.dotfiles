{ config, pkgs, lib, ... }: {
  imports = [ # Include the results of the hardware scan.
    ./hardware.nix
    ../../bootloader.nix
    ../../garbage-collection.nix
    ../../user.nix
    ../../keyboard.nix
    ../../audio.nix
    ../../automount.nix
    ../../network.nix
    ../../time.nix
    ../../locale.nix
    ../../printing.nix
    ../../zsh.nix
    ../../gpg.nix
    ../../packages.nix
    ../../desktop/hyprland/flake.nix
  ];

  # Flakes support
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Hostname
  networking.hostName = "tardis"; # Define your hostname.

  # Disk encryption
  boot.initrd.luks.devices."luks-2ac9cd27-6ff4-4407-9808-c63a5251c44c".device =
    "/dev/disk/by-uuid/2ac9cd27-6ff4-4407-9808-c63a5251c44c";

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  environment.systemPackages = with pkgs;
    [
      # Screen brightness control
      brightnessctl
    ];

  system.stateVersion = "24.11";

}
