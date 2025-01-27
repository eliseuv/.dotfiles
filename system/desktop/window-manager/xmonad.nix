{ ... }: {

  services.xserver = {

    # Enable the X11 windowing system.
    enable = true;

    # XMonad
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      extraPackages = hpkgs: [ hpkgs.xmobar ];
    };

  };

  # Set XMonad as default
  services.displayManager.defaultSession = "none+xmonad";

}
