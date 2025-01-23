{ config, pkgs, ... }: {

  imports = [
    ./hardware.nix
    ../bootloader.nix
    ../garbage-collection.nix
    ../user.nix
    ../keyboard.nix
    ../audio.nix
    ../automount.nix
    ../network.nix
    ../time.nix
    ../locale.nix
    ../virtualization.nix
    ../printing.nix
    ../zsh.nix
    ../gpg.nix
    ../xmonad.nix
    ../packages.nix
  ];

  # Flakes support
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Hostname
  networking.hostName = "GLaDOS";

  # Kernel version
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_6;

  # Setup monitors
  services.xserver.displayManager.sessionCommands = ''
    ${pkgs.xorg.xrandr}/bin/xrandr \
      --output HDMI-1 --primary --mode 1920x1080 --rate 240 --pos 1080x1080 --rotate normal \
      --output DP-2 --mode 2560x1080 --rate 75 --pos 440x0 --rotate normal \
      --output DP-3 --mode 1920x1080 --pos 0x1080 --rotate left \
      --output DP-1 --off \
      --output DP-4 --off \
  '';

  system.stateVersion = "24.11";

}
