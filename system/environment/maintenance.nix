{ inputs, ... }:
{

  # FIXME: Find a way to get rid of this redundant expression
  nixpkgs.config.allowUnfree = true;

  # Nix Helper
  programs.nh = {
    enable = true;
    flake = "/home/evf/.dotfiles";
    clean = {
      enable = true;
      extraArgs = "--keep 8";
      dates = "daily";
    };
  };

  # Automatic store optimisation
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
    flags = [
      "--update-input"
      "nixpkgs"
      "-L"
    ];
    dates = "daily";
    randomizedDelaySec = "45min";
  };

}
