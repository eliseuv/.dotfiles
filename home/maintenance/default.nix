{ pkgs, ... }:
{

  imports = [

    # Nix Index database
    ./nix-index-database.nix

    # Clean projects to save space
    ./kondo.nix
  ];

  home.packages = with pkgs; [

    # Nix version diff
    nvd

  ];

  # Periodic garbage collection
  nix.gc = {
    automatic = true;
    options = "--delete-older-than 7d";
    frequency = "weekly";
    persistent = true;
    randomizedDelaySec = "45min";
  };

  # Automatically expire old generations
  services.home-manager.autoExpire = {
    enable = true;
    frequency = "monthly";
    timestamp = "-30 days";
    store = {
      cleanup = true;
      options = "--delete-older-than 30d";
    };
  };

}
