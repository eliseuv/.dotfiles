{ pkgs, ... }:
{

  programs.password-store = {
    enable = true;
  };

  programs.rofi.pass = {
    enable = true;
    package = pkgs.rofi-pass-wayland;
  };

}
