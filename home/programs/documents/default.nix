{ pkgs, ... }: {

  imports = [ ./calibre.nix ./zathura.nix ];

  home.packages = with pkgs; [ zotero ];

}
