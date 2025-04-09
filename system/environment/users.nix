{ pkgs, ... }:
{

  users.users = {

    evf = {
      isNormalUser = true;
      description = "evf";
      extraGroups = [
        "wheel"
        "networkmanager"
        "libvirtd"
      ];
      linger = true;
      packages = with pkgs; [ ];
    };

  };

  nix.settings.trusted-users = [
    "root"
    "@wheel"
  ];

}
