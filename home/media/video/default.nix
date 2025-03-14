{ pkgs, ... }: {

  imports = [ ./mpv.nix ];

  home.packages = with pkgs; [

    ffmpeg

    ytfzf

  ];

  home.shellAliases.yt = "ytfzf";

  programs.yt-dlp = { enable = true; };

}
