{ inputs, ... }: {

  programs.nh = {
    enable = true;
    flake = ../..;
    clean = {
      enable = true;
      extraArgs = "--keep 8";
      dates = "daily";
    };
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

