{ pkgs, inputs, ... }:
{

  imports = [ ./mpv.nix ];

  home.packages = with pkgs; [

    ffmpeg

    inputs.yt-x.packages."${system}".default

  ];

  programs.yt-dlp = {
    enable = true;
  };

}
