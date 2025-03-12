{ pkgs, ... }: {

  imports = [ ./garbage-collection.nix ./nix-index-database.nix ];

  home.packages = with pkgs;
    [

      # Nix version diff
      nvd

    ];

}
