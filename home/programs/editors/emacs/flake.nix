{ pkgs, ... }: {

  home.packages = with pkgs; [
    cmakeMinimal
    # Fonts
    alegreya
    ibm-plex
    symbola
  ];

  home.sessionVariables = { CMAKE_C_COMPILER = "${pkgs.gcc}/bin/gcc"; };

  home.file = {
    ".config/doom" = {
      source = ./doom;
      recursive = true;
    };
  };

  home.sessionPath = [ "$HOME/.config/emacs/bin" ];

  programs.emacs.enable = true;

}
