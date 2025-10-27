{ pkgs, ... }:
let
  retroarchWithCores = (
    pkgs.retroarch.withCores (
      cores: with cores; [

        # GBA
        mgba

        # NES
        nestopia

        # SNES
        snes9x2010

        # N64
        mupen64plus

      ]
    )
  );
in
{

  home.packages = [ retroarchWithCores ];

}
