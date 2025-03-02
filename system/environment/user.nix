{ pkgs, ... }: {

  users.users.evf = {
    isNormalUser = true;
    description = "evf";
    extraGroups = [ "wheel" "networkmanager" "libvirtd" ];
    packages = with pkgs; [ ];
  };

}
