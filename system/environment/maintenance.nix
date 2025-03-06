{ inputs, ... }:
let
  nix-gc-env = builtins.fetchGit {
    url = "https://github.com/Julow/nix-gc-env";
    rev = "4753f3c95891b711e29cb6a256807d22e16cf9cd";
  };
in {

  imports = [ (import "${nix-gc-env}/nix_gc_env.nix") ];

  programs.nh = {
    enable = true;
    flake = ../..;
    clean = {
      enable = true;
      extraArgs = "--keep 8";
      dates = "daily";
    };
  };

  # Automatic garbage collection
  nix.gc = {
    automatic = true;
    delete_generations = "+8";
    dates = "daily";
    persistent = true;
    randomizedDelaySec = "45min";
  };

  nix.settings.auto-optimise-store = true;
  nix.optimise = {
    automatic = true;
    persistent = true;
    dates = [ "daily" ];
    randomizedDelaySec = "45min";

  };

  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    dates = "daily";
    randomizedDelaySec = "45min";
  };

}

