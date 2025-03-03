{ attrs, ... }: {

  imports = [ attrs.nix-index-database.hmModules.nix-index ];
  programs.nix-index-database.comma.enable = true;

}
