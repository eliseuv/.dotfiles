{ pkgs, ... }: {

  services.displayManager.defaultSession = "none+xmonad";
  services.xserver = {

    # Enable the X11 windowing system.
    enable = true;

    # LightDM
    displayManager.lightdm = {
      enable = true;
      extraConfig = ''
        [Seat:*]
        greeter-setup-script=${pkgs.numlockx}/bin/numlockx on
      '';
    };

    # XMonad
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      extraPackages = hpkgs: [ hpkgs.xmobar ];
    };

  };

}
