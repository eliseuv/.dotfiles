{ ... }: {

  imports =
    [ ./shell/default.nix ./programs/default.nix ./services/default.nix ];

  home = {
    username = "evf";
    homeDirectory = "/home/evf";
  };

  nix.gc = {
    automatic = true;
    options = "--delete-older-than 7d";
    frequency = "daily";
    persistent = true;
    randomizedDelaySec = "45min";
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
