{ ... }:
{

  services.syncthing = {
    settings = {
      folders = {

        "music" = {
          path = "/run/media/evf/Storage/CompanionCube/music";
          devices = [
            "GLaDOS"
            "A53"
          ];
        };

        "org" = {
          path = "~/Documents/org";
          devices = [
            "GLaDOS"
            "TARDIS"
          ];
          versioning = {
            type = "simple";
            params.keep = "8";
          };
        };

        "obsidian" = {
          path = "~/Documents/obsidian";
          devices = [
            "GLaDOS"
            "TARDIS"
            "A53"
          ];
        };

      };
    };
  };

}
