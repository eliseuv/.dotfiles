{ ... }: {

  services.syncthing = {
    enable = true;
    tray = {
      enable = true;
      command = "syncthingtray --wait";
    };
    settings = {

      devices = {

        A53.id =
          "7IIH4V5-BZAZC7A-JX46YON-TIKGKIJ-X7MFSPQ-C4Q5MMS-RNJAMAY-MSRZDQM";

        GLaDOS.id =
          "UX6PZ74-S4VYOHG-ZWPX2ME-2ONFFNN-GWWRYCJ-4S7ZIGW-P3Z3ITG-WWELFAV";

        TARDIS.id =
          "NR7XLUG-MNAFRJS-IKP3EGN-TBHXJMW-YGMDSES-MLPOKYD-I5PJ23K-J7AJZQE";

      };

      folders = {

        "music" = {
          path = "/run/media/evf/Storage/CompanionCube/music";
          devices = [ "GLaDOS" "A53" ];
        };

        "org" = {
          path = "~/Documents/org";
          devices = [ "GLaDOS" "TARDIS" ];
          versioning = {
            type = "simple";
            params.keep = "8";
          };
        };

      };
    };
  };

}
