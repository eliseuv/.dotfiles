{ pkgs, ... }: {

  programs.xmobar.enable = true;

  home.packages = with pkgs; [
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
    source = ./xmobar;
    recursive = true;
  };

}
