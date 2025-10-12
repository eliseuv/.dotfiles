{ pkgs, ... }:
{

  imports = [

    # feh - fast and light image viewer
    ./feh.nix

    # Simple X Image Viewer
    ./sxiv.nix

  ];

  home.packages = with pkgs; [

    # ImageMagick - image manipulation tool
    imagemagick

    # GIMP - GNU Image Manipulation Program
    gimp

  ];

}
