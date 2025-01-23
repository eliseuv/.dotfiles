{ pkgs, ... }: {

  users.users.evf = {
    isNormalUser = true;
    description = "evf";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
  };

}
