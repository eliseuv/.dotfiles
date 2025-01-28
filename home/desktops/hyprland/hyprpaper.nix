{ ... }: {

  # Copy wallpapers
  home.file.".wallpapers" = {
    source = ../../../wallpapers;
    recursive = true;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "~/.wallpapers/outrun_vaporwave.jpg" ];
      wallpaper = [ ", ~/.wallpapers/outrun_vaporwave.jpg" ];
    };
  };

}
