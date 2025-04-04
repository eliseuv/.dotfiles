{ config, pkgs, lib, ... }: {

  imports = [
    ./hardware.nix
    ../../hardware/bootloader.nix
    ../../hardware/disks.nix
    ../../hardware/audio.nix
    ../../hardware/network.nix
    ../../hardware/keyboard.nix
    ../../hardware/printing.nix
    ../../environment/default.nix
    ../../desktop/display-manager/sddm.nix
    ../../desktop/window-manager/hyprland.nix
  ];

  # Flakes support
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Hostname
  networking.hostName = "tardis";

  # Disk encryption
  boot.initrd.luks.devices."luks-2ac9cd27-6ff4-4407-9808-c63a5251c44c".device =
    "/dev/disk/by-uuid/2ac9cd27-6ff4-4407-9808-c63a5251c44c";

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Enable num lock early on boot
  boot.initrd.extraUtilsCommands = ''
    copy_bin_and_libs ${pkgs.kbd}/bin/setleds
  '';
  boot.initrd.preDeviceCommands = ''
    INITTY=/dev/tty[1-6]
    for tty in $INITTY; do
      /bin/setleds -D +num < $tty
    done
  '';

  environment.systemPackages = with pkgs;
    [
      # Screen brightness control
      brightnessctl
    ];

  system.stateVersion = "24.11";

}
