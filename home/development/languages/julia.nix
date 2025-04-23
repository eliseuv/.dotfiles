{ lib, pkgs, ... }:
{

  home.packages = with pkgs; [ julia-bin ];

  home.file = {
    # REPL startup script
    ".julia/config/startup.jl".source = ./julia/startup.jl;
    # LSP requirements makefile
    ".julia/environments/nvim-lspconfig/Makefile".source = ./julia/Makefile;
    # Pluto notebook templates
    ".julia/pluto_notebooks/ingredients.jl".source = ./julia/ingredients.jl;
  };

  home.sessionVariables = {
    JULIA_NUM_THREADS = "auto";
  };

  home.shellAliases = {
    julia-env-update = "julia --eval 'using Pkg; Pkg.update()'";
    julia-env-gc = "julia --eval 'using Pkg; Pkg.gc()'";
    pluto-run = "julia --eval 'using Pluto; Pluto.run(launch_browser=false)'";
  };

  # Julia environment update
  systemd.user.services.julia-update = {
    Unit = {
      Description = "Update Julia environment";
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
      ExecStart = ''${lib.getExe pkgs.julia-bin} --eval "using Pkg; Pkg.update()"'';
    };
    Install.WantedBy = [ "default.target" ];
  };

  systemd.user.timers.julia-update = {
    Unit.Description = "Scheduled Julia environment update";
    Timer = {
      OnCalendar = "daily";
      Persistent = true;
    };
    Install.WantedBy = [ "timers.target" ];
  };

}
