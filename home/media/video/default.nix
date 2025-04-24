{ pkgs, ... }: {

  imports = [ ./mpv.nix ];

  home.packages = with pkgs; [

    ffmpeg

  ];

  programs.yt-dlp = { enable = true; };

}
