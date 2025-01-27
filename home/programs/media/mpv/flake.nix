{ pkgs, ... }: {

  programs.mpv = {
    enable = true;
    bindings = {
      "Alt+=" = "add video-zoom 0.1";
      "Alt+-" = "add video-zoom -0.1";
      "-" = "add volume -2";
      "=" = "add volume 2";
    };
    config = {
      hwdec = "auto";
      ytdl-raw-options = "force-ipv4=";
    };
    scripts = [ pkgs.mpvScripts.thumbfast pkgs.mpvScripts.mpv-playlistmanager ];
  };

  xdg.mimeApps = {
    enable = true;
    associations.added = { "video/*" = [ "mpv.desktop" ]; };
    defaultApplications = { "video/*" = [ "mpv.desktop" ]; };
  };

}
