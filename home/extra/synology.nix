{ pkgs, ... }:
{

  home.packages = with pkgs; [

    # Synology Drive Client
    synology-drive-client

  ];

}
