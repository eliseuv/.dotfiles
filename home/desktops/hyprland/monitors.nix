{ lib, config, ... }:
let inherit (lib) mkOption types;
in {
  options = {
    monitors = mkOption {
      type = types.listOf (types.submodule {
        options = {
          name = mkOption {
            type = types.str;
            default = "";
            example = "DP-0";
          };
          # Resolution
          width = mkOption {
            type = types.int;
            example = 1920;
          };
          height = mkOption {
            type = types.int;
            example = 1080;
          };
          refreshRate = mkOption {
            type = types.int;
            example = 60;
          };
          # Position
          x = mkOption {
            type = types.int;
            default = 0;
          };
          y = mkOption {
            type = types.int;
            default = 0;
          };
          # Scale
          scale = mkOption {
            type = types.float;
            default = 1;
          };
          # Enable monitor
          enable = mkOption {
            type = types.bool;
            default = true;
          };
        };
      });
      default = [ ];
    };
  };
}
