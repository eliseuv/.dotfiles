{ ... }: {

  systemd.user.timers = {

    # Update lazy.nvim packages
    lazynvim-update = {
      Unit.Description = "Scheduled lazy.nvim update";
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
