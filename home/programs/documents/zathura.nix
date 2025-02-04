{ ... }: {

  programs.zathura = {
    enable = true;
    mappings = { "<C-i>" = "recolor"; };
    extraConfig = ''
      set recolor true
    '';
  };

  xdg.mimeApps = {
    enable = true;
    associations.added = { "application/pdf" = [ "zathura.desktop" ]; };
    defaultApplications = { "application/pdf" = [ "zathura.desktop" ]; };
  };

}
