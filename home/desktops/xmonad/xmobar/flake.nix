{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    # xmobar
    xmobar

    # Simple calculator
    bc
    # JSON parser
    jq

    # Fonts
    fira-code
    nerd-fonts.fira-code
    ubuntu-classic
    nerd-fonts.ubuntu
  ];

  # Copy config files
  home.file.".config/xmobar" = {
    source = ./config;
    recursive = true;
  };

}
