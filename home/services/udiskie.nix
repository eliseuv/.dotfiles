{ pkgs, ... }:
{

  services.udiskie = {
    enable = true;
    settings = {
      program_options = {
        # https://github.com/nix-community/home-manager/issues/632#issuecomment-2210425312
        file_manager = "${pkgs.nautilus}/bin/nautilus";
      };
    };
  };

}
