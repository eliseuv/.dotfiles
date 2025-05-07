{ pkgs, ... }:
{

  home.packages = with pkgs; [

    # vterm dependencies
    libtool

    # Spelling
    hunspell

    # Fonts
    alegreya
    ibm-plex
    symbola

  ];

  # # Doom Emacs update
  # systemd.user.services.doom-update = {
  #   Unit.Description = "Update Doom Emacs";
  #   Service = {
  #     Type = "oneshot";
  #     ExecStart = "/home/evf/.config/emacs/bin/doom sync -u --aot --force";
  #     Environment =
  #       "PATH=/run/current-system/sw/bin::/home/evf/.nix-profile/bin";
  #   };
  #   Install.WantedBy = [ "default.target" ];

  # };
  # # Doom Emacs gc
  # systemd.user.services.doom-gc = {
  #   Unit.Description = "Garbage collect Doom Emacs";
  #   Service = {
  #     Type = "oneshot";
  #     ExecStart = "/home/evf/.config/emacs/bin/doom gc --force";
  #     Environment =
  #       "PATH=/run/current-system/sw/bin::/home/evf/.nix-profile/bin";
  #   };
  #   Install.WantedBy = [ "default.target" ];
  # };

  # # Doom Emacs update
  # systemd.user.timers.doom-update = {
  #   Unit = {
  #     Description = "Scheduled Doom Emacs update";
  #     After = "network-online.target";
  #   };
  #   Timer = {
  #     OnCalendar = "daily";
  #   };
  #   Install.WantedBy = [ "timers.target" ];
  # };

  # # Doom Emacs garbage collection
  # systemd.user.timers.doom-gc = {
  #   Unit.Description = "Scheduled Doom Emacs garbage collection";
  #   Timer = { OnCalendar = "weekly"; };
  #   Install.WantedBy = [ "timers.target" ];
  # };

}
