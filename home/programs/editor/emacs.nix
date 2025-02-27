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

  # Doom Emacs update
  systemd.user.services.doom-update = {
    Unit.Description = "Update Doom Emacs";
    Service = {
      Type = "oneshot";
      ExecStart = "/home/evf/.config/emacs/bin/doom sync -u --aot --force";
      Environment =
        "PATH=/run/current-system/sw/bin::/home/evf/.nix-profile/bin";
    };
    Install.WantedBy = [ "default.target" ];
  };

  # Doom Emacs gc
  systemd.user.services.doom-gc = {
    Unit.Description = "Garbage collect Doom Emacs";
    Service = {
      Type = "oneshot";
      ExecStart = "/home/evf/.config/emacs/bin/doom gc --force";
      Environment =
        "PATH=/run/current-system/sw/bin::/home/evf/.nix-profile/bin";
    };
    Install.WantedBy = [ "default.target" ];
  };

}
