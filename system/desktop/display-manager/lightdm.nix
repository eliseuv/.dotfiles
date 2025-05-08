{ pkgs, ... }:
{

  services.xserver.displayManager.lightdm = {
    enable = true;
    extraConfig = ''
      [Seat:*]
      greeter-setup-script=${pkgs.numlockx}/bin/numlockx on
    '';
  };

}
