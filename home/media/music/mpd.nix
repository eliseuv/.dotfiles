{ ... }:
{

  imports = [

    # Player clients for MPD
    ./ncmpcpp.nix
    ./inori.nix
    ./rmpc.nix

  ];

  services.mpd = {
    enable = true;
    musicDirectory = "/run/media/evf/Storage/CompanionCube/music";
    playlistDirectory = "/run/media/evf/Storage/CompanionCube/music/playlists";
    extraConfig = ''
      audio_output {
          type    "pulse"
          name    "pulse"
      }

      audio_output {
          type    "fifo"
          name    "Visualizer feed"
          path    "/tmp/mpd.fifo"
          format  "44100:16:2"
      }
    '';
  };

}
