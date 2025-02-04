{ ... }: {

  imports = [ ../wallpapers.nix ];

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "~/.wallpapers/dunes.webp" ];
      wallpaper = [ ", ~/.wallpapers/dunes.webp" ];
    };
  };

}
