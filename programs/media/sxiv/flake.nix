{ config, pkgs, ... }: {

  home.packages = with pkgs; [ sxiv ];

  xdg.mimeApps.defaultApplications = { "image/*" = [ "sxiv.desktop" ]; };

}
