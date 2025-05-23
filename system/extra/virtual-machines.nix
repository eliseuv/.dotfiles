{ pkgs, ... }:
{

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  programs.virt-manager.enable = true;

  environment.systemPackages = with pkgs; [ quickemu ];

}
