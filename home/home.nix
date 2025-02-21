{ overlays, ... }: {

  imports =
    [ ./shell/default.nix ./programs/default.nix ./services/default.nix ];

  home = {
    username = "evf";
    homeDirectory = "/home/evf";
  };

  nix.gc = {
    automatic = true;
    frequency = "daily";
    options = "--delete-older-than 7d";
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
