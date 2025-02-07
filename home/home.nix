{ ... }: {

  imports =
    [ ./shell/default.nix ./programs/default.nix ./services/default.nix ];

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
