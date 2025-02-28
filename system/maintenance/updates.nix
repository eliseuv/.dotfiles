{ inputs, ... }: {

  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    dates = "daily";
    randomizedDelaySec = "45min";
  };

}
