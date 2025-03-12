{ pkgs, ... }: {

  imports = [ ./feh.nix ./sxiv.nix ];

  home.packages = with pkgs; [ gimp imagemagick ];

}
