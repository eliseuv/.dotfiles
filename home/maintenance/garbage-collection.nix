{ ... }: {

  nix.gc = {
    automatic = true;
    options = "--delete-older-than 7d";
    frequency = "daily";
    persistent = true;
    randomizedDelaySec = "45min";
  };

}
