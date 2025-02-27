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

  };

}
