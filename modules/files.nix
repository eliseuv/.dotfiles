{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    # Disk encryption
    cryptsetup
    # File manager
    nautilus
  ];

  services = {

    # Automount volumes
    udiskie = {
      enable = true;
      automount = true;
      tray = "never";
      settings = {
        program_options = {
          # https://github.com/nix-community/home-manager/issues/632#issuecomment-2210425312
          file_manager = "${pkgs.ghostty}/bin/ghostty -e ${pkgs.yazi}/bin/yazi";
        };
      };
    };

    # File syncronization
    syncthing = { enable = true; };

  };

}
