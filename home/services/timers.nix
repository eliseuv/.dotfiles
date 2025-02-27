{ ... }: {

  systemd.user.timers = {

    # lazy.nvim packages update
    lazynvim-sync = {
      Unit.Description = "Scheduled lazy.nvim sync";
      Timer = {
        # Run after boot
        OnBootSec = "1m";
        # And periodically while system is running
        OnUnitActiveSec = "6h";
      };
      Install.WantedBy = [ "timers.target" ];
    };

    # Doom Emacs update
    doom-update = {
      Unit.Description = "Scheduled Doom Emacs update";
      Timer = { OnCalendar = "daily"; };
      Install.WantedBy = [ "timers.target" ];
    };

    # Doom Emacs garbage collection
    doom-gc = {
      Unit.Description = "Scheduled Doom Emacs garbage collection";
      Timer = { OnCalendar = "weekly"; };
      Install.WantedBy = [ "timers.target" ];
    };

  };

}
