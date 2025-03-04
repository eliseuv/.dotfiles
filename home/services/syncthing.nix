{ ... }: {

  services.syncthing = {
    enable = true;
    settings = {
      devices = {
        galaxy-A53.id =
          "7IIH4V5-BZAZC7A-JX46YON-TIKGKIJ-X7MFSPQ-C4Q5MMS-RNJAMAY-MSRZDQM";
        GLaDOS.id =
          "UX6PZ74-S4VYOHG-ZWPX2ME-2ONFFNN-GWWRYCJ-4S7ZIGW-P3Z3ITG-WWELFAV";
      };
      folders = {
        "music" = {
          enable = true;
          path = "/run/media/evf/Storage/CompanionCube/music";
          devices = [ "galaxy-A53" ];
        };
      };
    };
  };

}
