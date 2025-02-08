{ pkgs, ... }: {

  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [ ];
  };

  home.packages = with pkgs; [

    # Spelling
    hunspell

    # Fonts
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
  home.sessionPath = [ "$HOME/.config/emacs/bin" ];

}
