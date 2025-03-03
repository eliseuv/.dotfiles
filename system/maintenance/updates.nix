{ attrs, ... }: {

  system.autoUpgrade = {
    enable = true;
    flake = attrs.self.outPath;
    dates = "daily";
    randomizedDelaySec = "45min";
  };

}
