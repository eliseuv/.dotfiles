{ pkgs, ... }:
{

  programs.neovim = {
    enable = true;
  };

  home.shellAliases = {
    v = "nvim";
    vr = "nvim -R";
  };

  home.packages = with pkgs; [

    # Clipboard integration
    xclip

    # Tree-sitter required for :TSInstallFromGrammar
    tree-sitter

  ];

  # Copy LazyVim config
  home.file = {
    ".config/nvim" = {
      source = ./LazyVim;
      recursive = true;
    };
  };

  # lazy.nvim update alias
  home.shellAliases.lazy-sync = ''nvim --headless "+Lazy! sync" +qa'';

  # lazy.nvim sync
  systemd.user.services.lazynvim-sync = {
    Unit.Description = "Sync lazy.nvim packages";
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
    };
    Install.WantedBy = [ "timers.target" ];
  };

}
