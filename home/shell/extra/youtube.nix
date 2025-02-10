{ pkgs, ... }: {

  home.packages = with pkgs; [ yt-dlp ytfzf ];

  home.shellAliases.yt = "ytfzf";

}
