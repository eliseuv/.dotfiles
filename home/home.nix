{ ... }: {

  imports = [
    ./shell/default.nix
    ./programs/default.nix
    ./services/default.nix
    ./desktop/window-manager/xmonad.nix
    ./desktop/window-manager/hyprland.nix
  ];

  home = {
    username = "evf";
    homeDirectory = "/home/evf";
  };

  nixpkgs.config.allowUnfree = true;

  nix.gc = {
    automatic = true;
    frequency = "daily";
    options = "--delete-older-than 7d";
  };

  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
