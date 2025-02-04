{ pkgs, ... }: {

  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [ ];
  };

  home.packages = with pkgs;
    [
      # Fonts
      alegreya
      ibm-plex
      symbola
    ] ++ [
      # vterm build dependencies
      cmake
      gnumake
      libtool
    ];

  home.file = {
    ".config/doom" = {
      source = ./doom-emacs;
      recursive = true;
    };
  };
  home.sessionPath = [ "$HOME/.config/emacs/bin" ];

}
