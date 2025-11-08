{ ... }:
{

  programs.feh = {
    enable = true;
  };

  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "image/jpeg" = [ "feh.desktop" ];
      "image/png" = [ "feh.desktop" ];
    };
    defaultApplications = {
      "image/jpeg" = [ "feh.desktop" ];
      "image/png" = [ "feh.desktop" ];
    };
  };

}
