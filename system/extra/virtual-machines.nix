{ ... }: {

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  users.groups.libvirtd.members = [ "evf" ];

  programs.virt-manager.enable = true;

}
