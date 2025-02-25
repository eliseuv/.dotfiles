{ pkgs, ... }: {

  imports = [

    # Images
    ./image/default.nix

    # Music
    ./music/default.nix

    # Videos
    ./video/default.nix

  ];

}
