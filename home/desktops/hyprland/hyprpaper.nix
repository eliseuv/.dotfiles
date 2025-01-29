{ ... }: {

  # Copy wallpapers
  home.file.".wallpapers" = {
    source = ../../../wallpapers;
    recursive = true;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "~/.wallpapers/dunes.webp" ];
      wallpaper = [ ", ~/.wallpapers/dunes.webp" ];
    };
  };

}
