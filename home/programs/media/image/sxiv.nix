{ pkgs, ... }: {

  home.packages = with pkgs; [ sxiv ];

  xdg.mimeApps = {
    enable = true;
    associations.added = { "image/*" = [ "sxiv.desktop" ]; };
    defaultApplications = { "image/*" = [ "sxiv.desktop" ]; };
  };

}
