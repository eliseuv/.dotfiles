{ config, pkgs, ... }: {

  services.syncthing = {
    enable = true;
    settings = {
      devices = {
        galaxy-A53.id =
          "7IIH4V5-BZAZC7A-JX46YON-TIKGKIJ-X7MFSPQ-C4Q5MMS-RNJAMAY-MSRZDQM";
      };
      folders = {
        "music" = {
          enable = true;
          path = "/run/media/evf/Storage/CompanionCube/music/";
          devices = [ "galaxy-A53" ];
        };
      };
    };
  };

}
