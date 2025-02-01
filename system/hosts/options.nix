{ lib, config, ... }:
let inherit (lib) mkOption types;
in {
  options = {
    host = mkOption {
      type = types.submodule {
        options = {
          hostname = mkOption { type = types.enum [ "GLaDOS" "tardis" ]; };
          class = mkOption { type = lib.types.enum [ "desktop" "notebook" ]; };
          desktop = mkOption { type = lib.types.enum [ "xmonad" "hyprland" ]; };
        };
      };
    };
  };
}
