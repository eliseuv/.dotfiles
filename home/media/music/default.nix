{ ... }:
{

  imports = [

    # Music Player Daemon
    ./mpd.nix

    # TUI
    ./ncmpcpp.nix
    ./inori.nix

    # GUI
    ./spotify.nix
  ];

}
