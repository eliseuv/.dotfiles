{ pkgs, ... }:
{

  # lazy.nvim update alias
  home.shellAliases.lazy-sync = ''nvim --headless "+Lazy! sync" +qa'';

  # lazy.nvim sync
  systemd.user.services.lazynvim-sync = {
    Unit = {
      Description = "Sync lazy.nvim packages";
      Wants = [
        "network.target"
        "nss-lookup.target"
      ];
      After = [
        "network.target"
        "nss-lookup.target"
      ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = ''${pkgs.neovim-unwrapped}/bin/nvim --headless "+Lazy! sync" +qa'';
    };
    Install.WantedBy = [ "default.target" ];
  };

  # lazy.nvim sync timer
  systemd.user.timers.lazynvim-sync = {
    Unit.Description = "Scheduled lazy.nvim sync";
    Timer = {
      # Run after boot
      OnBootSec = "1m";
      # And periodically while system is running
      OnUnitActiveSec = "6h";
      RandomizedDelaySec = "1m";
    };
    Install.WantedBy = [ "timers.target" ];
  };

}
