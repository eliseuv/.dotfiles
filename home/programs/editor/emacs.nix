{ pkgs, ... }: {

  programs.emacs.enable = true;

  services.emacs.enable = true;

  home.sessionVariables = {
    EMACS_DIR = "$HOME/.config/emacs";
    DOOM_DIR = "$HOME/.config/doom";
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
