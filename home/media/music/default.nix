{ ... }:
{

  imports = [

    # Music Player Daemon
    ./mpd.nix

    # TUI
    ./ncmpcpp.nix

    # GUI
    ./spotify.nix
  ];

}
