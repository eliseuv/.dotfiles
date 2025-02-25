{ pkgs, ... }: {

  imports = [ ./feh.nix ./sxiv.nix ];

  home.packages = with pkgs; [ imagemagick ];

}
