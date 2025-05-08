{ ... }:
{

  services.xserver = {

    # Enable the X11 windowing system.
    enable = true;

    # XMonad
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      extraPackages = hpkgs: [ hpkgs.xmobar ];
    };

    # Update the DBus activation environment after launching the desktop manager
    updateDbusEnvironment = true;

  };

  # Set XMonad as default
  services.displayManager.defaultSession = "none+xmonad";

}
