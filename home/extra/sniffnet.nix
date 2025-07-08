{ pkgs, ... }:
{

  home.packages = with pkgs; [

    sniffnet

    # dependencies
    libpcap
    alsa-lib
    fontconfig
    gtk3

  ];

}
