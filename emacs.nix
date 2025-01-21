{ config, pkgs, ... }: {

  home.packages = with pkgs;[
    alegreya
    ibm-plex
    symbola
  ];

  home.file = {
    ".config/doom" = {
      source = ./doom-emacs;
      recursive = true;
    };
  };

  home.sessionPath = [
    "$HOME/.config/emacs/bin"
  ];

  programs.emacs.enable = true;

}
