{ ... }: {

  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  # Add user to libvirtd group
  users.groups.libvirtd.members = [ "evf" ];

}
