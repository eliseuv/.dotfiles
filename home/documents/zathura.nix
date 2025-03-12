{ ... }: {

  programs.zathura = {
    enable = true;
    mappings = { "<C-i>" = "recolor"; };
    extraConfig = ''
      set recolor true
    '';
  };

  home.sessionVariables.READER = "zathura";

  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "application/pdf" = [ "org.pwmt.zathura-pdf-mupdf.desktop" ];
    };
    defaultApplications = {
      "application/pdf" = [ "org.pwmt.zathura-pdf-mupdf.desktop" ];
    };
  };

}
