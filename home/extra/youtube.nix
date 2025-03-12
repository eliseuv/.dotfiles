{ pkgs, ... }: {

  home.packages = with pkgs; [ ytfzf ];

  home.shellAliases.yt = "ytfzf";

  programs.yt-dlp = { enable = true; };

}
