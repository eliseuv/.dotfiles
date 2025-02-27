{ ... }: {

  nix.settings.auto-optimise-store = true;
  nix.optimise = {
    automatic = true;
    persistent = true;
    dates = [ "daily" ];
    randomizedDelaySec = "45min";

  };

}
