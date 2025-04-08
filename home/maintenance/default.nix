{ pkgs, ... }:
{

  imports = [

    # Periodic garbage collection
    ./garbage-collection.nix

    # Nix Index database
    ./nix-index-database.nix

    # Automatically expire old generations
    ./auto-expire.nix
  ];

  home.packages = with pkgs; [

    # Nix version diff
    nvd

  ];

}
