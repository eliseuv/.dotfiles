{ pkgs, ... }: {

  home.packages = with pkgs;
    [
      # Fonts
      alegreya
      ibm-plex
      symbola
    ] ++ [ cmake gnumake libtool ];

  home.file = {
    ".config/doom" = {
      source = ./doom;
      recursive = true;
    };
  };

  home.sessionPath = [ "$HOME/.config/emacs/bin" ];

  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [ ];
  };

}
